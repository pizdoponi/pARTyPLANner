import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/party_repository.dart';

import '../../../../core/entities/party.dart';

class GetHostedParties implements UseCase<DataState<List<Party>>, void> {
  final PartyRepository _partyRepository;

  GetHostedParties(this._partyRepository);

  @override
  Future<DataState<List<Party>>> call({void params}) {
    return _partyRepository.getHostedParties();
  }
}
