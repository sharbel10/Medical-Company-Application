import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled11/core/assets/assets.dart';
import 'package:untitled11/view/Login.dart';

import 'login.dart';
import 'on_boarding/onboarding_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).then((value) {
      return Get.offNamed("/onBoarding");
    });

    super.initState();
  }@override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Container(
          child: Image.asset(Assets.splash, fit: BoxFit.cover, height: 800,),
        )

    );
  }
}


