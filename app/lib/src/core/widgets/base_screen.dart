import 'package:app/src/core/widgets/navbar.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key, this.appBar, Widget? child})
      : child = child ?? const SizedBox(),
        super(key: key);

  final Widget child;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          SafeArea(child: child),
          Container(
            child: const Navbar(),
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }
}
