import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/entities/user.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/repositories/party_repository_impl.dart';
import '../repositories/party_repository.dart';

import '../../../../core/entities/party.dart';

final getAttendingPartiesProvider = Provider<GetAttendingParties>((ref) {
  return GetAttendingParties(ref.watch(partyRepositoryProvider));
});

class GetAttendingParties
    implements UseCase<DataState<List<Party>>, GetAttendingPartiesParams> {
  final PartyRepository _partyRepository;

  GetAttendingParties(this._partyRepository);

  @override
  Future<DataState<List<Party>>> call(GetAttendingPartiesParams params) {
    return _partyRepository.getAttendingParties(params.user);
  }
}

class GetAttendingPartiesParams {
  final User user;
  GetAttendingPartiesParams({required this.user});
}
