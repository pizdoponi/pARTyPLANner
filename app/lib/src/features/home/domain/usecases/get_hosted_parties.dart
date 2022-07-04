import '../../../../core/entities/user.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/party_repository.dart';

import '../../../../core/entities/party.dart';

class GetHostedParties
    implements UseCase<DataState<List<Party>>, GetHostedPartiesParams> {
  final PartyRepository _partyRepository;

  GetHostedParties(this._partyRepository);

  @override
  Future<DataState<List<Party>>> call(GetHostedPartiesParams params) {
    return _partyRepository.getHostedParties(params.user);
  }
}

class GetHostedPartiesParams {
  final User user;
  GetHostedPartiesParams({required this.user});
}
