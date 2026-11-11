import 'package:jdonuts_app/core/failure/app_failure.dart';

sealed class Result<T> {
  const Result();

  R when<R>({
    required R Function(T value) success,
    required R Function(AppFailure failure) failure,
  });
}

final class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;

  @override
  R when<R>({
    required R Function(T value) success,
    required R Function(AppFailure failure) failure,
  }) {
    return success(value);
  }
}

final class Failure<T> extends Result<T> {
  const Failure(this.error);

  final AppFailure error;

  @override
  R when<R>({
    required R Function(T value) success,
    required R Function(AppFailure failure) failure,
  }) {
    return failure(error);
  }
}
