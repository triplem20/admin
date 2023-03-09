
part of 'filter_bloc.dart';


abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object?> get props => [];
}

class FilterLoading extends FilterState {}

class FilterLoaded extends FilterState {
  final List<Filter> filters;
  final Filter? selectedFilter;

  const FilterLoaded({
    this.filters = const <Filter>[],
    this.selectedFilter,
  });

  @override
  List<Object?> get props => [filters, selectedFilter];
}
