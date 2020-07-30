import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

import 'package:rewards_wallet/activity.dart';
import 'package:rewards_wallet/colors.dart';

import 'package:rewards_wallet/sizes.dart';
import 'package:share/share.dart';

import 'package:url_launcher/url_launcher.dart';
import 'homescreen.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    selectedScreen = 1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: Text(
            'Activity',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              color: bgColor,
              fontSize: displayWidth(context) * 0.06,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: displayWidth(context) * 0.75,
                height: displayWidth(context) * 0.2,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      color: Colors.black26,
                      spreadRadius: -1,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: RaisedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/reset.png',
                          width: displayWidth(context) * 0.07,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Reset Counter',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            color: bgColor,
                            fontSize: displayWidth(context) * 0.06,
                          ),
                        ),
                      ],
                    ),
                    elevation: 100.0,
                    color: mainColor,
                    onPressed: () {
                      showDialog(
                        barrierColor: Colors.black38,
                        useSafeArea: true,
                        context: context,
                        builder: (context) => Center(
                          child: ResetActivityDialog(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: Text(
            'Support',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              color: bgColor,
              fontSize: displayWidth(context) * 0.06,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: displayWidth(context) * 0.36,
                height: displayWidth(context) * 0.2,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      color: Colors.black26,
                      spreadRadius: -1,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: RaisedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.share,
                          size: displayWidth(context) * 0.06,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Share',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            color: bgColor,
                            fontSize: displayWidth(context) * 0.06,
                          ),
                        ),
                      ],
                    ),
                    elevation: 100.0,
                    color: mainColor,
                    onPressed: () {
                      Share.share(
                          "Check out Pointify, https://play.google.com/store/apps/details?id=com.rr.pointify");
                    },
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: displayWidth(context) * 0.36,
                height: displayWidth(context) * 0.2,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      color: Colors.black26,
                      spreadRadius: -1,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: RaisedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_border,
                          size: displayWidth(context) * 0.06,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Rate',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            color: bgColor,
                            fontSize: displayWidth(context) * 0.06,
                          ),
                        ),
                      ],
                    ),
                    elevation: 100.0,
                    color: mainColor,
                    onPressed: () async {
                      await launch(
                          'https://play.google.com/store/apps/details?id=com.rr.pointify');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

        /*  Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: Text(
            'Theme',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              color: bgColor,
              fontSize: displayWidth(context) * 0.06,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: displayWidth(context) * 0.75,
                height: displayWidth(context) * 0.2,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      color: Colors.black26,
                      spreadRadius: -1,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: RaisedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          (systemTheme == true)
                              ? 'assets/images/system.png'
                              : (userTheme == 'Light')
                                  ? 'assets/images/sun.png'
                                  : 'assets/images/moon.png',
                          width: displayWidth(context) * 0.06,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          (systemTheme == true)
                              ? 'System'
                              : (userTheme == 'Light') ? 'Light' : 'Dark',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            color: bgColor,
                            fontSize: displayWidth(context) * 0.06,
                          ),
                        ),
                      ],
                    ),
                    elevation: 100.0,
                    color: mainColor,
                    onPressed: () {
                      showMaterialModalBottomSheet(
                        enableDrag: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        context: context,
                        builder: (context, scrollController) => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            width: displayWidth(context),
                            height: displayWidth(context) * 0.3,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        width: displayWidth(context) * 0.25,
                                        height: displayWidth(context) * 0.2,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 5),
                                              color: Colors.black26,
                                              spreadRadius: -1,
                                              blurRadius: 10,
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: RaisedButton(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/system.png',
                                                  width: displayWidth(context) *
                                                      0.07,
                                                ),
                                              ],
                                            ),
                                            elevation: 100.0,
                                            color: mainColor,
                                            onPressed: () async {
                                              SharedPreferences appPref =
                                                  await SharedPreferences
                                                      .getInstance();
                                              appPref.setBool(
                                                  'systemTheme', true);
                                              Get.changeThemeMode(
                                                  ThemeMode.system);
                                              systemTheme = true;
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        width: displayWidth(context) * 0.25,
                                        height: displayWidth(context) * 0.2,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 5),
                                              color: Colors.black26,
                                              spreadRadius: -1,
                                              blurRadius: 10,
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: RaisedButton(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/moon.png',
                                                  width: displayWidth(context) *
                                                      0.07,
                                                ),
                                              ],
                                            ),
                                            elevation: 100.0,
                                            color: mainColor,
                                            onPressed: () async {
                                              SharedPreferences appPref =
                                                  await SharedPreferences
                                                      .getInstance();
                                              appPref.setBool(
                                                  'systemTheme', false);
                                              appPref.setString(
                                                  'userTheme', 'Dark');
                                              Get.changeThemeMode(
                                                  ThemeMode.dark);
                                              systemTheme = false;
                                              userTheme = 'Dark';
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        width: displayWidth(context) * 0.25,
                                        height: displayWidth(context) * 0.2,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 5),
                                              color: Colors.black26,
                                              spreadRadius: -1,
                                              blurRadius: 10,
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: RaisedButton(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/sun.png',
                                                  width: displayWidth(context) *
                                                      0.07,
                                                ),
                                              ],
                                            ),
                                            elevation: 100.0,
                                            color: mainColor,
                                            onPressed: () async {
                                              SharedPreferences appPref =
                                                  await SharedPreferences
                                                      .getInstance();
                                              appPref.setBool(
                                                  'systemTheme', false);
                                              appPref.setString(
                                                  'userTheme', 'Light');
                                              Get.changeThemeMode(
                                                  ThemeMode.light);
                                              systemTheme = false;
                                              userTheme = 'Light';
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),*/
        /*Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: displayWidth(context) * 0.75,
                height: displayWidth(context) * 0.2,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      color: Colors.black26,
                      spreadRadius: -1,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: RaisedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.monetization_on,
                          size: displayWidth(context) * 0.06,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Basic Support',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            color: bgColor,
                            fontSize: displayWidth(context) * 0.06,
                          ),
                        ),
                      ],
                    ),
                    elevation: 100.0,
                    color: mainColor,
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),*/
      ],
    );
  }
}

class ResetActivityDialog extends StatefulWidget {
  @override
  _ResetActivityDialogState createState() => _ResetActivityDialogState();
}

class _ResetActivityDialogState extends State<ResetActivityDialog> {
  @override
  Widget build(BuildContext context) {
    return _SystemPadding(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: displayWidth(context) * 0.3,
        width: displayWidth(context) * 0.65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: Column(
                  children: [
                    Material(
                      type: MaterialType.transparency,
                      child: Text(
                        'This will delete all activity. The Points counter will be reset.',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w400,
                          color: mainColor,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Material(
                          type: MaterialType.transparency,
                          child: Text(
                            'Press Yes to proceed.',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w600,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: displayWidth(context) * 0.15,
                          height: displayWidth(context) * 0.07,
                          child: FlatButton(
                            color: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onPressed: () {
                              setState(() {
                                Hive.box('activity').clear();
                                activityList.clear();
                                totalPoints();
                                Navigator.pop(context);
                              });
                            },
                            child: Center(
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  color: bgColor,
                                  fontSize: displayWidth(context) * 0.04,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 150),
        child: child);
  }
}
