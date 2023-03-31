import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final Exception? error;

  const DataState({
    this.data,
    this.error,
  });
}

class DataStateSuccess<T> extends DataState<T> {
  const DataStateSuccess(T data) : super(data: data);
}

class DataStateError<T> extends DataState<T> {
  const DataStateError(Exception error) : super(error: error);
}

class DataStateLoading<T> extends DataState<T> {
  const DataStateLoading() : super();
}