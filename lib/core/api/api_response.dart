import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  final bool status;
  final String message;
  final List<dynamic>? data;
  final List<Map<String, dynamic>>? errors;
  final int? lastPage;
  final int? total;
  final int? currentPage;

  ApiResponse({
    this.currentPage,
    required this.data,
    this.lastPage,
    this.errors,
    this.total,
    required this.status,
    required this.message,
  });
  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
