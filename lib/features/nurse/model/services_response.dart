import 'package:sahte/features/nurse/model/services.dart';

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
}