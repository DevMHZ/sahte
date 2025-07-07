import 'package:json_annotation/json_annotation.dart';
import 'package:sahte/features/nurse_by_abdulkareem/model/service.dart';

part 'service_response.g.dart';

@JsonSerializable()
class ServicesResponse {
  final List<Service> services;

  ServicesResponse({required this.services});

  factory ServicesResponse.fromJson(Map<String, dynamic> json) {
    final servicesData = json['data'] as List<dynamic>?;

    if (servicesData == null) {
      return ServicesResponse(services: []);
    }

    final servicesList = servicesData.map((serviceJson) {
      return Service.fromJson(serviceJson as Map<String, dynamic>);
    }).toList();

    return ServicesResponse(services: servicesList);
  }

  Map<String, dynamic> toJson() => _$ServicesResponseToJson(this);
}