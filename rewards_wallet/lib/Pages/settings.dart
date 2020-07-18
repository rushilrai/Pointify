import 'package:flutter/material.dart';
import 'package:rewards_wallet/activity.dart';
import 'package:rewards_wallet/colors.dart';
import 'package:rewards_wallet/sizes.dart';
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
                width: displayWidth(context) * 0.35,
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
                          'assets/images/sun.png',
                          width: displayWidth(context) * 0.07,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Light',
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
                      print('hello');
                    },
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: displayWidth(context) * 0.35,
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
                          'assets/images/moon.png',
                          width: displayWidth(context) * 0.07,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Dark',
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
                      print('hello');
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
                        barrierColor: Colors.black54,
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
          borderRadius: BorderRadius.circular(10),
          color: bgColor,
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
