import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/party_repository.dart';

import '../../../../core/entities/party.dart';

class GetAttendingParties implements UseCase<DataState<List<Party>>, void> {
  final PartyRepository _partyRepository;

  GetAttendingParties(this._partyRepository);

  @override
  Future<DataState<List<Party>>> call({void params}) {
    return _partyRepository.getAttendingParties();
  }
}
