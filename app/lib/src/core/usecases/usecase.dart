/// Interface for use cases
abstract class UseCase<T, P> {
  Future<T> call(P params);
}
