import 'neon_text.dart';
import 'package:flutter/material.dart';

class NeonTextAnimation extends StatefulWidget {
  const NeonTextAnimation({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _TextState createState() => _TextState();
}

class _TextState extends State<NeonTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _turnOn;
  late Tween<double> _stayOn;
  late Tween<double> _turnOff;
  late Tween<double> _stayOff;
  late Tween<double> _turnOnLess;
  late Tween<double> _turnOffLess;
  late Tween<double> _turnOnEnd;
  late Tween<double> _brighten;

  static const double _turnedOn = 1;
  static const double _turnedOnLess = 0.8;
  static const double _turnedOnEnd = 0.7;
  static const double _turnedOff = 0.2;

  late Animation<double> _theAnimation;

  @override
  void initState() {
    super.initState();

    const int _duration = 4103;

    _controller = AnimationController(
        duration: const Duration(milliseconds: _duration), //? duration
        vsync: this);

    _turnOn = Tween<double>(begin: _turnedOff, end: _turnedOn);
    _turnOff = Tween<double>(begin: _turnedOn, end: _turnedOff);
    _stayOn = Tween<double>(begin: _turnedOnLess, end: _turnedOnLess);
    _stayOff = Tween<double>(begin: _turnedOff, end: _turnedOff);
    _turnOnLess = Tween<double>(begin: _turnedOff, end: _turnedOnLess);
    _turnOffLess = Tween<double>(begin: _turnedOnLess, end: _turnedOff);
    _turnOnEnd = Tween<double>(begin: _turnedOff, end: _turnedOnLess);
    _brighten = Tween<double>(begin: _turnedOnEnd, end: _turnedOn);

//todo: ko določiš animacijo, se probaj znebiti deljenja v weight
    _theAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(
          tween: _stayOff, weight: 1700 / _duration), //na začeku je ugasnjen
      TweenSequenceItem(tween: _turnOn, weight: 100 / _duration), //se prižge...
      TweenSequenceItem(
          tween: _turnOff,
          weight: 1 / _duration), //... in takoj ugasne (utripne)
      TweenSequenceItem(
          tween: _turnOnLess,
          weight: 100 /
              _duration), //se zares prižge (malo manj sveti, ne dela dobro)
      TweenSequenceItem(
          tween: _stayOn, weight: 1000 / _duration), //je prižgan...
      TweenSequenceItem(
          tween: _turnOffLess, weight: 1 / _duration), //... ammpak ne zadolgo
      TweenSequenceItem(tween: _stayOff, weight: 500 / _duration), //ne dela?!
      TweenSequenceItem(tween: _turnOn, weight: 100 / _duration), //se prižge...
      TweenSequenceItem(tween: _turnOff, weight: 1 / _duration), //... utripne
      TweenSequenceItem(
          tween: _turnOnEnd, weight: 100 / _duration), //ne dela najbolje
      TweenSequenceItem(
          tween: _brighten, weight: 500 / _duration), //dela! yay :)
    ]).animate(_controller);

    //! bo treba ugotovit kdaj se začne animacija, ker se tile naloži že preden pride na ekran. (wait() bi bila zelo grda fuj rešitev)
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) => Opacity(
        opacity: _theAnimation.value, //changable value
        child: NeonText(text: widget.text),
      ),
    );
  }
}
