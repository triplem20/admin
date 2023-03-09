
part of 'request_bloc.dart';


abstract class RequestState extends Equatable {
  const RequestState();

  @override
  List<Object?> get props => [];
}


class RequestLoading extends RequestState {}

class RequestLoaded extends RequestState {
  final List<Request> requests;

  const RequestLoaded({
    this.requests = const <Request>[],
  });

  @override
  List<Object> get props => [requests];
}
