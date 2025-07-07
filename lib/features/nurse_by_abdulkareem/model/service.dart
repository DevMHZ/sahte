import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class Service {
  final int id;

  @JsonKey(name: 'nurse_id')
  final int nurseId;

  final String name;
  final String price;

  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  final List<dynamic> subservices;

  Service({
    required this.id,
    required this.nurseId,
    required this.name,
    required this.price,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.subservices,
  });

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
