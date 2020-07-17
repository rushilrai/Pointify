import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rewards_wallet/colors.dart';
import 'package:rewards_wallet/sizes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void timeUp() {
    Future.delayed(
      Duration(seconds: 2),
      () => {},
    );
  }

  @override
  void initState() {
    timeUp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: bgColor,
        statusBarColor: bgColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Container(
          color: bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                duration: Duration(milliseconds: 1200),
                tween: Tween<double>(
                  begin: 0,
                  end: 0,
                ),
                builder: (_, double size, __) {
                  return Transform.rotate(
                    angle: size,
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  );
                },
              ),
              TweenAnimationBuilder(
                duration: Duration(seconds: 1),
                tween: Tween<double>(
                  begin: 1,
                  end: 1,
                ),
                builder: (_, double size, __) {
                  return Transform.scale(
                    scale: size,
                    child: Text(
                      'Pointify',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.black54,
                        fontWeight: FontWeight.w800,
                        fontSize: displayWidth(context) * 0.15,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
