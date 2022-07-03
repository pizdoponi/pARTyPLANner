import 'package:flutter/material.dart';

class BackgroundGradientPage extends StatelessWidget {
  const BackgroundGradientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 53, 41, 66),
                Color.fromARGB(255, 42, 34, 49),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      );
}
