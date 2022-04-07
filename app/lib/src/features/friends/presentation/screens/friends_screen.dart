import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..color = const Color(0xFFbc13fe)
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawRect(
        Rect.fromCenter(center: center, width: 100, height: 20), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: Painter(),
      ),
    );
  }
}
