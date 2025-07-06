import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahte/core/helper/error_handler.dart';
import 'package:sahte/features/services/data/repo/repo.dart';
import 'package:sahte/features/services/model/services.dart';
import 'package:sahte/features/services/model/services_request/services_request.dart';

part 'services_cubit.freezed.dart';
part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServicesRepository repo;

  ServicesCubit(this.repo) : super(const ServicesState.initial());

  Future<void> fetchServices() async {
    emit(const ServicesState.loading());
    try {
      final response = await repo.getServices();
      emit(ServicesState.success(response.services));
    } catch (e) {
      emit(ServicesState.failure(ErrorParser.parse(e)));
    }
  }

  Future<void> createService({
    required String name,
    required String price,
  }) async {
    try {
      final request = ServicesRequest(name: name, price: price);
      await repo.createService(request);
      await fetchServices();
    } catch (e) {
      emit(ServicesState.failure(ErrorParser.parse(e)));
    }
  }

  Future<void> updateService({
    required int serviceId,
    required String name,
    required String price,
  }) async {
    try {
      final request = ServicesRequest(name: name, price: price);
      await repo.updateService(serviceId, request);
      await fetchServices();
    } catch (e) {
      emit(ServicesState.failure(ErrorParser.parse(e)));
    }
  }

  Future<void> deleteService({required int serviceId}) async {
    try {
      await repo.deleteService(serviceId);
      await fetchServices();
    } catch (e) {
      emit(ServicesState.failure(ErrorParser.parse(e)));
    }
  }

  void resetState() => emit(const ServicesState.initial());
}
