import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rewards_wallet/Pages/homescreen.dart';
import 'package:rewards_wallet/Pages/onBoarding.dart';
import 'package:rewards_wallet/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'activity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  Hive.registerAdapter(ActivityAdapter());
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  firstTimeCheck();
  runApp(MyApp());
}

bool firstTime;

firstTimeCheck() async {
  SharedPreferences appPref = await SharedPreferences.getInstance();
  firstTime = appPref.getBool('first_time');
  print(firstTime);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: bgColor,
        accentColor: mainColor,
        cardColor: bgColor,
        bottomAppBarColor: bgColor,
        buttonColor: bgColor,
        textSelectionColor: Colors.black,
        canvasColor: bgColor,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: darkColorOne,
        accentColor: mainColor,
        cardColor: darkColorOne,
        bottomAppBarColor: darkColorTwo,
        buttonColor: darkColorThree,
        textSelectionColor: Colors.white,
        canvasColor: darkColorFour,
      ),
      home: FutureBuilder(
        future: Hive.openBox('activity'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
              );
            } else {
              if (firstTime != null && !firstTime) {
                return HomeScreen();
              } else {
                return OnBoarding();
              }
            }
          } else {
            return Scaffold();
          }
        },
      ),
    );
  }
}
