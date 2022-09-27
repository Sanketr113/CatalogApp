import 'package:catalogeapp/Pages/ResetPassword.dart';
import 'package:catalogeapp/Pages/homepage.dart';
import 'package:catalogeapp/Pages/loginpage.dart';
import 'package:catalogeapp/Pages/AboutMe.dart';
import 'package:catalogeapp/Pages/signUp.dart';
import 'package:catalogeapp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(SeeIt());
}

class SeeIt extends StatelessWidget {
  const SeeIt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightBlue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.signUpRoute: (context) => signUp(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.AboutMeRoute: (context) => AboutMe(),
        MyRoutes.ResetPasswordRoute: (context) => ResetPassword(),
      },
    );
  }
}
