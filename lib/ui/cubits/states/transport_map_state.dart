import 'package:t_paris/domain/models/entities/line_geo.dart';

abstract class TransportMapState {
  final List<LineGeo>? data;
  final Error? error;

  const TransportMapState({
    this.data,
    this.error,
  });
}

class TransportMapStateSuccess extends TransportMapState {
  const TransportMapStateSuccess(List<LineGeo> data) : super(data: data);
}

class TransportMapStateError extends TransportMapState {
  const TransportMapStateError(Error error) : super(error: error);
}

class TransportMapStateLoading extends TransportMapState {
  const TransportMapStateLoading() : super();
}