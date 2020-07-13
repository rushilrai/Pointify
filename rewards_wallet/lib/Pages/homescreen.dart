import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rewards_wallet/Pages/home.dart';
import 'package:rewards_wallet/Pages/settings.dart';
import 'package:rewards_wallet/colors.dart';
import 'package:rewards_wallet/sizes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

int selectedScreen;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    selectedScreen = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: bgColor,
        statusBarColor: mainColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: (selectedScreen == 0)
              ? FloatingActionButton(
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: displayWidth(context) * 0.09,
                    ),
                  ),
                  elevation: 3,
                  backgroundColor: mainColor,
                  onPressed: null,
                )
              : null,
          backgroundColor: bgColor,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Container(
              height: displayWidth(context) * 0.15,
              child: Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Flexible(
                    flex: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedScreen = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home,
                                size: displayWidth(context) * 0.07,
                                color: (selectedScreen == 0)
                                    ? mainColor
                                    : Colors.black,
                              ),
                              Text('Home'),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedScreen = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.settings,
                                size: displayWidth(context) * 0.07,
                                color: (selectedScreen == 1)
                                    ? mainColor
                                    : Colors.black,
                              ),
                              Text('Settings'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
          body: (selectedScreen == 0) ? HomePage() : SettingsPage(),
        ),
      ),
    );
  }
}
