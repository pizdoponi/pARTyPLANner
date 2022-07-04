import '../../../../core/entities/user.dart';
import '../../../../core/resources/data_state.dart';

import '../../../../core/entities/party.dart';

abstract class PartyRepository {
  Future<DataState<List<Party>>> getHostedParties(User user);
  Future<DataState<List<Party>>> getAttendingParties(User user);
  Future<DataState<List<Party>>> getTrendingParties(int numberOfParties);
}
