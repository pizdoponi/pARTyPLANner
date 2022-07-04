import '../../../../core/entities/user.dart';
import '../../../../core/models/party_model.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/entities/party.dart';
import '../../domain/repositories/party_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

final partyRepositoryProvider = Provider<PartyRepositoryImpl>((ref) {
  return PartyRepositoryImpl(db: FirebaseFirestore.instance);
});

class PartyRepositoryImpl implements PartyRepository {
  final FirebaseFirestore db;

  PartyRepositoryImpl({required this.db});

  @override
  Future<DataState<List<Party>>> getAttendingParties(User user) async {
    List<Party> attendingParties = [];
    CollectionReference parties = db.collection("parties");
    try {
      var snapshot = await parties
          .where("participants", arrayContains: user.username)
          .where("time", isGreaterThan: DateTime.now().millisecondsSinceEpoch)
          .get();
      if (snapshot.docs.isEmpty) {
        return const DataState.emptyData();
      }
      for (var doc in snapshot.docs) {
        PartyModel hostedParty = PartyModel.fromSnapshot(doc);
        attendingParties.add(hostedParty);
      }
      return DataState.data(data: attendingParties);
    } on FirebaseException catch (e) {
      return DataState.error(e.message);
    } catch (e) {
      return DataState.error(e.toString());
    }
  }

  @override
  Future<DataState<List<Party>>> getHostedParties(User user) async {
    List<Party> hostedParties = [];
    CollectionReference parties = db.collection("parties");
    try {
      var snapshot = await parties
          .where("host", isEqualTo: user.username)
          .where("time", isGreaterThan: DateTime.now().millisecondsSinceEpoch)
          .get();
      if (snapshot.docs.isEmpty) {
        return const DataState.emptyData();
      }
      for (var doc in snapshot.docs) {
        PartyModel hostedParty = PartyModel.fromSnapshot(doc);
        hostedParties.add(hostedParty);
      }
      return DataState.data(data: hostedParties);
    } on FirebaseException catch (e) {
      return DataState.error(e.message);
    } catch (e) {
      return DataState.error(e.toString());
    }
  }

  @override
  Future<DataState<List<Party>>> getTrendingParties(int numberOfParties) {
    // TODO: implement getTrendingParties
    throw UnimplementedError();
  }
}
