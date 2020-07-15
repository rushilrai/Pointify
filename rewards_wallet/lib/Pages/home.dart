import 'package:flutter/material.dart';
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
      child: Column(
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
                painter: PointsPainter(),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  fontSize: displayWidth(context) * 0.045,
                                  color: redColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          print('hello');
                        },
                        color: bgColor,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                fontSize: displayWidth(context) * 0.045,
                                color: tealColor,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          print('hello');
                        },
                        color: bgColor,
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
                    color: Colors.black,
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
              child: ListView(
                padding: EdgeInsets.all(2),
                children: [
                  Padding(
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
                        color: bgColor,
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
                                  'Reading',
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
                                      '+10',
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        color: redColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: displayWidth(context) * 0.045,
                                      ),
                                    ),
                                    Text(
                                      ' P',
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        color: redColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: displayWidth(context) * 0.045,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
