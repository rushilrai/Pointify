import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rewards_wallet/Pages/homescreen.dart';
import 'package:rewards_wallet/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sk_onboarding_screen/sk_onboarding_model.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SKOnboardingScreen(
        pages: pages,
        bgColor: bgColor,
        themeColor: mainColor,
        skipClicked: (value) {
          noMoreFirstTimeUser(value);
        },
        getStartedClicked: (value) {
          noMoreFirstTimeUser(value);
        },
      ),
    );
  }
}

noMoreFirstTimeUser(value) async {
  SharedPreferences appPref = await SharedPreferences.getInstance();
  appPref.setBool('first_time', false);
  Get.off(
    HomeScreen(),
  );
}

final pages = [
  SkOnboardingModel(
      title: 'Get Started',
      description: 'Click this button to add an Event and Get Started',
      titleColor: Colors.black,
      descripColor: mainColor,
      imagePath: 'assets/onboarding/getstarted.png'),
  SkOnboardingModel(
      title: 'Adding an Event',
      description: 'Select whether Work or Reward and fill in Details',
      titleColor: Colors.black,
      descripColor: mainColor,
      imagePath: 'assets/onboarding/addevent.png'),
  SkOnboardingModel(
      title: 'Points Counter',
      description:
          'The total shows how you have been balancing Work and Life lately',
      titleColor: Colors.black,
      descripColor: mainColor,
      imagePath: 'assets/onboarding/counter.png'),
];
