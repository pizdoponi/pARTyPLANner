import 'package:flutter/material.dart';

class NeonBorderPainter extends CustomPainter {
  NeonBorderPainter(
      {required this.rectWidth, required this.rectHeight, required this.width});
  final double rectWidth;
  final double rectHeight;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    Offset _center = Offset(size.width / 2, size.height / 2);
    const double spreadValue = 10;
    const double strokeWidth = 1.5;
    final Rect rect =
        Rect.fromCenter(center: _center, width: rectWidth, height: rectHeight);
    final RRect roundedRectangle =
        RRect.fromRectAndRadius(rect, const Radius.circular(10));

    var paint = Paint()
      ..color = Colors.white
      // ..color = AppColors.neonText
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    List shadows = [];
    for (var i = 1; i <= 6; i++) {
      var shadow = Paint()
        ..color = const Color(0xFFbc13fe)
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..maskFilter = MaskFilter.blur(
            BlurStyle.outer, convertRadiusToSigma((i * spreadValue).toDouble()))
        ..strokeCap = StrokeCap.round;
      shadows.add(shadow);
    }

    var stroke = Paint()
      ..color = const Color(0xFFbc13fe)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (var shadow in shadows) {
      canvas.drawRRect(roundedRectangle, shadow);
    }
    canvas.drawRRect(roundedRectangle, stroke);
    //tale more biti vedno zadaj, če ne ga stroke prekrije!
    canvas.drawRRect(roundedRectangle, paint);

//! tole je pripravljena crta cez celo sirino ekrana skoazi znak
//! se mi zdi da je lepo in nujno potrebno za siroke zaslone
//! bi blo pa treba da je do roba => cel seznam mora biti tako sirok kot je zaslon in pol margin na tile
//! plus treba jo je prekint da ne seka znaka
//! lahko pa samo resimo velikost znaka drugace. zdej se ta crta 2x narise ker se ta class klice za vsak border posebi
    // final Rect line =
    // Rect.fromCenter(center: _center, width: width, height: 0.5);

    // for (var shadow in shadows) {
    //   canvas.drawRect(line, shadow);
    // }
    // canvas.drawRect(line, stroke);
    //tale more biti vedno zadaj, če ne ga stroke prekrije!
    // canvas.drawRect(line, paint);
  }

//to je neka flunkcija k blura shadow
  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
