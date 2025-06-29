import 'package:json_annotation/json_annotation.dart';

part 'services.g.dart';

@JsonSerializable()
class Services {
  final int id;
  final String name;
  final String price;
  @JsonKey(name: 'nurse_id')
  final int nurseId;

  Services({
    required this.id,
    required this.name,
    required this.price,
    required this.nurseId,
  });

  factory Services.fromJson(Map<String, dynamic> json) => _$ServicesFromJson(json);
  Map<String, dynamic> toJson() => _$ServicesToJson(this);
} 