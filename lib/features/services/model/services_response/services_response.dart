import 'package:json_annotation/json_annotation.dart';
import 'package:sahte/features/services/model/services.dart';

part 'services_response.g.dart';

@JsonSerializable()
class ServicesResponse {
  final List<Services> services;

  ServicesResponse({required this.services});

  factory ServicesResponse.fromJson(Map<String, dynamic> json) {
    final servicesData = json['data'] as List<dynamic>?;

    if (servicesData == null) {
      return ServicesResponse(services: []);
    }

    final servicesList = servicesData.map((serviceJson) {
      return Services.fromJson(serviceJson as Map<String, dynamic>);
    }).toList();

    return ServicesResponse(services: servicesList);
  }

  Map<String, dynamic> toJson() => _$ServicesResponseToJson(this);
} 