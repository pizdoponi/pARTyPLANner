import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class NullableTile extends StatefulWidget {
  const NullableTile(
      {Key? key, required this.theme, this.title, this.location, this.dateTime})
      : super(key: key);

  final String theme;
  // final Icon icon;
  final String? title;
  final String? location;
  final DateTime? dateTime; 

  @override
  NullableTileState createState() => NullableTileState();
}

class NullableTileState extends State<NullableTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: GlassmorphicContainer(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: double.infinity,
          height: 100,
          borderRadius: 20,
          blur: 20,
          alignment: Alignment.centerLeft,
          border: 2,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFffffff).withOpacity(0.1),
                Color(0xFFFFFFFF).withOpacity(0.05),
              ],
              stops: [
                0.1,
                1,
              ]),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFffffff).withOpacity(0.5),
              Color(0xFFFFFFFF).withOpacity(0.5),
            ],
          ),
          child: Center(
            child: Text(
              widget.theme,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ));
  }
}
