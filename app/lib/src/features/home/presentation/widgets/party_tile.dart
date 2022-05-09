import 'package:app/src/core/entities/party.dart';
import 'package:app/src/features/home/presentation/screens/party_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:glassmorphism/glassmorphism.dart';

class PartyTile extends StatelessWidget {
  PartyTile({Key? key, required this.party}) : super(key: key);

  final Party party;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PartyPage()));
        },
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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      party.name,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.white),
                            children: <TextSpan>[
                          TextSpan(
                              text: "@ ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: party.location)
                        ]))),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            children: <TextSpan>[
                          TextSpan(
                              text:
                                  "${party.time.year.toString()}-${party.time.month.toString().padLeft(2, '0')}-${party.time.day.toString().padLeft(2, '0')} ${party.time.hour.toString().padLeft(2, '0')}:${party.time.minute.toString().padLeft(2, '0')}")
                        ]))),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.grey),
                            children: <TextSpan>[
                          TextSpan(
                              text: "friends and " +
                                  party.participants.length.toString() +
                                  " others")
                        ])))
              ]),
        ));
  }
}
