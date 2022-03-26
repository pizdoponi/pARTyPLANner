import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class backgroundGradientPage extends StatelessWidget {
  const backgroundGradientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
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
