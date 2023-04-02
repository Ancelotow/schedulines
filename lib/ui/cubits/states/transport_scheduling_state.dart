import 'package:t_paris/domain/models/entities/schedule.dart';
import 'package:t_paris/domain/models/entities/stop_scheduling.dart';

abstract class TransportSchedulingState {
  final List<Schedule>? data;
  final Error? error;

  const TransportSchedulingState({
    this.data,
    this.error,
  });
}

class TransportSchedulingStateSuccess extends TransportSchedulingState {
  const TransportSchedulingStateSuccess(List<Schedule> data) : super(data: data);
}

class TransportSchedulingStateError<T> extends TransportSchedulingState {
  const TransportSchedulingStateError(Error error) : super(error: error);
}

class TransportSchedulingStateLoading<T> extends TransportSchedulingState {
  const TransportSchedulingStateLoading() : super();
}