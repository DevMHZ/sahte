import 'package:sahte/features/nurse_by_abdulkareem/model/service.dart';

abstract class MyServicesState {}

class ServicesInitial extends MyServicesState {}

class ServicesLoading extends MyServicesState {}

class ServicesSuccess extends MyServicesState {
  final List<Service> services;
  ServicesSuccess(this.services);
}

class ServicesFailure extends MyServicesState {
  final String errorMessage;
  ServicesFailure(this.errorMessage);
}

// --- States for Add / Update / Delete ---

class ServiceOperationLoading extends MyServicesState {}

class ServiceOperationSuccess extends MyServicesState {
  final String message;
  ServiceOperationSuccess(this.message);
}

class ServiceOperationFailure extends MyServicesState {
  final String errorMessage;
  ServiceOperationFailure(this.errorMessage);
}
