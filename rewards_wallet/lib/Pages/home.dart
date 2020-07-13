import 'package:flutter/material.dart';
import 'package:rewards_wallet/colors.dart';
import 'package:rewards_wallet/sizes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomPaint(
            child: Container(
              height: displayHeight(context) * 0.2,
              width: displayWidth(context),
            ),
            painter: PointsPainter(),
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
