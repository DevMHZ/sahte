// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServiceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Service> services) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Service> services)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Service> services)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceInitial value) initial,
    required TResult Function(ServiceLoading value) loading,
    required TResult Function(ServiceLoaded value) loaded,
    required TResult Function(ServiceError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceInitial value)? initial,
    TResult? Function(ServiceLoading value)? loading,
    TResult? Function(ServiceLoaded value)? loaded,
    TResult? Function(ServiceError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceInitial value)? initial,
    TResult Function(ServiceLoading value)? loading,
    TResult Function(ServiceLoaded value)? loaded,
    TResult Function(ServiceError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceStateCopyWith<$Res> {
  factory $ServiceStateCopyWith(
          ServiceState value, $Res Function(ServiceState) then) =
      _$ServiceStateCopyWithImpl<$Res, ServiceState>;
}

/// @nodoc
class _$ServiceStateCopyWithImpl<$Res, $Val extends ServiceState>
    implements $ServiceStateCopyWith<$Res> {
  _$ServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ServiceInitialImplCopyWith<$Res> {
  factory _$$ServiceInitialImplCopyWith(_$ServiceInitialImpl value,
          $Res Function(_$ServiceInitialImpl) then) =
      __$$ServiceInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceInitialImplCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceInitialImpl>
    implements _$$ServiceInitialImplCopyWith<$Res> {
  __$$ServiceInitialImplCopyWithImpl(
      _$ServiceInitialImpl _value, $Res Function(_$ServiceInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ServiceInitialImpl implements ServiceInitial {
  const _$ServiceInitialImpl();

  @override
  String toString() {
    return 'ServiceState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServiceInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Service> services) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Service> services)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Service> services)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceInitial value) initial,
    required TResult Function(ServiceLoading value) loading,
    required TResult Function(ServiceLoaded value) loaded,
    required TResult Function(ServiceError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceInitial value)? initial,
    TResult? Function(ServiceLoading value)? loading,
    TResult? Function(ServiceLoaded value)? loaded,
    TResult? Function(ServiceError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceInitial value)? initial,
    TResult Function(ServiceLoading value)? loading,
    TResult Function(ServiceLoaded value)? loaded,
    TResult Function(ServiceError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ServiceInitial implements ServiceState {
  const factory ServiceInitial() = _$ServiceInitialImpl;
}

/// @nodoc
abstract class _$$ServiceLoadingImplCopyWith<$Res> {
  factory _$$ServiceLoadingImplCopyWith(_$ServiceLoadingImpl value,
          $Res Function(_$ServiceLoadingImpl) then) =
      __$$ServiceLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceLoadingImplCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceLoadingImpl>
    implements _$$ServiceLoadingImplCopyWith<$Res> {
  __$$ServiceLoadingImplCopyWithImpl(
      _$ServiceLoadingImpl _value, $Res Function(_$ServiceLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ServiceLoadingImpl implements ServiceLoading {
  const _$ServiceLoadingImpl();

  @override
  String toString() {
    return 'ServiceState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServiceLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Service> services) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Service> services)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Service> services)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceInitial value) initial,
    required TResult Function(ServiceLoading value) loading,
    required TResult Function(ServiceLoaded value) loaded,
    required TResult Function(ServiceError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceInitial value)? initial,
    TResult? Function(ServiceLoading value)? loading,
    TResult? Function(ServiceLoaded value)? loaded,
    TResult? Function(ServiceError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceInitial value)? initial,
    TResult Function(ServiceLoading value)? loading,
    TResult Function(ServiceLoaded value)? loaded,
    TResult Function(ServiceError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ServiceLoading implements ServiceState {
  const factory ServiceLoading() = _$ServiceLoadingImpl;
}

/// @nodoc
abstract class _$$ServiceLoadedImplCopyWith<$Res> {
  factory _$$ServiceLoadedImplCopyWith(
          _$ServiceLoadedImpl value, $Res Function(_$ServiceLoadedImpl) then) =
      __$$ServiceLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Service> services});
}

/// @nodoc
class __$$ServiceLoadedImplCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceLoadedImpl>
    implements _$$ServiceLoadedImplCopyWith<$Res> {
  __$$ServiceLoadedImplCopyWithImpl(
      _$ServiceLoadedImpl _value, $Res Function(_$ServiceLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? services = null,
  }) {
    return _then(_$ServiceLoadedImpl(
      null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
    ));
  }
}

/// @nodoc

class _$ServiceLoadedImpl implements ServiceLoaded {
  const _$ServiceLoadedImpl(final List<Service> services)
      : _services = services;

  final List<Service> _services;
  @override
  List<Service> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  String toString() {
    return 'ServiceState.loaded(services: $services)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceLoadedImpl &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_services));

  /// Create a copy of ServiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceLoadedImplCopyWith<_$ServiceLoadedImpl> get copyWith =>
      __$$ServiceLoadedImplCopyWithImpl<_$ServiceLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Service> services) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(services);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Service> services)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(services);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Service> services)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(services);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceInitial value) initial,
    required TResult Function(ServiceLoading value) loading,
    required TResult Function(ServiceLoaded value) loaded,
    required TResult Function(ServiceError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceInitial value)? initial,
    TResult? Function(ServiceLoading value)? loading,
    TResult? Function(ServiceLoaded value)? loaded,
    TResult? Function(ServiceError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceInitial value)? initial,
    TResult Function(ServiceLoading value)? loading,
    TResult Function(ServiceLoaded value)? loaded,
    TResult Function(ServiceError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ServiceLoaded implements ServiceState {
  const factory ServiceLoaded(final List<Service> services) =
      _$ServiceLoadedImpl;

  List<Service> get services;

  /// Create a copy of ServiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceLoadedImplCopyWith<_$ServiceLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceErrorImplCopyWith<$Res> {
  factory _$$ServiceErrorImplCopyWith(
          _$ServiceErrorImpl value, $Res Function(_$ServiceErrorImpl) then) =
      __$$ServiceErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServiceErrorImplCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceErrorImpl>
    implements _$$ServiceErrorImplCopyWith<$Res> {
  __$$ServiceErrorImplCopyWithImpl(
      _$ServiceErrorImpl _value, $Res Function(_$ServiceErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServiceErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServiceErrorImpl implements ServiceError {
  const _$ServiceErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ServiceState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ServiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceErrorImplCopyWith<_$ServiceErrorImpl> get copyWith =>
      __$$ServiceErrorImplCopyWithImpl<_$ServiceErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Service> services) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Service> services)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Service> services)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceInitial value) initial,
    required TResult Function(ServiceLoading value) loading,
    required TResult Function(ServiceLoaded value) loaded,
    required TResult Function(ServiceError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceInitial value)? initial,
    TResult? Function(ServiceLoading value)? loading,
    TResult? Function(ServiceLoaded value)? loaded,
    TResult? Function(ServiceError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceInitial value)? initial,
    TResult Function(ServiceLoading value)? loading,
    TResult Function(ServiceLoaded value)? loaded,
    TResult Function(ServiceError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ServiceError implements ServiceState {
  const factory ServiceError(final String message) = _$ServiceErrorImpl;

  String get message;

  /// Create a copy of ServiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceErrorImplCopyWith<_$ServiceErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
