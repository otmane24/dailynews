// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sources_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SourcesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sourcesLoading,
    required TResult Function(List<SourceModel> sources) sourcesLoaded,
    required TResult Function(String message) sourcesFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sourcesLoading,
    TResult? Function(List<SourceModel> sources)? sourcesLoaded,
    TResult? Function(String message)? sourcesFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sourcesLoading,
    TResult Function(List<SourceModel> sources)? sourcesLoaded,
    TResult Function(String message)? sourcesFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SourcesLoading value) sourcesLoading,
    required TResult Function(_SourcesLoaded value) sourcesLoaded,
    required TResult Function(_SourcesFailed value) sourcesFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SourcesLoading value)? sourcesLoading,
    TResult? Function(_SourcesLoaded value)? sourcesLoaded,
    TResult? Function(_SourcesFailed value)? sourcesFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SourcesLoading value)? sourcesLoading,
    TResult Function(_SourcesLoaded value)? sourcesLoaded,
    TResult Function(_SourcesFailed value)? sourcesFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourcesStateCopyWith<$Res> {
  factory $SourcesStateCopyWith(
          SourcesState value, $Res Function(SourcesState) then) =
      _$SourcesStateCopyWithImpl<$Res, SourcesState>;
}

/// @nodoc
class _$SourcesStateCopyWithImpl<$Res, $Val extends SourcesState>
    implements $SourcesStateCopyWith<$Res> {
  _$SourcesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SourcesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SourcesStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SourcesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SourcesState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sourcesLoading,
    required TResult Function(List<SourceModel> sources) sourcesLoaded,
    required TResult Function(String message) sourcesFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sourcesLoading,
    TResult? Function(List<SourceModel> sources)? sourcesLoaded,
    TResult? Function(String message)? sourcesFailed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sourcesLoading,
    TResult Function(List<SourceModel> sources)? sourcesLoaded,
    TResult Function(String message)? sourcesFailed,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_SourcesLoading value) sourcesLoading,
    required TResult Function(_SourcesLoaded value) sourcesLoaded,
    required TResult Function(_SourcesFailed value) sourcesFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SourcesLoading value)? sourcesLoading,
    TResult? Function(_SourcesLoaded value)? sourcesLoaded,
    TResult? Function(_SourcesFailed value)? sourcesFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SourcesLoading value)? sourcesLoading,
    TResult Function(_SourcesLoaded value)? sourcesLoaded,
    TResult Function(_SourcesFailed value)? sourcesFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SourcesState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SourcesLoadingImplCopyWith<$Res> {
  factory _$$SourcesLoadingImplCopyWith(_$SourcesLoadingImpl value,
          $Res Function(_$SourcesLoadingImpl) then) =
      __$$SourcesLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SourcesLoadingImplCopyWithImpl<$Res>
    extends _$SourcesStateCopyWithImpl<$Res, _$SourcesLoadingImpl>
    implements _$$SourcesLoadingImplCopyWith<$Res> {
  __$$SourcesLoadingImplCopyWithImpl(
      _$SourcesLoadingImpl _value, $Res Function(_$SourcesLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SourcesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SourcesLoadingImpl implements _SourcesLoading {
  const _$SourcesLoadingImpl();

  @override
  String toString() {
    return 'SourcesState.sourcesLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SourcesLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sourcesLoading,
    required TResult Function(List<SourceModel> sources) sourcesLoaded,
    required TResult Function(String message) sourcesFailed,
  }) {
    return sourcesLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sourcesLoading,
    TResult? Function(List<SourceModel> sources)? sourcesLoaded,
    TResult? Function(String message)? sourcesFailed,
  }) {
    return sourcesLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sourcesLoading,
    TResult Function(List<SourceModel> sources)? sourcesLoaded,
    TResult Function(String message)? sourcesFailed,
    required TResult orElse(),
  }) {
    if (sourcesLoading != null) {
      return sourcesLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SourcesLoading value) sourcesLoading,
    required TResult Function(_SourcesLoaded value) sourcesLoaded,
    required TResult Function(_SourcesFailed value) sourcesFailed,
  }) {
    return sourcesLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SourcesLoading value)? sourcesLoading,
    TResult? Function(_SourcesLoaded value)? sourcesLoaded,
    TResult? Function(_SourcesFailed value)? sourcesFailed,
  }) {
    return sourcesLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SourcesLoading value)? sourcesLoading,
    TResult Function(_SourcesLoaded value)? sourcesLoaded,
    TResult Function(_SourcesFailed value)? sourcesFailed,
    required TResult orElse(),
  }) {
    if (sourcesLoading != null) {
      return sourcesLoading(this);
    }
    return orElse();
  }
}

abstract class _SourcesLoading implements SourcesState {
  const factory _SourcesLoading() = _$SourcesLoadingImpl;
}

/// @nodoc
abstract class _$$SourcesLoadedImplCopyWith<$Res> {
  factory _$$SourcesLoadedImplCopyWith(
          _$SourcesLoadedImpl value, $Res Function(_$SourcesLoadedImpl) then) =
      __$$SourcesLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SourceModel> sources});
}

