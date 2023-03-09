import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/blocs/blocs.dart';
import '/models/models.dart';


part 'request_event.dart';
part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {

  final FilterBloc _filterBloc;

  StreamSubscription? _filterSubscription;


  RequestBloc({

    required FilterBloc filterBloc,
  })  :_filterBloc = filterBloc,
      super(RequestLoading()) {
    on<LoadRequests>(_onLoadRequests);
    on<FilterRequests>(_onFilterRequests);
    on<SortRequests>(_onSortRequests);

    _filterSubscription = _filterBloc.stream.listen((state) {
      if (state is FilterLoaded && state.selectedFilter != null) {
        add(
          FilterRequests(
            filter: (state.selectedFilter!),
          ),
        );
      } else {}
    });

  }

  void _onLoadRequests(LoadRequests event,
      Emitter<RequestState> emit,) async {
    await Future<void>.delayed(
      const Duration(seconds: 1),
    );
    emit(RequestLoaded(requests: event.requests));
  }


  void _onFilterRequests(
      FilterRequests event,
      Emitter<RequestState> emit,
      ) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    List<Request> filteredRequests = Request.requests
        .where((request) => request.status == event.filter.status)
        .toList();

    emit(RequestLoaded(requests: filteredRequests));
  }
  void _onSortRequests(
      SortRequests event,
      Emitter<RequestState> emit,
      ) async {
    final state = this.state as RequestLoaded;
    emit(RequestLoading());
    await Future<void>.delayed(const Duration(seconds: 1));

    int newIndex =
    (event.newIndex > event.oldIndex) ? event.newIndex - 1 : event.newIndex;

    try {
      Request selectedRequest = state.requests[event.oldIndex];

      List<Request> sortedRequests = List.from(state.requests)
        ..remove(selectedRequest)
        ..insert(newIndex, selectedRequest);

      emit(
        RequestLoaded(requests: sortedRequests),
      );
    } catch (_) {}
  }
  @override
  Future<void> close() async {
    _filterSubscription?.cancel();
    super.close();
  }
}
