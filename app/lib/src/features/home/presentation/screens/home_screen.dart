import 'package:app/src/config/app_colors.dart';
import 'package:app/src/config/app_lang.dart';
import 'package:app/src/core/entities/party.dart';
import 'package:app/src/core/resources/data_state.dart';
import 'package:app/src/features/home/data/repositories/party_repository_impl.dart';
import 'package:app/src/features/home/domain/usecases/get_attending_parties.dart';
import 'package:app/src/features/home/presentation/widgets/neon_sign/neon_sign.dart';
import 'package:app/src/features/home/presentation/widgets/background.dart';
import 'package:app/src/features/home/presentation/widgets/party_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//NeonSign -> (animation) -> neon stvari
class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const double _textBoxHeight = 100;

  // List<Party> hosting;
  // late Future<DataState<List<Party>>> attending_api = GetAttendingParties(ref.watch(partyRepositoryProvider));
  // List<Party> trending;

  //TODO: ko se zmenimo kakšen bo PartyTile, popravi dno, da bo tudi spodji viden v celoti!
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
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
          margin: const EdgeInsets.all(
              20), //popravi, ko veš kako je naredu krajšek in kolk so velki partytiles
          height: MediaQuery.of(context).size.height, //
          width: MediaQuery.of(context).size.width, //
          child: ListView.builder(
            itemCount: hosting.length +
                (hosting.isNotEmpty ? 1 : 0) +
                attending.length +
                1 +
                trending.length,
            itemBuilder: (context, index) => createTile(context, index),
          ),
        )
      ],
    );
  }

  Widget createTile(BuildContext context, int index) {
    var hostingLength = hosting.length;
    var didAttendingDisplay = (hostingLength > 0 ? 1 : 0);
    var attendingLength = attending.length;

    if (index < hostingLength) {
      return PartyTile(party: hosting[index]);
    } else if (hostingLength != 0 && index == hostingLength) {
      return Container(
        height: _textBoxHeight,
        child: NeonSign(text: AppLang.lang.attending),
      );
    } else if (index < hostingLength + didAttendingDisplay + attendingLength) {
      return PartyTile(
        party: attending[index - (hostingLength + didAttendingDisplay)],
      );
    } else if (index == hostingLength + didAttendingDisplay + attendingLength) {
      return Container(
          height: _textBoxHeight, child: NeonSign(text: AppLang.lang.trending));
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

  // final List<Party> hosting = [];

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
