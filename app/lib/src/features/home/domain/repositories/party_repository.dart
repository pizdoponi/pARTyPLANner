import 'package:app/src/core/resources/data_state.dart';

import '../../../../core/entities/party.dart';

abstract class PartyRepository {
  Future<DataState<List<Party>>> getHostedParties();
  Future<DataState<List<Party>>> getAttendingParties();
  Future<DataState<List<Party>>> getTrendingParties(int numberOfParties);
}
