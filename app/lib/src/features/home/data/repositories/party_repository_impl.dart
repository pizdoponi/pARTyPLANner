import 'package:app/src/core/resources/data_state.dart';
import 'package:app/src/core/entities/party.dart';
import 'package:app/src/features/home/domain/repositories/party_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final partyRepositoryProvider = Provider<PartyRepositoryImpl>((ref) {
  return PartyRepositoryImpl();
});

class PartyRepositoryImpl implements PartyRepository {
  @override
  Future<DataState<List<Party>>> getAttendingParties() {
    // TODO: implement getAttendingParties
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<Party>>> getHostedParties() {
    // TODO: implement getHostedParties
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<Party>>> getTrendingParties(int numberOfParties) {
    // TODO: implement getTrendingParties
    throw UnimplementedError();
  }
}
