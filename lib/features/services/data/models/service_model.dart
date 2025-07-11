import 'package:freezed_annotation/freezed_annotation.dart';
part 'service_model.freezed.dart';
part 'service_model.g.dart';

@freezed
class Service with _$Service {
  const factory Service({
    required int id,
    @JsonKey(name: 'nurse_id') required int nurseId,
    required String name,
    required String price,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);
}
