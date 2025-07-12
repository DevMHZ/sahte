// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceListResponseImpl _$$ServiceListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceListResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServiceListResponseImplToJson(
        _$ServiceListResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
