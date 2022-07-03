import 'package:flutter/cupertino.dart';

import 'neon_border_painter.dart';

class NeonBorderAnimation extends StatefulWidget {
  const NeonBorderAnimation(
      {Key? key,
      required this.rectWidth,
      required this.rectHeight,
      required this.isOuter})
      : super(key: key);
  final double rectWidth;
  final double rectHeight;
  final bool isOuter;

  @override
  _NeonBorderState createState() => _NeonBorderState();
}

class _NeonBorderState extends State<NeonBorderAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Tween<double> _stayOff;
  late Tween<double> _turnOn;
  late Tween<double> _turnOff;
  late Tween<double> _turnOnLess;
  late Tween<double> _brighten;

  static const double _turnedOff = 0.2;
  static const double _turnedOn = 1;
  static const double _turnedOnLess = 0.65;

  late Animation<double> _borderAnimation;

  @override
  void initState() {
    super.initState();

    const int _duration = 1501;

    _controller = AnimationController(
        duration: const Duration(milliseconds: _duration), vsync: this);

    _stayOff = Tween<double>(begin: _turnedOff, end: _turnedOff);
    _turnOn = Tween<double>(begin: _turnedOff, end: _turnedOn);
    _turnOff = Tween<double>(begin: _turnedOn, end: _turnedOff);
    _turnOnLess = Tween<double>(begin: _turnedOff, end: _turnedOnLess);
    _brighten = Tween<double>(begin: _turnedOnLess, end: _turnedOn);

    _borderAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: _stayOff, weight: 800 / _duration),
      TweenSequenceItem(tween: _turnOn, weight: 100 / _duration),
      TweenSequenceItem(tween: _turnOff, weight: 1 / _duration),
      TweenSequenceItem(tween: _turnOnLess, weight: 100 / _duration),
      TweenSequenceItem(tween: _brighten, weight: 500 / _duration),
    ]).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _borderAnimation,
      child: CustomPaint(
        painter: NeonBorderPainter(
            rectHeight: widget.rectHeight,
            rectWidth: widget.rectWidth,
            width: MediaQuery.of(context).size.width),
      ),
    );
  }
}
