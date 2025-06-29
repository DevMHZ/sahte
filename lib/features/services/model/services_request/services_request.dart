import 'package:json_annotation/json_annotation.dart';

part 'services_request.g.dart';

@JsonSerializable()
class ServicesRequest {
  final String name;
  final String price;

  ServicesRequest({required this.name, required this.price});

  factory ServicesRequest.fromJson(Map<String, dynamic> json) => _$ServicesRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ServicesRequestToJson(this);
} 