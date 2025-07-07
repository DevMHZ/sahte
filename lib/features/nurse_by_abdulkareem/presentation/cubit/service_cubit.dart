import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:sahte/features/nurse_by_abdulkareem/model/service_request.dart';
import 'package:sahte/features/nurse_by_abdulkareem/presentation/cubit/service_state.dart';

import '../../../nurse_by_abdulkareem/data/repo/services_repo.dart';

class ServicesCubit extends Cubit<MyServicesState> {
  final ServicesRepository _servicesRepo;
  ServicesCubit(this._servicesRepo) : super(ServicesInitial());

  Future<void> fetchServices() async {
    emit(ServicesLoading());
    try {
      final response = await _servicesRepo.getServices();
      emit(ServicesSuccess(response.services));
    } catch (e) {
      emit(ServicesFailure(e.toString()));
    }
  }

  Future<void> addService({required String name, required String price}) async {
    emit(ServiceOperationLoading());
    try {
      final request = ServicesRequest(name: name, price: price);
      await _servicesRepo.createService(request);
      emit(ServiceOperationSuccess('تم إضافة الخدمة بنجاح'));
      await fetchServices();
    } catch (e) {
      emit(ServiceOperationFailure("فشل الإضافة: ${e.toString()}"));
    }
  }

  Future<void> updateService({
    required int id,
    required String name,
    required String price,
  }) async {
    emit(ServiceOperationLoading());
    try {
      final request = ServicesRequest(name: name, price: price);
      await _servicesRepo.updateService(id, request);
      emit(ServiceOperationSuccess("تم تحديث الخدمة بنجاح"));
      await fetchServices();
    } catch (e) {
      emit(ServiceOperationFailure("فشل التحديث: ${e.toString()}"));
    }
  }

  Future<void> deleteService({required int id}) async {
    emit(ServiceOperationLoading());
    try {
      await _servicesRepo.deleteService(id);
      emit(ServiceOperationSuccess("تم حذف الخدمة بنجاح"));
      await fetchServices();
    } catch (e) {
      emit(ServiceOperationFailure("فشل الحذف: ${e.toString()}"));
    }
  }
}
