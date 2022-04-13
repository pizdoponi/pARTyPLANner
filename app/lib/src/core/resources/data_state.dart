import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_state.freezed.dart';

@freezed
class DataState<T> with _$DataState<T> {
  const factory DataState.loading() = Loading<T>;
  // const factory DataState.initial() = Initial<T>;
  const factory DataState.data({required T data}) = Data<T>;
  const factory DataState.error([String? message]) = ErrorDetails<T>;
}
