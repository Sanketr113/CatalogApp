import 'dart:ffi';
import 'dart:ui';

import 'package:catalogeapp/Pages/ResetPassword.dart';
import 'package:catalogeapp/Pages/homepage.dart';
import 'package:catalogeapp/Pages/loginpage.dart';
import 'package:catalogeapp/Pages/AboutMe.dart';
import 'package:catalogeapp/Pages/signUp.dart';
import 'package:catalogeapp/utils/routes.dart';
import 'package:catalogeapp/utils/shared.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SeeIt());
  runApp(const SeeIt());
}

class SeeIt extends StatefulWidget {
  const SeeIt({Key? key}) : super(key: key);

  @override
  State<SeeIt> createState() => _SeeItState();
}

class _SeeItState extends State<SeeIt> {
  var isLogin;

  checkUserLoginState() async {
    await Shared.getUserSharedPrefernces().then(
      (value) {
        setState(() {
          isLogin = value;
        });
      },
    );
  }
  

  void iniState() {
    checkUserLoginState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightBlue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser != null
          ? '/HomePage'
          : '/LoginPage',
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
