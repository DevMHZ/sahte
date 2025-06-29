part of 'services_cubit.dart';

@freezed
class ServicesState with _$ServicesState {
  const factory ServicesState.initial() = _Initial;
  const factory ServicesState.loading() = _Loading;
  const factory ServicesState.success(List<Services> services) = _Success;
  const factory ServicesState.failure(String message) = _Failure;
} 