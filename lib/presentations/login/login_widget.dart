import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:sales_app/common/constants/color_constant.dart';
import 'package:sales_app/common/constants/route_constant.dart';
import 'package:sales_app/common/constants/string_constants.dart';
import 'package:sales_app/presentations/login/bloc/login_bloc.dart';
import 'package:sales_app/presentations/login/bloc/login_event.dart';
import '../../common/widgets/loading_widget.dart';
import '../../common/widgets/progress_listener_widget.dart';
import '../../utils/dimension_utils.dart';
import '../../utils/message_utils.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginWidget> {

  late LoginBloc _bloc;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = context.read();
    registerStreamListener();

    //todo: mock code
    _emailController.text = "tamtm_test02@gmail.com";
    _passwordController.text = "1234567890";
  }

  void registerStreamListener() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _bloc.messageStream.listen((event) {
        MessageUtils.showMessage(context, "Alert!!", event.toString());
      });
    });
  }

  void onPressSignIn() {
    String email = _emailController.text.toString();
    String password = _passwordController.text.toString();

    if (email.isEmpty || password.isEmpty) return;
    _bloc.executeSignIn(LoginEvent(email: email, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConst.PageBackground,
      child: LoadingWidget(
        bloc: _bloc,
        child: SafeArea(
            child: Container(
              constraints: const BoxConstraints.expand(),
              child: LayoutBuilder(builder: (context, constraint) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                        child: ProgressListenerWidget<LoginBloc>(
                          callback: (event) {
                            print(event.runtimeType);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child:
                                      Container(
                                        width: 300,
                                        child: Image(
                                          image: AssetImage("assets/images/ic_food_express.png"),
                                          fit: BoxFit.fitWidth,
                                        )),
                                      ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: DimensionUtils.paddingHeightDivideNumber(context)),
                                      child: _buildEmailTextField(),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: DimensionUtils.paddingHeightDivideNumber(context)),
                                      child: _buildPasswordTextField(),
                                    ),
                                    _buildButtonSignIn(onPressSignIn),
                                  ],
                                ),
                              ),
                              Expanded(child: _buildTextSignUp()),
                              const SizedBox(height: 20),
                            ],
                          ),
                        )),
                  ),
                );
              }),
            )),
      ),
    );
  }

  Widget _buildTextSignUp() {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account!"),
            InkWell(
              onTap: () async {
                try {
                  var data = await Navigator.pushNamed(context, RouteConstant.SIGN_UP) as Map;
                  setState(() {
                    _emailController.text = data["email"];
                    _passwordController.text = data["password"];
                    MessageUtils.showMessage(context, "Alert!!", data["message"]);
                  });
                } catch (e) {
                  MessageUtils.showMessage(context, "Alert!!", e.toString());
                  return;
                }
              },
              child: const Text("Sign Up",
                  style: TextStyle(
                      color: Colors.red, decoration: TextDecoration.underline)),
            )
          ],
        ));
  }

  Widget _buildEmailTextField() {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        maxLines: 1,
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: StringConst.EMAIL,
          labelStyle: const TextStyle(color: Colors.blue),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 1, color: Colors.blue)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 2, color: Colors.blue)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 1, color: Colors.blue)),
          prefixIcon: const Icon(Icons.email, color: Colors.blue),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        maxLines: 1,
        obscureText: true,
        controller: _passwordController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: StringConst.PASSWORD,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 1, color: Colors.blue)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 2, color: Colors.blue)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 1, color: Colors.blue)),
          labelStyle: const TextStyle(color: Colors.white),
          prefixIcon: const Icon(Icons.lock, color: Colors.blue),
        ),
      ),
    );
  }

  Widget _buildButtonSignIn(Function onPress) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(top: 20),
        child: ElevatedButtonTheme(
            data: ElevatedButtonThemeData(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue[500];
                    } else if (states.contains(MaterialState.disabled)) {
                      return Colors.grey;
                    }
                    return Colors.blueAccent;
                  }),
                  elevation: MaterialStateProperty.all(5),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 100)),
                )),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: ElevatedButton(
                child: const Text("Login", style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: () => onPress(),
              ),
            )));
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }


}