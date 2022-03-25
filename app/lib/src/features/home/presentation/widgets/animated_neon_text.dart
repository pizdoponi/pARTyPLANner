import 'package:flutter/material.dart';

class AnimatedNeonText extends StatelessWidget {
  const AnimatedNeonText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        color: Colors.black,
        child: Text(text,
            style: const TextStyle(
              color: Colors.pink,
              fontSize: 45,
            )));
  }
}
