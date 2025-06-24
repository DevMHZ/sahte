// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      data: json['data'] as List<dynamic>?,
      lastPage: (json['lastPage'] as num?)?.toInt(),
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      status: json['status'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'errors': instance.errors,
      'lastPage': instance.lastPage,
      'total': instance.total,
      'currentPage': instance.currentPage,
    };
