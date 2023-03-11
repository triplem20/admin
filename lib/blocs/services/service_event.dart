part of 'service_bloc.dart';


abstract class ServiceEvent extends Equatable {
  const ServiceEvent();

  @override
  List<Object> get props => [];
}

class LoadServices extends ServiceEvent {
  final List<Service> services;

  const LoadServices({
    this.services = const <Service>[],
  });

  @override
  List<Object> get props => [services];
}

class AddService extends ServiceEvent {
  final Service service;

  const AddService({required this.service});

  @override
  List<Object> get props => [service];
}

class RemoveService extends ServiceEvent {
  final Service service;

  const RemoveService({required this.service});

  @override
  List<Object> get props => [service];
}

class UpdateServices extends ServiceEvent {
  final Service service;

  const UpdateServices({required this.service});

  @override
  List<Object> get props => [service];
}

class FilterServices extends ServiceEvent {
  final Category category;

  const FilterServices({required this.category});

  @override
  List<Object> get props => [category];
}

class SortServices extends ServiceEvent {
  final int oldIndex;
  final int newIndex;

  const SortServices({
    required this.oldIndex,
    required this.newIndex,
  });

  @override
  List<Object> get props => [oldIndex, newIndex];
}
