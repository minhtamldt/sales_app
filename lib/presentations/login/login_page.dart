import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_app/common/bases/page_container.dart';
import 'package:sales_app/data/remote/repositories/login/login_repositories.dart';
import 'package:sales_app/data/remote/restapi/rest_api.dart';
import 'package:sales_app/presentations/login/bloc/login_bloc.dart';
import 'package:sales_app/presentations/login/login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      providers: [
        Provider(create: (context) => RestApi()),
        ProxyProvider<RestApi, LoginRepository>(
          create: (context) => LoginRepository(),
          update: (_, request, repository) {
            repository ??= LoginRepository();
            repository.setApiRequest(request);
            return repository;
          },
        ),
        ProxyProvider<LoginRepository, LoginBloc>(
          create: (context) => LoginBloc(),
          update: (_, repository, bloc) {
            bloc ??= LoginBloc();
            bloc.setRepository(repository);
            return bloc;
          },
        )
      ],
      child: const LoginWidget()
    );
  }
}