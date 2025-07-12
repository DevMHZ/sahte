part of 'service_cubit.dart';

@freezed
class ServiceState with _$ServiceState {
  const factory ServiceState.initial() = ServiceInitial;
  const factory ServiceState.loading() = ServiceLoading;
  const factory ServiceState.loaded(List<Service> services) = ServiceLoaded;
  const factory ServiceState.error(String message) = ServiceError;

}
