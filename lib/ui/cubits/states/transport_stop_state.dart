import 'package:t_paris/domain/models/entities/stop.dart';

abstract class TransportStopState {
  final List<Stop>? data;
  final Error? error;

  const TransportStopState({
    this.data,
    this.error,
  });
}

class TransportStopStateSuccess extends TransportStopState {
  const TransportStopStateSuccess(List<Stop> data) : super(data: data);
}

class TransportStopStateError<T> extends TransportStopState {
  const TransportStopStateError(Error error) : super(error: error);
}

class TransportStopStateLoading<T> extends TransportStopState {
  const TransportStopStateLoading() : super();
}