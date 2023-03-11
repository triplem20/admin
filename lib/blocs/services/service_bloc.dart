import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/blocs/blocs.dart';
import '/models/models.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {

  final CategoryBloc _categoryBloc;

  StreamSubscription? _categorySubscription;

  ServiceBloc({

    required CategoryBloc categoryBloc,
  })  :_categoryBloc = categoryBloc,
        super(ServiceLoading()) {
    on<LoadServices>(_onLoadServices);
    on<AddService>(_onAddService);
    on<RemoveService>(_onRemoveService);
    on<FilterServices>(_onFilterServices);
    on<SortServices>(_onSortServices);

    _categorySubscription = _categoryBloc.stream.listen((state) {
      if (state is CategoryLoaded && state.selectedCategory != null) {
        add(
          FilterServices(
            category: (state.selectedCategory!),
          ),
        );
      } else {}
    });

  }

  void _onLoadServices(
      LoadServices event,
      Emitter<ServiceState> emit,
      ) async {
    emit(ServiceLoaded(services: event.services));
  }

  void _onAddService(
      AddService event,
      Emitter<ServiceState> emit,
      ) {
    if (state is ServiceLoaded) {
      List<Service> newServices = List.from((state as ServiceLoaded).services)
        ..add(event.service);


      emit(ServiceLoaded(services: newServices));
    }
  }
  void _onRemoveService(
      RemoveService event,
      Emitter<ServiceState> emit,
      ) {
    final state = this.state;
    if (state is ServiceLoaded) {
      List<Service> newServices = List.from((state as ServiceLoaded).services)
        ..remove(event.service);

      emit(ServiceLoaded(services: newServices));
      }
    }


  void _onFilterServices(
      FilterServices event,
      Emitter<ServiceState> emit,
      ) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    List<Service> filteredServices = Service.services
        .where((service) => service.category == event.category.name)
        .toList();

    emit(ServiceLoaded(services: filteredServices));
  }

  void _onSortServices(
      SortServices event,
      Emitter<ServiceState> emit,
      ) async {
    final state = this.state as ServiceLoaded;
    emit(ServiceLoading());
    await Future<void>.delayed(const Duration(seconds: 1));

    int newIndex =
    (event.newIndex > event.oldIndex) ? event.newIndex - 1 : event.newIndex;

    try {
      Service selectedService = state.services[event.oldIndex];

      List<Service> sortedServices = List.from(state.services)
        ..remove(selectedService)
        ..insert(newIndex, selectedService);

      emit(
        ServiceLoaded(services: sortedServices),
      );
    } catch (_) {}
  }

  @override
  Future<void> close() async {
    _categorySubscription?.cancel();
    super.close();
  }
}
