import 'package:app/src/config/app_lang.dart';
import 'package:app/src/core/entities/party.dart';
import 'package:app/src/features/home/presentation/widgets/animated_neon_text.dart';
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
      margin: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: attending.length + 1 + trending.length,
        itemBuilder: (context, index) => createTile(context, index),
      ),
    );
  }

  Widget createTile(BuildContext context, int index) {
    var hostingLength = hosting.length;
    var didAttendingDisplay = (hostingLength > 0 ? 1 : 0);
    var attendingLength = attending.length;
    if (index < hostingLength) {
      return PartyTile(party: hosting[index], color: Colors.pink);
    } else if (hostingLength != 0 && index == hostingLength) {
      return const AnimatedNeonText(text: "Attending: ");
    } else if (index < hostingLength + didAttendingDisplay + attendingLength) {
      return PartyTile(
        party: attending[index - (hostingLength + didAttendingDisplay)],
        color: Colors.white,
      );
    } else if (index == hostingLength + didAttendingDisplay + attendingLength) {
      return const AnimatedNeonText(
        text: "Trending: ",
      );
    } else {
      return PartyTile(
          party: trending[index -
              (hostingLength + didAttendingDisplay + attendingLength + 1)],
          color: Colors.blue);
    }
  }

  final List<Party> hosting = [
    Party(
        name: "PARTY 3000",
        time: DateTime(2022, 5, 12, 21, 00),
        participants: []),
    Party(
        name: "PARTY 3001",
        time: DateTime(2022, 5, 11, 21, 00),
        participants: []),
  ];

  final List<Party> attending = [
    Party(
        name: "PARTY 3000",
        time: DateTime(2022, 5, 12, 21, 00),
        participants: []),
    Party(
        name: "PARTY 3001",
        time: DateTime(2022, 5, 11, 21, 00),
        participants: []),
    Party(
        name: "PARTY 1000",
        time: DateTime(2021, 5, 12, 21, 00),
        participants: []),
    Party(
        name: "PARTY 1001",
        time: DateTime(2021, 6, 1, 21, 00),
        participants: []),
    Party(
        name: "PARTY 1022",
        time: DateTime(2022, 5, 12, 11, 30),
        participants: []),
    Party(
        name: "PARTY 1300",
        time: DateTime(2032, 7, 7, 17, 15),
        participants: []),
    Party(
        name: "PARTY 1111",
        time: DateTime(2022, 5, 12, 21, 00),
        participants: []),
    Party(
        name: "PARTY 1000",
        time: DateTime(2021, 5, 12, 21, 00),
        participants: []),
    Party(
        name: "PARTY 1001",
        time: DateTime(2021, 6, 1, 21, 00),
        participants: []),
    Party(
        name: "PARTY 1022",
        time: DateTime(2022, 5, 12, 11, 30),
        participants: []),
    Party(
        name: "PARTY 1300",
        time: DateTime(2032, 7, 7, 17, 15),
        participants: []),
  ];
  final List<Party> trending = [
    Party(
        name: "PARTY 1000",
        time: DateTime(2021, 5, 12, 21, 00),
        participants: []),
    Party(
        name: "PARTY 1001",
        time: DateTime(2021, 6, 1, 21, 00),
        participants: []),
    Party(
        name: "PARTY 1022",
        time: DateTime(2022, 5, 12, 11, 30),
        participants: []),
    Party(
        name: "PARTY 1300",
        time: DateTime(2032, 7, 7, 17, 15),
        participants: []),
    Party(
        name: "PARTY 1111",
        time: DateTime(2022, 5, 12, 21, 00),
        participants: []),
    Party(
        name: "PARTY 1000",
        time: DateTime(2021, 5, 12, 21, 00),
        participants: []),
    Party(
        name: "PARTY 1001",
        time: DateTime(2021, 6, 1, 21, 00),
        participants: []),
    Party(
        name: "PARTY 1022",
        time: DateTime(2022, 5, 12, 11, 30),
        participants: []),
    Party(
        name: "PARTY 1300",
        time: DateTime(2032, 7, 7, 17, 15),
        participants: []),
    Party(
        name: "PARTY 1111",
        time: DateTime(2022, 5, 12, 21, 00),
        participants: []),
  ];
}
