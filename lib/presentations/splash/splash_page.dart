import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_app/common/constants/preference_key.dart';
import 'package:sales_app/common/constants/route_constant.dart';
import '../../data/datasources/local/cache/app_sharepreference.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override void didChangeDependencies() {
    super.didChangeDependencies();

    Future.delayed(const Duration(seconds: 2),() {
      String token = AppSharePreference.getString(PreferenceKey.TOKEN);
      if (token.isNotEmpty) {
        Navigator.pushReplacementNamed(context, RouteConstant.HOME);
      } else {
        Navigator.pushReplacementNamed(context, RouteConstant.LOGIN);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset('assets/animations/animation_splash.json',
                animate: true, repeat: true),
            const Text("Welcome",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white))
          ],
        ));
  }

}