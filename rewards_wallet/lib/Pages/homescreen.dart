import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rewards_wallet/Pages/home.dart';
import 'package:rewards_wallet/colors.dart';
import 'package:rewards_wallet/sizes.dart';

import '../activity.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

int selectedScreen;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    selectedScreen = 0;
    totalPoints();
    fillList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: darkColorOne,
        statusBarColor: mainColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: (selectedScreen == 0) ? Fab() : null,
          bottomNavigationBar: BottomAppBar(
            color: Theme.of(context).bottomAppBarColor,
            shape: CircularNotchedRectangle(),
            child: AnimatedContainer(
              duration: Duration(
                milliseconds: 200,
              ),
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
                        InkResponse(
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
                                    : Theme.of(context).textSelectionColor,
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w400,
                                  color: (selectedScreen == 0)
                                      ? mainColor
                                      : Theme.of(context).textSelectionColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkResponse(
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
                                    : Theme.of(context).textSelectionColor,
                              ),
                              Text(
                                'Settings',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w400,
                                  color: (selectedScreen == 1)
                                      ? mainColor
                                      : Theme.of(context).textSelectionColor,
                                ),
                              ),
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
          body: HomePage(),
        ),
      ),
    );
  }
}

class Fab extends StatefulWidget {
  @override
  _FabState createState() => _FabState();
}

class _FabState extends State<Fab> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Center(
        child: Icon(
          Icons.add,
          size: displayWidth(context) * 0.09,
        ),
      ),
      elevation: 3,
      backgroundColor: mainColor,
      onPressed: () {
        showDialog(
          barrierColor: Colors.black54,
          useSafeArea: true,
          context: context,
          builder: (context) => Center(
            child: AddActivityDialog(),
          ),
        );
      },
    );
  }
}

class AddActivityDialog extends StatefulWidget {
  @override
  _AddActivityDialogState createState() => _AddActivityDialogState();
}

class _AddActivityDialogState extends State<AddActivityDialog> {
  int selected;
  TextEditingController event = TextEditingController();
  TextEditingController points = TextEditingController();
  TextEditingController span = TextEditingController();

  String eventName;
  int pointsCount;
  double spanTime;
  String eventType;
  @override
  void initState() {
    event.addListener(() {
      eventName = event.text;
      print(eventName);
    });
    points.addListener(() {
      if (points.text.length > 0) {
        pointsCount = int.parse(points.text);
      } else {
        pointsCount = 0;
      }
      print(points.text.length);
    });
    span.addListener(() {
      if (span.text.length > 0) {
        spanTime = double.parse(span.text);
      } else {
        spanTime = 0.0;
      }
      print(span.text.length);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _SystemPadding(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: displayWidth(context) * 0.8,
        width: displayWidth(context) * 0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
                    SizedBox(
                      height: displayWidth(context) * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 1;
                              eventType = 'Work';
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            width: displayWidth(context) * 0.3,
                            height: displayWidth(context) * 0.1,
                            decoration: BoxDecoration(
                              color: (selected == 1)
                                  ? redColor
                                  : Theme.of(context).buttonColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 3),
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  'Work',
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: displayWidth(context) * 0.045,
                                    color: (selected == 1) ? bgColor : redColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 2;
                              eventType = 'Reward';
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            width: displayWidth(context) * 0.3,
                            height: displayWidth(context) * 0.1,
                            decoration: BoxDecoration(
                              color: (selected == 2)
                                  ? tealColor
                                  : Theme.of(context).buttonColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 3),
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  'Reward',
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: displayWidth(context) * 0.045,
                                    color:
                                        (selected == 2) ? bgColor : tealColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: displayWidth(context) * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: displayWidth(context) * 0.7,
                          height: displayWidth(context) * 0.13,
                          child: Material(
                            type: MaterialType.transparency,
                            child: TextField(
                              controller: event,
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: mainColor,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: mainColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: mainColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                labelText: 'Event',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelStyle: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  color: mainColor,
                                ),
                              ),
                              cursorColor: mainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: displayWidth(context) * 0.05,
                    ),
                    Container(
                      width: displayWidth(context) * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: displayWidth(context) * 0.2,
                            height: displayWidth(context) * 0.13,
                            child: Material(
                              type: MaterialType.transparency,
                              child: TextField(
                                controller: points,
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  color: mainColor,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Points',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  labelStyle: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    color: mainColor,
                                  ),
                                ),
                                cursorColor: mainColor,
                              ),
                            ),
                          ),
                          Container(
                            width: displayWidth(context) * 0.2,
                            height: displayWidth(context) * 0.13,
                            child: Material(
                              type: MaterialType.transparency,
                              child: TextField(
                                controller: span,
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  color: mainColor,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Hrs',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  labelStyle: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    color: mainColor,
                                  ),
                                ),
                                cursorColor: mainColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: displayWidth(context) * 0.05,
                    ),
                    Container(
                      width: displayWidth(context) * 0.35,
                      height: displayWidth(context) * 0.1,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 3),
                            spreadRadius: 0,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: RaisedButton(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Save',
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: displayWidth(context) * 0.045,
                                    color: bgColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            if (event.text.length == 0) {
                              Get.snackbar(
                                'Error',
                                'Add Event Name',
                                backgroundColor: bgColor,
                                barBlur: 0,
                                borderRadius: 5,
                              );
                            }
                            if (span.text.length == 0) {
                              Get.snackbar(
                                'Error',
                                'Add Duration of Activity',
                                backgroundColor: bgColor,
                                barBlur: 0,
                                borderRadius: 5,
                              );
                            }
                            if (points.text.length == 0) {
                              Get.snackbar(
                                'Error',
                                'Add Points',
                                backgroundColor: bgColor,
                                barBlur: 0,
                                borderRadius: 5,
                              );
                            }
                            if (!(selected == 1 || selected == 2)) {
                              Get.snackbar(
                                'Error',
                                'Select a Type',
                                backgroundColor: bgColor,
                                barBlur: 0,
                                borderRadius: 5,
                              );
                            } else {
                              Activity activity = Activity(
                                  eventName,
                                  (eventType == 'Work')
                                      ? pointsCount
                                      : -pointsCount,
                                  eventType,
                                  spanTime);
                              addActivity(activity);
                              setState(() {
                                fillList();
                                totalPoints();
                                navigator.pop(context);
                              });
                            }
                          },
                          color: mainColor,
                          splashColor: mainColor,
                          disabledColor: bgColor,
                        ),
                      ),
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

/*
Activity activity = Activity(
                                  eventName,
                                  (eventType == 'Work')
                                      ? pointsCount
                                      : -pointsCount,
                                  eventType,
                                  spanTime);
                              addActivity(activity);

                              setState(() {
                                totalPoints();
                                navigator.pop(context);
                              });
                              */
