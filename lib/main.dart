import 'package:flutter/material.dart';
import 'package:sales_app/common/constants/route_constant.dart';
import 'package:sales_app/presentations/home/home_page.dart';
import 'package:sales_app/presentations/login/login_page.dart';
import 'package:sales_app/presentations/signup/signup_page.dart';
import 'package:sales_app/presentations/splash/splash_page.dart';

void main() {
  runApp(const SalesApp());
}

class SalesApp extends StatefulWidget {
  const SalesApp({super.key});

  @override
  State<SalesApp> createState() => _SaleAppState();
}

class _SaleAppState extends State<SalesApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sales App",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      initialRoute: RouteConstant.SPLASH,
      routes: {
        RouteConstant.LOGIN :(context) => const LoginPage(),
        RouteConstant.SIGN_UP :(context) => const SignUpPage(),
        RouteConstant.HOME :(context) => const HomePage(),
        RouteConstant.SPLASH :(context) => const SplashPage(),
      },
    );
  }
}