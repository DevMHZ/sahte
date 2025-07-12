// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceListResponse _$ServiceListResponseFromJson(Map<String, dynamic> json) {
  return _ServiceListResponse.fromJson(json);
}

/// @nodoc
mixin _$ServiceListResponse {
  List<Service> get data => throw _privateConstructorUsedError;

  /// Serializes this ServiceListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceListResponseCopyWith<ServiceListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceListResponseCopyWith<$Res> {
  factory $ServiceListResponseCopyWith(
          ServiceListResponse value, $Res Function(ServiceListResponse) then) =
      _$ServiceListResponseCopyWithImpl<$Res, ServiceListResponse>;
  @useResult
  $Res call({List<Service> data});
}

/// @nodoc
class _$ServiceListResponseCopyWithImpl<$Res, $Val extends ServiceListResponse>
    implements $ServiceListResponseCopyWith<$Res> {
  _$ServiceListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Service>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceListResponseImplCopyWith<$Res>
    implements $ServiceListResponseCopyWith<$Res> {
  factory _$$ServiceListResponseImplCopyWith(_$ServiceListResponseImpl value,
          $Res Function(_$ServiceListResponseImpl) then) =
      __$$ServiceListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Service> data});
}

/// @nodoc
class __$$ServiceListResponseImplCopyWithImpl<$Res>
    extends _$ServiceListResponseCopyWithImpl<$Res, _$ServiceListResponseImpl>
    implements _$$ServiceListResponseImplCopyWith<$Res> {
  __$$ServiceListResponseImplCopyWithImpl(_$ServiceListResponseImpl _value,
      $Res Function(_$ServiceListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ServiceListResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Service>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceListResponseImpl implements _ServiceListResponse {
  const _$ServiceListResponseImpl({required final List<Service> data})
      : _data = data;

  factory _$ServiceListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceListResponseImplFromJson(json);

  final List<Service> _data;
  @override
  List<Service> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ServiceListResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceListResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ServiceListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceListResponseImplCopyWith<_$ServiceListResponseImpl> get copyWith =>
      __$$ServiceListResponseImplCopyWithImpl<_$ServiceListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceListResponseImplToJson(
      this,
    );
  }
}

abstract class _ServiceListResponse implements ServiceListResponse {
  const factory _ServiceListResponse({required final List<Service> data}) =
      _$ServiceListResponseImpl;

  factory _ServiceListResponse.fromJson(Map<String, dynamic> json) =
      _$ServiceListResponseImpl.fromJson;

  @override
  List<Service> get data;

  /// Create a copy of ServiceListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceListResponseImplCopyWith<_$ServiceListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
