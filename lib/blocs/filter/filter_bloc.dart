import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/filter_model.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterLoading()) {
    on<LoadFilters>(_onLoadFilters);
    on<SelectFilter>(_onSelectFilter);
    on<SortFilters>(_onSortFilters);
  }

  void _onLoadFilters(
      LoadFilters event,
      Emitter<FilterState> emit,
      ) async {
    await Future<void>.delayed(
      const Duration(seconds: 1),
    );
    emit(FilterLoaded(filters: event.filters));
  }

  void _onSelectFilter(
      SelectFilter event,
      Emitter<FilterState> emit,
      ) async {
    final state = this.state as FilterLoaded;

    emit(
      FilterLoaded(
        filters: state.filters,
        selectedFilter: event.filter,
      ),
    );
  }

  void _onSortFilters(
      SortFilters event,
      Emitter<FilterState> emit,
      ) async {
    final state = this.state as FilterLoaded;
    emit(FilterLoading());
    await Future<void>.delayed(const Duration(seconds: 1));

    int newIndex =
    (event.newIndex > event.oldIndex) ? event.newIndex - 1 : event.newIndex;

    try {
      Filter selectedFilter = state.filters[event.oldIndex];

      List<Filter> sortedFilters = List.from(state.filters)
        ..remove(selectedFilter)
        ..insert(newIndex, selectedFilter);

      emit(
        FilterLoaded(filters: sortedFilters),
      );
    } catch (_) {}
  }
}
