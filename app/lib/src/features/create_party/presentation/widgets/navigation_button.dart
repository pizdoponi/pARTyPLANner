import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  NavigationButton(
      {Key? key,
      required this.index,
      required this.pageIndex,
      required this.size,
      required this.gap})
      : super(key: key);

  final int index;
  final int pageIndex;
  double size;
  final double gap;
  late Color fill;
  late Color border;
  // late Color text;

  @override
  Widget build(BuildContext context) {
    if (index == pageIndex) {
      size *= 1.1;
      fill = Colors.white;
      border = Colors.black;
      // text = border;
    } else {
      fill = Colors.black;
      border = Colors.white;
      // text = border;
    }
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.only(top: gap / 2, bottom: gap / 2),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fill,
          border: Border.all(color: border, width: 1)),
      //child: Center(
      //child: Text(index.toString(), style: TextStyle(color: text)),
      // ),
    );
  }
}
