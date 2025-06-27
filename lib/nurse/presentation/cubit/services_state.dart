import 'package:sahte/nurse/services/model/services.dart';

abstract class ServicesState {}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesSuccess extends ServicesState {
  final List<Services> services;
  ServicesSuccess(this.services);
}

class ServicesFailure extends ServicesState {
  final String errorMessage;
  ServicesFailure(this.errorMessage);
}
