import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rewards_wallet/Pages/home.dart';
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
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: (selectedScreen == 0) ? Fab() : null,
          backgroundColor: bgColor,
          bottomNavigationBar: BottomAppBar(
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
                                    : Colors.black,
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w400,
                                  color: (selectedScreen == 0)
                                      ? mainColor
                                      : Colors.black,
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
                                    : Colors.black,
                              ),
                              Text(
                                'Settings',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w400,
                                  color: (selectedScreen == 1)
                                      ? mainColor
                                      : Colors.black,
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
  int selected;
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
  @override
  Widget build(BuildContext context) {
    return _SystemPadding(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: displayWidth(context) * 0.8,
        width: displayWidth(context) * 0.85,
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
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            width: displayWidth(context) * 0.3,
                            height: displayWidth(context) * 0.1,
                            decoration: BoxDecoration(
                              color: (selected == 1) ? redColor : bgColor,
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
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            width: displayWidth(context) * 0.3,
                            height: displayWidth(context) * 0.1,
                            decoration: BoxDecoration(
                              color: (selected == 2) ? tealColor : bgColor,
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
                                  labelText: 'Span',
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
                            print('hello');
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
