part of 'request_bloc.dart';

abstract class RequestEvent extends Equatable {
  const RequestEvent();

  @override
  List<Object?> get props => [];
}

class LoadRequests extends RequestEvent {
  final List<Request> requests;

  const LoadRequests({this.requests = const <Request>[]});

  @override
  List<Object?> get props => [requests];
}

class SelectRequest extends RequestEvent {
  final Request? request;

  const SelectRequest(this.request);

  @override
  List<Object?> get props => [request];
}
class FilterRequests extends RequestEvent {
  final Filter filter;

  const FilterRequests({required this.filter});

  @override
  List<Object> get props => [filter];
}

class SortRequests extends RequestEvent {
  final int oldIndex;
  final int newIndex;

  const SortRequests({
    required this.oldIndex,
    required this.newIndex,
  });

  @override
  List<Object> get props => [oldIndex, newIndex];
}




