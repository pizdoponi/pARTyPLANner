import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/party_repository.dart';

import '../../../../core/entities/party.dart';

class GetTrendingParties implements UseCase<DataState<List<Party>>, int?> {
  final PartyRepository _partyRepository;
  final int _defaultPartyRequests = 20;

  GetTrendingParties(this._partyRepository);
  @override
  Future<DataState<List<Party>>> call({int? params}) {
    return _partyRepository.getTrendingParties(params ?? _defaultPartyRequests);
  }
}
