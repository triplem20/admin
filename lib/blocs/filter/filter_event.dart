part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object?> get props => [];
}

class LoadFilters extends FilterEvent {
  final List<Filter> filters;

  const LoadFilters({this.filters = const <Filter>[]});

  @override
  List<Object?> get props => [filters];
}

class SelectFilter extends FilterEvent {
  final Filter? filter;

  const SelectFilter(this.filter);

  @override
  List<Object?> get props => [filter];
}

class SortFilters extends FilterEvent {
  final int oldIndex;
  final int newIndex;

  const SortFilters({
    required this.oldIndex,
    required this.newIndex,
  });

  @override
  List<Object?> get props => [oldIndex, newIndex];
}
