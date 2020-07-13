import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rewards_wallet/Pages/homescreen.dart';
import 'package:rewards_wallet/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void timeUp() {
    Future.delayed(
      Duration(seconds: 2),
      () => Get.offAll(HomeScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    timeUp();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
    );
  }
}
