import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahte/nurse/services/data/repo/services_repository.dart';
import 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServicesRepository _repository;

  ServicesCubit(this._repository) : super(ServicesInitial());

  Future<void> fetchServices() async {
    emit(ServicesLoading());

    try {
      final response = await _repository.getServices();

      emit(ServicesSuccess(response.services));
    } catch (e) {
      emit(ServicesFailure(e.toString()));
    }
  }

  Future<void> createService({
    required String name,
    required String price,
  }) async {
    try {
      await _repository.createService(name: name, price: price);

      await fetchServices();
    } catch (e) {
      log("Error creating service: ${e.toString()}");
    }
  }

  Future<void> deleteService({required int serviceId}) async {
    try {
      await _repository.deleteService(id: serviceId);

      await fetchServices();
    } catch (e) {
      log("Error deleting service: ${e.toString()}");
    }
  }

  Future<void> updateService({
    required int serviceId,
    required String name,
    required String price,
  }) async {
    try {
      await _repository.updateService(id: serviceId, name: name, price: price);
      await fetchServices();
    } catch (e) {
      log("Error updating service: ${e.toString()}");
    }
  }
}
