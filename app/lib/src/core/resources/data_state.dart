/// Provides the state of data.
///
/// At any time data can be in either of the two states:
/// 1. [DataSuccess] when the data was successfully retrieved
/// 2. [DataFailure] when the data failed to retrieve due to [DataState.error]
abstract class DataState<T> {
  final T data;
  final Error? error;

  DataState({required this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess({required T data}) : super(data: data);
}

class DataFailure<T> extends DataState<T> {
  DataFailure({required T data, required Error error})
      : super(data: data, error: error);
}
