import 'package:freezed_annotation/freezed_annotation.dart';
import 'service_model.dart';
part 'service_list_response.freezed.dart';
part 'service_list_response.g.dart';

@freezed
class ServiceListResponse with _$ServiceListResponse {
  const factory ServiceListResponse({
    required List<Service> data,
  }) = _ServiceListResponse;

  factory ServiceListResponse.fromJson(Map<String, dynamic> json) => _$ServiceListResponseFromJson(json);
}
