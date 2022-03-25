import 'package:app/src/core/entities/party.dart';
import 'package:flutter/material.dart';
/*
class PartyTile extends StatelessWidget {
  const PartyTile({Key? key, required this.party, required this.color})
      : super(key: key);

  final Party party;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: color, border: Border.all(color: Colors.black, width: 2)),
        height: 100,
        width: MediaQuery.of(context).size.width - 20,
        child: Center(
          child: Text(
            party.name + ": " + party.time.toString(),
            style: const TextStyle(fontSize: 5, color: Colors.lime),
          ),
        ));
  }
}
*/

class PartyTile extends StatelessWidget {
  PartyTile({Key? key, required this.party, required this.color})
      : super(key: key);

  final Party party;
  final Color color;

  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 100,
      height: 50,
      child: Text(party.name + "\n" + party.time.toString()),
    );
  }
}
