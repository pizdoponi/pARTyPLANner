import 'package:flutter/material.dart';

class FakeButton extends StatelessWidget {
  const FakeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Container(),
    );
  }
}
