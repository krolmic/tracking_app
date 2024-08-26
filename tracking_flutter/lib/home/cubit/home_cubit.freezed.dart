// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  MoodsListState get moodsListState => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({MoodsListState moodsListState});

  $MoodsListStateCopyWith<$Res> get moodsListState;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moodsListState = null,
  }) {
    return _then(_value.copyWith(
      moodsListState: null == moodsListState
          ? _value.moodsListState
          : moodsListState // ignore: cast_nullable_to_non_nullable
              as MoodsListState,
    ) as $Val);
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MoodsListStateCopyWith<$Res> get moodsListState {
    return $MoodsListStateCopyWith<$Res>(_value.moodsListState, (value) {
      return _then(_value.copyWith(moodsListState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MoodsListState moodsListState});

  @override
  $MoodsListStateCopyWith<$Res> get moodsListState;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moodsListState = null,
  }) {
    return _then(_$HomeStateImpl(
      moodsListState: null == moodsListState
          ? _value.moodsListState
          : moodsListState // ignore: cast_nullable_to_non_nullable
              as MoodsListState,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({this.moodsListState = const MoodsListState.initial()});

  @override
  @JsonKey()
  final MoodsListState moodsListState;

  @override
  String toString() {
    return 'HomeState(moodsListState: $moodsListState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.moodsListState, moodsListState) ||
                other.moodsListState == moodsListState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, moodsListState);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({final MoodsListState moodsListState}) =
      _$HomeStateImpl;

  @override
  MoodsListState get moodsListState;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MoodsListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Mood> moods) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Mood> moods)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Mood> moods)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoodsListInitialState value) initial,
    required TResult Function(MoodsListLoadingState value) loading,
    required TResult Function(MoodsListSuccessState value) loaded,
    required TResult Function(MoodsListErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoodsListInitialState value)? initial,
    TResult? Function(MoodsListLoadingState value)? loading,
    TResult? Function(MoodsListSuccessState value)? loaded,
    TResult? Function(MoodsListErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoodsListInitialState value)? initial,
    TResult Function(MoodsListLoadingState value)? loading,
    TResult Function(MoodsListSuccessState value)? loaded,
    TResult Function(MoodsListErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodsListStateCopyWith<$Res> {
  factory $MoodsListStateCopyWith(
          MoodsListState value, $Res Function(MoodsListState) then) =
      _$MoodsListStateCopyWithImpl<$Res, MoodsListState>;
}

/// @nodoc
class _$MoodsListStateCopyWithImpl<$Res, $Val extends MoodsListState>
    implements $MoodsListStateCopyWith<$Res> {
  _$MoodsListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoodsListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MoodsListInitialStateImplCopyWith<$Res> {
  factory _$$MoodsListInitialStateImplCopyWith(
          _$MoodsListInitialStateImpl value,
          $Res Function(_$MoodsListInitialStateImpl) then) =
      __$$MoodsListInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MoodsListInitialStateImplCopyWithImpl<$Res>
    extends _$MoodsListStateCopyWithImpl<$Res, _$MoodsListInitialStateImpl>
    implements _$$MoodsListInitialStateImplCopyWith<$Res> {
  __$$MoodsListInitialStateImplCopyWithImpl(_$MoodsListInitialStateImpl _value,
      $Res Function(_$MoodsListInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoodsListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MoodsListInitialStateImpl implements MoodsListInitialState {
  const _$MoodsListInitialStateImpl();

  @override
  String toString() {
    return 'MoodsListState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodsListInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Mood> moods) loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Mood> moods)? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Mood> moods)? loaded,
    TResult Function()? error,
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
    required TResult Function(MoodsListInitialState value) initial,
    required TResult Function(MoodsListLoadingState value) loading,
    required TResult Function(MoodsListSuccessState value) loaded,
    required TResult Function(MoodsListErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoodsListInitialState value)? initial,
    TResult? Function(MoodsListLoadingState value)? loading,
    TResult? Function(MoodsListSuccessState value)? loaded,
    TResult? Function(MoodsListErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoodsListInitialState value)? initial,
    TResult Function(MoodsListLoadingState value)? loading,
    TResult Function(MoodsListSuccessState value)? loaded,
    TResult Function(MoodsListErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MoodsListInitialState implements MoodsListState {
  const factory MoodsListInitialState() = _$MoodsListInitialStateImpl;
}

/// @nodoc
abstract class _$$MoodsListLoadingStateImplCopyWith<$Res> {
  factory _$$MoodsListLoadingStateImplCopyWith(
          _$MoodsListLoadingStateImpl value,
          $Res Function(_$MoodsListLoadingStateImpl) then) =
      __$$MoodsListLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MoodsListLoadingStateImplCopyWithImpl<$Res>
    extends _$MoodsListStateCopyWithImpl<$Res, _$MoodsListLoadingStateImpl>
    implements _$$MoodsListLoadingStateImplCopyWith<$Res> {
  __$$MoodsListLoadingStateImplCopyWithImpl(_$MoodsListLoadingStateImpl _value,
      $Res Function(_$MoodsListLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoodsListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MoodsListLoadingStateImpl implements MoodsListLoadingState {
  const _$MoodsListLoadingStateImpl();

  @override
  String toString() {
    return 'MoodsListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodsListLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Mood> moods) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Mood> moods)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Mood> moods)? loaded,
    TResult Function()? error,
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
    required TResult Function(MoodsListInitialState value) initial,
    required TResult Function(MoodsListLoadingState value) loading,
    required TResult Function(MoodsListSuccessState value) loaded,
    required TResult Function(MoodsListErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoodsListInitialState value)? initial,
    TResult? Function(MoodsListLoadingState value)? loading,
    TResult? Function(MoodsListSuccessState value)? loaded,
    TResult? Function(MoodsListErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoodsListInitialState value)? initial,
    TResult Function(MoodsListLoadingState value)? loading,
    TResult Function(MoodsListSuccessState value)? loaded,
    TResult Function(MoodsListErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MoodsListLoadingState implements MoodsListState {
  const factory MoodsListLoadingState() = _$MoodsListLoadingStateImpl;
}

/// @nodoc
abstract class _$$MoodsListSuccessStateImplCopyWith<$Res> {
  factory _$$MoodsListSuccessStateImplCopyWith(
          _$MoodsListSuccessStateImpl value,
          $Res Function(_$MoodsListSuccessStateImpl) then) =
      __$$MoodsListSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Mood> moods});
}

/// @nodoc
class __$$MoodsListSuccessStateImplCopyWithImpl<$Res>
    extends _$MoodsListStateCopyWithImpl<$Res, _$MoodsListSuccessStateImpl>
    implements _$$MoodsListSuccessStateImplCopyWith<$Res> {
  __$$MoodsListSuccessStateImplCopyWithImpl(_$MoodsListSuccessStateImpl _value,
      $Res Function(_$MoodsListSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoodsListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moods = null,
  }) {
    return _then(_$MoodsListSuccessStateImpl(
      moods: null == moods
          ? _value._moods
          : moods // ignore: cast_nullable_to_non_nullable
              as List<Mood>,
    ));
  }
}

/// @nodoc

class _$MoodsListSuccessStateImpl implements MoodsListSuccessState {
  const _$MoodsListSuccessStateImpl({required final List<Mood> moods})
      : _moods = moods;

  final List<Mood> _moods;
  @override
  List<Mood> get moods {
    if (_moods is EqualUnmodifiableListView) return _moods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moods);
  }

  @override
  String toString() {
    return 'MoodsListState.loaded(moods: $moods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodsListSuccessStateImpl &&
            const DeepCollectionEquality().equals(other._moods, _moods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_moods));

  /// Create a copy of MoodsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoodsListSuccessStateImplCopyWith<_$MoodsListSuccessStateImpl>
      get copyWith => __$$MoodsListSuccessStateImplCopyWithImpl<
          _$MoodsListSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Mood> moods) loaded,
    required TResult Function() error,
  }) {
    return loaded(moods);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Mood> moods)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(moods);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Mood> moods)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(moods);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoodsListInitialState value) initial,
    required TResult Function(MoodsListLoadingState value) loading,
    required TResult Function(MoodsListSuccessState value) loaded,
    required TResult Function(MoodsListErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoodsListInitialState value)? initial,
    TResult? Function(MoodsListLoadingState value)? loading,
    TResult? Function(MoodsListSuccessState value)? loaded,
    TResult? Function(MoodsListErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoodsListInitialState value)? initial,
    TResult Function(MoodsListLoadingState value)? loading,
    TResult Function(MoodsListSuccessState value)? loaded,
    TResult Function(MoodsListErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MoodsListSuccessState implements MoodsListState {
  const factory MoodsListSuccessState({required final List<Mood> moods}) =
      _$MoodsListSuccessStateImpl;

  List<Mood> get moods;

  /// Create a copy of MoodsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoodsListSuccessStateImplCopyWith<_$MoodsListSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MoodsListErrorStateImplCopyWith<$Res> {
  factory _$$MoodsListErrorStateImplCopyWith(_$MoodsListErrorStateImpl value,
          $Res Function(_$MoodsListErrorStateImpl) then) =
      __$$MoodsListErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MoodsListErrorStateImplCopyWithImpl<$Res>
    extends _$MoodsListStateCopyWithImpl<$Res, _$MoodsListErrorStateImpl>
    implements _$$MoodsListErrorStateImplCopyWith<$Res> {
  __$$MoodsListErrorStateImplCopyWithImpl(_$MoodsListErrorStateImpl _value,
      $Res Function(_$MoodsListErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoodsListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MoodsListErrorStateImpl implements MoodsListErrorState {
  const _$MoodsListErrorStateImpl();

  @override
  String toString() {
    return 'MoodsListState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodsListErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Mood> moods) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Mood> moods)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Mood> moods)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoodsListInitialState value) initial,
    required TResult Function(MoodsListLoadingState value) loading,
    required TResult Function(MoodsListSuccessState value) loaded,
    required TResult Function(MoodsListErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoodsListInitialState value)? initial,
    TResult? Function(MoodsListLoadingState value)? loading,
    TResult? Function(MoodsListSuccessState value)? loaded,
    TResult? Function(MoodsListErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoodsListInitialState value)? initial,
    TResult Function(MoodsListLoadingState value)? loading,
    TResult Function(MoodsListSuccessState value)? loaded,
    TResult Function(MoodsListErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MoodsListErrorState implements MoodsListState {
  const factory MoodsListErrorState() = _$MoodsListErrorStateImpl;
}
