import 'package:app/src/config/app_colors.dart';
import 'package:app/src/config/app_lang.dart';
import 'package:app/src/core/entities/party.dart';
import 'package:app/src/core/resources/data_state.dart';
import 'package:app/src/features/home/data/repositories/party_repository_impl.dart';
import 'package:app/src/features/home/domain/usecases/get_attending_parties.dart';
import 'package:app/src/features/home/presentation/widgets/neon_sign/neon_sign.dart';
import 'package:app/src/features/home/presentation/widgets/party_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Pyrat
// yTrap

// final attendingHasLoadedProvider =
//     StateProvider.autoDispose<bool>((ref) => false);
// final trendingHasLoadedProvider =
//     StateProvider.autoDispose<bool>((ref) => false);

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
    return Container(
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
    );
  }

  Widget createTile(BuildContext context, int index) {
    var hostingLength = hosting.length;
    var didAttendingDisplay = (hostingLength > 0 ? 1 : 0);
    var attendingLength = attending.length;

    if (index < hostingLength) {
      return PartyTile(party: hosting[index], color: AppColors.background);
    } else if (hostingLength != 0 && index == hostingLength) {
      return Container(
        color: AppColors.background,
        height: _textBoxHeight,
        child: NeonSign(text: AppLang.lang.attending),
      );
    } else if (index < hostingLength + didAttendingDisplay + attendingLength) {
      return PartyTile(
        party: attending[index - (hostingLength + didAttendingDisplay)],
        color: AppColors.background,
      );
    } else if (index == hostingLength + didAttendingDisplay + attendingLength) {
      return Container(
          color: AppColors.background,
          height: _textBoxHeight,
          child: NeonSign(text: AppLang.lang.trending));
    } else {
      return PartyTile(
          party: trending[index -
              (hostingLength + didAttendingDisplay + attendingLength + 1)],
          color: AppColors.background);
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

  // final List<Party> hosting = [];

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