/// @nodoc
class __$$SourcesLoadedImplCopyWithImpl<$Res>
    extends _$SourcesStateCopyWithImpl<$Res, _$SourcesLoadedImpl>
    implements _$$SourcesLoadedImplCopyWith<$Res> {
  __$$SourcesLoadedImplCopyWithImpl(
      _$SourcesLoadedImpl _value, $Res Function(_$SourcesLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SourcesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sources = null,
  }) {
    return _then(_$SourcesLoadedImpl(
      sources: null == sources
          ? _value._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<SourceModel>,
    ));
  }
}

/// @nodoc

class _$SourcesLoadedImpl implements _SourcesLoaded {
  const _$SourcesLoadedImpl({required final List<SourceModel> sources})
      : _sources = sources;

  final List<SourceModel> _sources;
  @override
  List<SourceModel> get sources {
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

  @override
  String toString() {
    return 'SourcesState.sourcesLoaded(sources: $sources)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourcesLoadedImpl &&
            const DeepCollectionEquality().equals(other._sources, _sources));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sources));

  /// Create a copy of SourcesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SourcesLoadedImplCopyWith<_$SourcesLoadedImpl> get copyWith =>
      __$$SourcesLoadedImplCopyWithImpl<_$SourcesLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sourcesLoading,
    required TResult Function(List<SourceModel> sources) sourcesLoaded,
    required TResult Function(String message) sourcesFailed,
  }) {
    return sourcesLoaded(sources);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sourcesLoading,
    TResult? Function(List<SourceModel> sources)? sourcesLoaded,
    TResult? Function(String message)? sourcesFailed,
  }) {
    return sourcesLoaded?.call(sources);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sourcesLoading,
    TResult Function(List<SourceModel> sources)? sourcesLoaded,
    TResult Function(String message)? sourcesFailed,
    required TResult orElse(),
  }) {
    if (sourcesLoaded != null) {
      return sourcesLoaded(sources);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SourcesLoading value) sourcesLoading,
    required TResult Function(_SourcesLoaded value) sourcesLoaded,
    required TResult Function(_SourcesFailed value) sourcesFailed,
  }) {
    return sourcesLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SourcesLoading value)? sourcesLoading,
    TResult? Function(_SourcesLoaded value)? sourcesLoaded,
    TResult? Function(_SourcesFailed value)? sourcesFailed,
  }) {
    return sourcesLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SourcesLoading value)? sourcesLoading,
    TResult Function(_SourcesLoaded value)? sourcesLoaded,
    TResult Function(_SourcesFailed value)? sourcesFailed,
    required TResult orElse(),
  }) {
    if (sourcesLoaded != null) {
      return sourcesLoaded(this);
    }
    return orElse();
  }
}

abstract class _SourcesLoaded implements SourcesState {
  const factory _SourcesLoaded({required final List<SourceModel> sources}) =
      _$SourcesLoadedImpl;

  List<SourceModel> get sources;

  /// Create a copy of SourcesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SourcesLoadedImplCopyWith<_$SourcesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SourcesFailedImplCopyWith<$Res> {
  factory _$$SourcesFailedImplCopyWith(
          _$SourcesFailedImpl value, $Res Function(_$SourcesFailedImpl) then) =
      __$$SourcesFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SourcesFailedImplCopyWithImpl<$Res>
    extends _$SourcesStateCopyWithImpl<$Res, _$SourcesFailedImpl>
    implements _$$SourcesFailedImplCopyWith<$Res> {
  __$$SourcesFailedImplCopyWithImpl(
      _$SourcesFailedImpl _value, $Res Function(_$SourcesFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SourcesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SourcesFailedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SourcesFailedImpl implements _SourcesFailed {
  const _$SourcesFailedImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'SourcesState.sourcesFailed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourcesFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SourcesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SourcesFailedImplCopyWith<_$SourcesFailedImpl> get copyWith =>
      __$$SourcesFailedImplCopyWithImpl<_$SourcesFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sourcesLoading,
    required TResult Function(List<SourceModel> sources) sourcesLoaded,
    required TResult Function(String message) sourcesFailed,
  }) {
    return sourcesFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sourcesLoading,
    TResult? Function(List<SourceModel> sources)? sourcesLoaded,
    TResult? Function(String message)? sourcesFailed,
  }) {
    return sourcesFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sourcesLoading,
    TResult Function(List<SourceModel> sources)? sourcesLoaded,
    TResult Function(String message)? sourcesFailed,
    required TResult orElse(),
  }) {
    if (sourcesFailed != null) {
      return sourcesFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SourcesLoading value) sourcesLoading,
    required TResult Function(_SourcesLoaded value) sourcesLoaded,
    required TResult Function(_SourcesFailed value) sourcesFailed,
  }) {
    return sourcesFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SourcesLoading value)? sourcesLoading,
    TResult? Function(_SourcesLoaded value)? sourcesLoaded,
    TResult? Function(_SourcesFailed value)? sourcesFailed,
  }) {
    return sourcesFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SourcesLoading value)? sourcesLoading,
    TResult Function(_SourcesLoaded value)? sourcesLoaded,
    TResult Function(_SourcesFailed value)? sourcesFailed,
    required TResult orElse(),
  }) {
    if (sourcesFailed != null) {
      return sourcesFailed(this);
    }
    return orElse();
  }
}

abstract class _SourcesFailed implements SourcesState {
  const factory _SourcesFailed({required final String message}) =
      _$SourcesFailedImpl;

  String get message;

  /// Create a copy of SourcesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SourcesFailedImplCopyWith<_$SourcesFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
