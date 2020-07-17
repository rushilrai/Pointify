import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rewards_wallet/Pages/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
