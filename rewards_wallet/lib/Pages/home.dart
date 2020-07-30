import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:rewards_wallet/Pages/homescreen.dart';
import 'package:rewards_wallet/Pages/settings.dart';
import 'package:rewards_wallet/activity.dart';
import 'package:rewards_wallet/colors.dart';
import 'package:rewards_wallet/sizes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool press = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color:
                (selectedScreen == 0) ? Theme.of(context).cardColor : mainColor,
            borderRadius:
                (selectedScreen == 0) ? null : BorderRadius.circular(10),
            boxShadow: [
              (selectedScreen == 0)
                  ? BoxShadow(
                      offset: Offset(0, 0),
                      color: Colors.transparent,
                    )
                  : BoxShadow(
                      offset: Offset(0, 5),
                      color: Colors.black38,
                      blurRadius: 20,
                      spreadRadius: -5,
                    ),
            ],
          ),
          width: (selectedScreen == 0)
              ? displayWidth(context)
              : displayWidth(context) * 0.85,
          height: (selectedScreen == 0)
              ? displayHeight(context)
              : displayWidth(context) * 1.5,
          duration: Duration(
            milliseconds: 200,
          ),
          child: (selectedScreen == 0)
              ? Column(
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    AspectRatio(
                      aspectRatio: 375 / 128,
                      child: AnimatedContainer(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: -displayWidth(context) * 0.12,
                            offset: Offset(0, displayHeight(context) * 0.05),
                            blurRadius: 8,
                          ),
                        ]),
                        //height: displayHeight(context) * 0.2,
                        width: displayWidth(context),
                        duration: Duration(
                          milliseconds: 300,
                        ),
                        child: CustomPaint(
                          painter:
                              (Theme.of(context).brightness == Brightness.light)
                                  ? PointsPainter()
                                  : PointsPainterDark(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                points.toString(),
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: displayWidth(context) * 0.1,
                                  color: bgColor,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                'assets/images/point.png',
                                width: displayWidth(context) * 0.08,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Container(
                      width: displayWidth(context) * 0.8,
                      child: AspectRatio(
                        aspectRatio: 375 / 65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: displayWidth(context) * 0.35,
                              height: displayWidth(context) * 0.15,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          'assets/images/dumbbell.png',
                                          width: displayWidth(context) * 0.06,
                                        ),
                                        Text(
                                          'Work',
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                displayWidth(context) * 0.045,
                                            color: redColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                                      builder: (context, scrollController) =>
                                          ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          color: Theme.of(context).primaryColor,
                                          width: displayWidth(context),
                                          height: displayWidth(context) * 1.2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Work',
                                                      style: TextStyle(
                                                        fontFamily: 'OpenSans',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: displayWidth(
                                                                context) *
                                                            0.05,
                                                        color: redColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                AspectRatio(
                                                  aspectRatio: 375 / 360,
                                                  child:
                                                      (activityList.length > 0)
                                                          ? ListView.builder(
                                                              physics:
                                                                  BouncingScrollPhysics(),
                                                              itemCount:
                                                                  activityList
                                                                      .length,
                                                              shrinkWrap: true,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2),
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return (activityList[index]
                                                                            .type ==
                                                                        'Work')
                                                                    ? Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(
                                                                          top:
                                                                              7.0,
                                                                          bottom:
                                                                              7.0,
                                                                        ),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () async {
                                                                            await showDialog(
                                                                              barrierColor: Colors.black54,
                                                                              useSafeArea: true,
                                                                              context: context,
                                                                              builder: (context) => Center(
                                                                                child: RedoActivityDialog(
                                                                                  activityList[index].title,
                                                                                  activityList[index].type,
                                                                                  activityList[index].points,
                                                                                  activityList[index].duration,
                                                                                ),
                                                                              ),
                                                                            );
                                                                            await Navigator.pop(context);
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              AnimatedContainer(
                                                                                duration: Duration(
                                                                                  milliseconds: 200,
                                                                                ),
                                                                                height: displayWidth(context) * 0.13,
                                                                                width: displayWidth(context) * 0.7,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      color: Colors.black12,
                                                                                      offset: Offset(0, 3),
                                                                                      spreadRadius: 0,
                                                                                      blurRadius: 5,
                                                                                    ),
                                                                                  ],
                                                                                  color: Theme.of(context).buttonColor,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.only(
                                                                                    left: 10.0,
                                                                                    right: 10.0,
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Text(
                                                                                            activityList[index].title,
                                                                                            style: TextStyle(
                                                                                              fontFamily: 'OpenSans',
                                                                                              color: redColor,
                                                                                              fontWeight: FontWeight.w400,
                                                                                              fontSize: displayWidth(context) * 0.045,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Row(
                                                                                            children: [
                                                                                              Text(
                                                                                                activityList[index].points.toString(),
                                                                                                style: TextStyle(
                                                                                                  fontFamily: 'OpenSans',
                                                                                                  color: redColor,
                                                                                                  fontWeight: FontWeight.w400,
                                                                                                  fontSize: displayWidth(context) * 0.045,
                                                                                                ),
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 5,
                                                                                              ),
                                                                                              Image.asset(
                                                                                                'assets/images/point.png',
                                                                                                width: displayWidth(context) * 0.045,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Spacer(),
                                                                              Icon(
                                                                                Icons.alarm,
                                                                                color: Theme.of(context).textSelectionColor,
                                                                              ),
                                                                              SizedBox(
                                                                                width: 05,
                                                                              ),
                                                                              Text(
                                                                                activityList[index].duration.toString() + 'Hr',
                                                                                style: TextStyle(
                                                                                  fontFamily: 'OpenSans',
                                                                                  color: Theme.of(context).textSelectionColor,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  fontSize: displayWidth(context) * 0.045,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      )
                                                                    : SizedBox(
                                                                        height:
                                                                            0,
                                                                      );
                                                              },
                                                            )
                                                          : Center(
                                                              child: Text(
                                                                'No Events Added',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'OpenSans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color:
                                                                      mainColor,
                                                                ),
                                                              ),
                                                            ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: displayWidth(
                                                              context) *
                                                          0.4,
                                                      height: displayWidth(
                                                              context) *
                                                          0.1,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: RaisedButton(
                                                          child: Center(
                                                            child: Text(
                                                              'Add New',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'OpenSans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: bgColor,
                                                                fontSize:
                                                                    displayWidth(
                                                                            context) *
                                                                        0.04,
                                                              ),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            navigator
                                                                .pop(context);
                                                            showDialog(
                                                              barrierColor:
                                                                  Colors
                                                                      .black54,
                                                              useSafeArea: true,
                                                              context: context,
                                                              builder:
                                                                  (context) =>
                                                                      Center(
                                                                child:
                                                                    AddActivityDialog(),
                                                              ),
                                                            );
                                                          },
                                                          color: mainColor,
                                                          splashColor:
                                                              mainColor,
                                                          disabledColor:
                                                              bgColor,
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
                                  color: Theme.of(context).buttonColor,
                                  splashColor: redColor,
                                  disabledColor: bgColor,
                                ),
                              ),
                            ),
                            Container(
                              width: displayWidth(context) * 0.35,
                              height: displayWidth(context) * 0.15,
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
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        'assets/images/trophy.png',
                                        width: displayWidth(context) * 0.06,
                                      ),
                                      Text(
                                        'Reward',
                                        style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              displayWidth(context) * 0.045,
                                          color: tealColor,
                                        ),
                                      ),
                                    ],
                                  ),
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
                                      builder: (context, scrollController) =>
                                          ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          width: displayWidth(context),
                                          height: displayWidth(context) * 1.2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Reward',
                                                      style: TextStyle(
                                                        fontFamily: 'OpenSans',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: displayWidth(
                                                                context) *
                                                            0.05,
                                                        color: tealColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                AspectRatio(
                                                  aspectRatio: 375 / 360,
                                                  child:
                                                      (activityList.length > 0)
                                                          ? ListView.builder(
                                                              physics:
                                                                  BouncingScrollPhysics(),
                                                              itemCount:
                                                                  activityList
                                                                      .length,
                                                              shrinkWrap: true,
                                                              reverse: false,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2),
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return (activityList[index]
                                                                            .type ==
                                                                        'Reward')
                                                                    ? Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(
                                                                          top:
                                                                              7.0,
                                                                          bottom:
                                                                              7.0,
                                                                        ),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () async {
                                                                            await showDialog(
                                                                              barrierColor: Colors.black54,
                                                                              useSafeArea: true,
                                                                              context: context,
                                                                              builder: (context) => Center(
                                                                                child: RedoActivityDialog(
                                                                                  activityList[index].title,
                                                                                  activityList[index].type,
                                                                                  activityList[index].points,
                                                                                  activityList[index].duration,
                                                                                ),
                                                                              ),
                                                                            );
                                                                            await Navigator.pop(context);
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              AnimatedContainer(
                                                                                duration: Duration(
                                                                                  milliseconds: 200,
                                                                                ),
                                                                                height: displayWidth(context) * 0.13,
                                                                                width: displayWidth(context) * 0.7,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      color: Colors.black12,
                                                                                      offset: Offset(0, 3),
                                                                                      spreadRadius: 0,
                                                                                      blurRadius: 5,
                                                                                    ),
                                                                                  ],
                                                                                  color: Theme.of(context).buttonColor,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.only(
                                                                                    left: 10.0,
                                                                                    right: 10.0,
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Text(
                                                                                            activityList[index].title,
                                                                                            style: TextStyle(
                                                                                              fontFamily: 'OpenSans',
                                                                                              color: tealColor,
                                                                                              fontWeight: FontWeight.w400,
                                                                                              fontSize: displayWidth(context) * 0.045,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Row(
                                                                                            children: [
                                                                                              Text(
                                                                                                activityList[index].points.toString(),
                                                                                                style: TextStyle(
                                                                                                  fontFamily: 'OpenSans',
                                                                                                  color: tealColor,
                                                                                                  fontWeight: FontWeight.w400,
                                                                                                  fontSize: displayWidth(context) * 0.045,
                                                                                                ),
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 5,
                                                                                              ),
                                                                                              Image.asset(
                                                                                                'assets/images/point.png',
                                                                                                width: displayWidth(context) * 0.045,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Spacer(),
                                                                              Icon(
                                                                                Icons.alarm,
                                                                                color: Theme.of(context).textSelectionColor,
                                                                              ),
                                                                              SizedBox(
                                                                                width: 05,
                                                                              ),
                                                                              Text(
                                                                                activityList[index].duration.toString() + 'Hr',
                                                                                style: TextStyle(
                                                                                  fontFamily: 'OpenSans',
                                                                                  color: Theme.of(context).textSelectionColor,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  fontSize: displayWidth(context) * 0.045,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      )
                                                                    : SizedBox(
                                                                        height:
                                                                            0,
                                                                      );
                                                              },
                                                            )
                                                          : Center(
                                                              child: Text(
                                                                'No Events Added',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'OpenSans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color:
                                                                      mainColor,
                                                                ),
                                                              ),
                                                            ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: displayWidth(
                                                              context) *
                                                          0.4,
                                                      height: displayWidth(
                                                              context) *
                                                          0.1,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: RaisedButton(
                                                          child: Center(
                                                            child: Text(
                                                              'Add New',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'OpenSans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: bgColor,
                                                                fontSize:
                                                                    displayWidth(
                                                                            context) *
                                                                        0.04,
                                                              ),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            navigator
                                                                .pop(context);
                                                            showDialog(
                                                              barrierColor:
                                                                  Colors
                                                                      .black54,
                                                              useSafeArea: true,
                                                              context: context,
                                                              builder:
                                                                  (context) =>
                                                                      Center(
                                                                child:
                                                                    AddActivityDialog(),
                                                              ),
                                                            );
                                                          },
                                                          color: mainColor,
                                                          splashColor:
                                                              mainColor,
                                                          disabledColor:
                                                              bgColor,
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
                                  color: Theme.of(context).buttonColor,
                                  splashColor: tealColor,
                                  disabledColor: bgColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Container(
                      width: displayWidth(context) * 0.8,
                      child: Row(
                        children: [
                          Icon(
                            Icons.history,
                            size: displayWidth(context) * 0.05,
                            color: Theme.of(context).textSelectionColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'History',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w600,
                              fontSize: displayWidth(context) * 0.04,
                              color: Theme.of(context).textSelectionColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: displayWidth(context) * 0.8,
                      child: AspectRatio(
                        aspectRatio: 375 / 440,
                        child: (activityList.length > 0)
                            ? ListView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.all(2),
                                itemCount: activityList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      top: 7.0,
                                      bottom: 7.0,
                                    ),
                                    child: AnimatedContainer(
                                      duration: Duration(
                                        milliseconds: 200,
                                      ),
                                      height: displayWidth(context) * 0.13,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0, 3),
                                            spreadRadius: 0,
                                            blurRadius: 5,
                                          ),
                                        ],
                                        color: Theme.of(context).buttonColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10.0,
                                          right: 10.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  activityList[index].title,
                                                  style: TextStyle(
                                                    fontFamily: 'OpenSans',
                                                    color: (activityList[index]
                                                                .type ==
                                                            'Work')
                                                        ? redColor
                                                        : tealColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        displayWidth(context) *
                                                            0.045,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      activityList[index]
                                                          .points
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontFamily: 'OpenSans',
                                                        color:
                                                            (activityList[index]
                                                                        .type ==
                                                                    'Work')
                                                                ? redColor
                                                                : tealColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: displayWidth(
                                                                context) *
                                                            0.045,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Image.asset(
                                                      'assets/images/point.png',
                                                      width: displayWidth(
                                                              context) *
                                                          0.045,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Text(
                                  'No Events Added',
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    color: mainColor,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    SettingsPage(),
                  ],
                ),
        ),
      ),
    );
  }
}

class PointsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = mainColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.square;
    var paint2 = Paint()
      ..color = bgColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.square;

    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: size.width * 0.8,
            height: size.height * 0.9,
          ),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        paint);

    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.8),
      size.width * 0.027,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.6),
      size.width * 0.027,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.4),
      size.width * 0.027,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.2),
      size.width * 0.027,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.8),
      size.width * 0.027,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.6),
      size.width * 0.027,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.4),
      size.width * 0.027,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.2),
      size.width * 0.027,
      paint2,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class PointsPainterDark extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = mainColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.square;
    var paint2 = Paint()
      ..color = darkColorOne
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.square;

    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: size.width * 0.8,
            height: size.height * 0.9,
          ),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        paint);

    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.8),
      size.width * 0.027,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.6),
      size.width * 0.027,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.4),
      size.width * 0.027,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.2),
      size.width * 0.027,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.8),
      size.width * 0.027,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.6),
      size.width * 0.027,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.4),
      size.width * 0.027,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.2),
      size.width * 0.027,
      paint2,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class RedoActivityDialog extends StatefulWidget {
  String eventName;
  String eventType;
  int pointsCount;
  double eventDuration;
  RedoActivityDialog(
    this.eventName,
    this.eventType,
    this.pointsCount,
    this.eventDuration,
  );
  @override
  _RedoActivityDialogState createState() => _RedoActivityDialogState(
        eventName,
        eventType,
        pointsCount,
        eventDuration,
      );
}

class _RedoActivityDialogState extends State<RedoActivityDialog> {
  String eventName;
  String eventType;
  int pointsCount;
  double eventDuration;
  _RedoActivityDialogState(
    this.eventName,
    this.eventType,
    this.pointsCount,
    this.eventDuration,
  );
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
                    Row(
                      children: [
                        Material(
                          type: MaterialType.transparency,
                          child: Text(
                            'This Activity will be added again',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w400,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ],
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
                              Activity activity = Activity(
                                eventName,
                                pointsCount,
                                eventType,
                                eventDuration,
                              );
                              addActivity(activity);
                              setState(() {
                                fillList();
                                totalPoints();
                                navigator.pop(context);
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
