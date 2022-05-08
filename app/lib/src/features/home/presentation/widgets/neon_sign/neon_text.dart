import 'package:app/src/config/app_colors.dart';
import 'package:flutter/material.dart';

class NeonText extends StatelessWidget {
  const NeonText({Key? key, required this.text}) : super(key: key);

  final String text;
  static const color = AppColors.neonText;
  static const double fontSize = 30;
  static const double letterSpacing = 5;

  @override
  Widget build(BuildContext context) {
    TextStyle strokeStyle = TextStyle(
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = color,
      fontFamily: "Neonlights",
    );

    TextStyle glowStyle = const TextStyle(
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      shadows: [
        BoxShadow(
          color: color,
          blurRadius: 1.0,
          spreadRadius: 1.0,
        ),
        BoxShadow(
          color: color,
          blurRadius: 30.0,
          spreadRadius: 30.0,
        ),
        BoxShadow(
          color: color,
          blurRadius: 30.0,
          spreadRadius: 2.0,
        ),
        BoxShadow(
          color: color,
          blurRadius: 200.0,
          spreadRadius: 200.0,
        ),
      ],
      color: Colors.white,
      fontFamily: "Neonlights",
    );

    return Stack(alignment: Alignment.center, children: [
      Text(text, style: strokeStyle),
      // Text(text, style: GoogleFonts.megrim(textStyle: strokeStyle)),
      // Text(text, style: GoogleFonts.megrim(textStyle: glowStyle))
      Text(text, style: glowStyle)
    ]);
  }
}
