import 'dart:ui';

import 'package:app/src/config/app_lang.dart';
import 'package:app/src/core/entities/party.dart';
import 'package:app/src/features/home/presentation/widgets/animated_neon_text.dart';
import 'package:app/src/features/home/presentation/widgets/background.dart';
import 'package:app/src/features/home/presentation/widgets/party_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  // List<Party> hosting;
  // List<Party> attending;
  // List<Party> trending;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Container(
          child: backgroundGradientPage(),
        ),
        Container(
          margin: const EdgeInsets.only(top: 100),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(300),
                  topRight: Radius.circular(300)),
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 40, 89, 182).withOpacity(0.5),
                  spreadRadius: 70,
                  blurRadius: 100,
                ),
                BoxShadow(
                  color: Color.fromARGB(255, 11, 29, 195).withOpacity(0.3),
                  spreadRadius: -4,
                  blurRadius: 100,
                )
              ]),
          height: 200,
          width: 100,
        ),
        Container(
          width: 250,
          height: 250,
          margin: const EdgeInsets.only(top: 380, left: 129),
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: Color.fromARGB(199, 114, 55, 153).withOpacity(0.3),
              spreadRadius: 70,
              blurRadius: 1000,
            ),
            BoxShadow(
              color: Color.fromARGB(201, 125, 26, 190).withOpacity(0.2),
              spreadRadius: -1,
              blurRadius: 100,
            )
          ]),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: attending.length + 1 + trending.length,
            itemBuilder: (context, index) => createTile(context, index),
          ),
        ),
      ],
    ));
  }

  Widget createTile(BuildContext context, int index) {
    var hostingLength = hosting.length;
    var didAttendingDisplay = (hostingLength > 0 ? 1 : 0);
    var attendingLength = attending.length;
    if (index < hostingLength) {
      return PartyTile(party: hosting[index]);
    } else if (hostingLength != 0 && index == hostingLength) {
      return const AnimatedNeonText(text: "Attending: ");
    } else if (index < hostingLength + didAttendingDisplay + attendingLength) {
      return PartyTile(
        party: attending[index - (hostingLength + didAttendingDisplay)],
        );
    } else if (index == hostingLength + didAttendingDisplay + attendingLength) {
      return const AnimatedNeonText(
        text: "Trending: ",
      );
    } else {
      return PartyTile(
          party: trending[index -
              (hostingLength + didAttendingDisplay + attendingLength + 1)],
      );
    }
  }

  final List<Party> hosting = [
    Party(
        name: "PARTY 3000",
        time: DateTime(2022, 5, 12, 21, 00),
        participants: [],
        location: "Ljubljana",
        theme: "Clubbing"),
    Party(
        name: "PARTY 3001",
        time: DateTime(2022, 5, 11, 21, 00),
        participants: [],
        location: "Maribor",
        theme: "Birthday"),
    Party(
        name: "PARTY 1000",
        time: DateTime(2021, 5, 12, 21, 00),
        participants: [],
        location: "Celje",
        theme: "Cocktail Party"),
  ];

  final List<Party> attending = [
    Party(
        name: "PARTY 3000",
        time: DateTime(2022, 5, 12, 21, 00),
        participants: [],
        location: "Ljubljana",
        theme: "Clubbing"),
    Party(
        name: "PARTY 3001",
        time: DateTime(2022, 5, 11, 21, 00),
        participants: [],
        location: "Maribor",
        theme: "Birthday"),
    Party(
        name: "PARTY 1000",
        time: DateTime(2021, 5, 12, 21, 00),
        participants: [],
        location: "Celje",
        theme: "Cocktail Party"),
    Party(
        name: "PARTY 3000",
        time: DateTime(2022, 5, 12, 21, 00),
        participants: [],
        location: "Ljubljana",
        theme: "Clubbing"),
    Party(
        name: "PARTY 3001",
        time: DateTime(2022, 5, 11, 21, 00),
        participants: [],
        location: "Maribor",
        theme: "Birthday"),
    Party(
        name: "PARTY 1000",
        time: DateTime(2021, 5, 12, 21, 00),
        participants: [],
        location: "Celje",
        theme: "Cocktail Party"),
   Party(
        name: "PARTY 3000",
        time: DateTime(2022, 5, 12, 21, 00),
        participants: [],
        location: "Ljubljana",
        theme: "Clubbing"),
    Party(
        name: "PARTY 3001",
        time: DateTime(2022, 5, 11, 21, 00),
        participants: [],
        location: "Maribor",
        theme: "Birthday"),
    Party(
        name: "PARTY 1000",
        time: DateTime(2021, 5, 12, 21, 00),
        participants: [],
        location: "Celje",
        theme: "Cocktail Party"),
    Party(
        name: "PARTY 3000",
        time: DateTime(2022, 5, 12, 21, 00),
        participants: [],
        location: "Ljubljana",
        theme: "Clubbing"),
    Party(
        name: "PARTY 3001",
        time: DateTime(2022, 5, 11, 21, 00),
        participants: [],
        location: "Maribor",
        theme: "Birthday"),
    Party(
        name: "PARTY 1000",
        time: DateTime(2021, 5, 12, 21, 00),
        participants: [],
        location: "Celje",
        theme: "Cocktail Party"),
  ];
  final List<Party> trending = [
    Party(
        name: "PARTY 3000",
        time: DateTime(2022, 5, 12, 21, 00),
        participants: [],
        location: "Ljubljana",
        theme: "Clubbing"),
    Party(
        name: "PARTY 3001",
        time: DateTime(2022, 5, 11, 21, 00),
        participants: [],
        location: "Maribor",
        theme: "Birthday"),
    Party(
        name: "PARTY 1000",
        time: DateTime(2021, 5, 12, 21, 00),
        participants: [],
        location: "Celje",
        theme: "Cocktail Party"),
    Party(
        name: "PARTY 3000",
        time: DateTime(2022, 5, 12, 21, 00),
        participants: [],
        location: "Ljubljana",
        theme: "Clubbing"),
    Party(
        name: "PARTY 3001",
        time: DateTime(2022, 5, 11, 21, 00),
        participants: [],
        location: "Maribor",
        theme: "Birthday"),
    Party(
        name: "PARTY 1000",
        time: DateTime(2021, 5, 12, 21, 00),
        participants: [],
        location: "Celje",
        theme: "Cocktail Party"),
   Party(
        name: "PARTY 3000",
        time: DateTime(2022, 5, 12, 21, 00),
        participants: [],
        location: "Ljubljana",
        theme: "Clubbing"),
    Party(
        name: "PARTY 3001",
        time: DateTime(2022, 5, 11, 21, 00),
        participants: [],
        location: "Maribor",
        theme: "Birthday"),
    Party(
        name: "PARTY 1000",
        time: DateTime(2021, 5, 12, 21, 00),
        participants: [],
        location: "Celje",
        theme: "Cocktail Party"),
  ];
}
