
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/service_model.dart';
import '../data/service_api.dart';
//part 'service_cubit.freezed.dart';
part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  final ServiceApi api;
  ServiceCubit(this.api) : super(const ServiceState.initial());

  Future<void> fetchServices() async {
    emit(const ServiceState.loading());
    try {
      final response = await api.getServices();
      emit(ServiceState.loaded(response.data));
    } catch (e) {
      emit(ServiceState.error(e.toString()));
    }
  }

  Future<void> createService(String name, String price, int nurseId) async {
    try {
      await api.createService({'name': name, 'price': price, 'nurse_id': nurseId});
      await fetchServices();
    } catch (e) {
      emit(ServiceState.error(e.toString()));
    }
  }

  Future<void> updateService(int id, String name, String price) async {
    try {
      await api.updateService(id, {'name': name, 'price': price});
      await fetchServices();
    } catch (e) {
      emit(ServiceState.error(e.toString()));
    }
  }

  Future<void> deleteService(int id) async {
    try {
      await api.deleteService(id);
      await fetchServices();
    } catch (e) {
      emit(ServiceState.error(e.toString()));
    }
  }
}
