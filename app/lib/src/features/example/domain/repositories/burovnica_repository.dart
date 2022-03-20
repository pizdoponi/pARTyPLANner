import 'package:app/src/core/resources/data_state.dart';
import 'package:app/src/features/example/domain/entities/buuurovnica.dart';

abstract class BurovnicaRepository {
  Future<DataState<Buuurovnica>> getBurovnicaByName(String name);
  Future<DataState<Buuurovnica>> getRandomBurovnica();
}
