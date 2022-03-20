import 'package:app/src/core/resources/data_state.dart';
import 'package:app/src/core/usecases/usecase.dart';
import 'package:app/src/features/example/domain/entities/buuurovnica.dart';
import 'package:app/src/features/example/domain/repositories/burovnica_repository.dart';

class GetBurovnicaByName implements UseCase<Buuurovnica, String> {
  final BurovnicaRepository _burovnicaRepository;

  GetBurovnicaByName(this._burovnicaRepository);

  @override
  Future<Buuurovnica> call({String? params}) async {
    DataState<Buuurovnica> state =
        await _burovnicaRepository.getBurovnicaByName(params!);
    if (state is DataFailure) {
      throw state.error!;
    } else {
      return state.data;
    }
  }
}
