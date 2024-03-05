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
  HomeMoodsState get moodsState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({HomeMoodsState moodsState});

  $HomeMoodsStateCopyWith<$Res> get moodsState;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moodsState = null,
  }) {
    return _then(_value.copyWith(
      moodsState: null == moodsState
          ? _value.moodsState
          : moodsState // ignore: cast_nullable_to_non_nullable
              as HomeMoodsState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HomeMoodsStateCopyWith<$Res> get moodsState {
    return $HomeMoodsStateCopyWith<$Res>(_value.moodsState, (value) {
      return _then(_value.copyWith(moodsState: value) as $Val);
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
  $Res call({HomeMoodsState moodsState});

  @override
  $HomeMoodsStateCopyWith<$Res> get moodsState;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moodsState = null,
  }) {
    return _then(_$HomeStateImpl(
      moodsState: null == moodsState
          ? _value.moodsState
          : moodsState // ignore: cast_nullable_to_non_nullable
              as HomeMoodsState,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({this.moodsState = const HomeMoodsState.initial()});

  @override
  @JsonKey()
  final HomeMoodsState moodsState;

  @override
  String toString() {
    return 'HomeState(moodsState: $moodsState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.moodsState, moodsState) ||
                other.moodsState == moodsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, moodsState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({final HomeMoodsState moodsState}) = _$HomeStateImpl;

  @override
  HomeMoodsState get moodsState;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeMoodsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Mood> moods, bool loadingMore,
            bool hasReachedMax, int nextPageToLoad)
        loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Mood> moods, bool loadingMore, bool hasReachedMax,
            int nextPageToLoad)?
        loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Mood> moods, bool loadingMore, bool hasReachedMax,
            int nextPageToLoad)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeMoodsInitialState value) initial,
    required TResult Function(HomeMoodsLoadingState value) loading,
    required TResult Function(HomeMoodsSuccessState value) loaded,
    required TResult Function(HomeMoodsErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeMoodsInitialState value)? initial,
    TResult? Function(HomeMoodsLoadingState value)? loading,
    TResult? Function(HomeMoodsSuccessState value)? loaded,
    TResult? Function(HomeMoodsErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeMoodsInitialState value)? initial,
    TResult Function(HomeMoodsLoadingState value)? loading,
    TResult Function(HomeMoodsSuccessState value)? loaded,
    TResult Function(HomeMoodsErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeMoodsStateCopyWith<$Res> {
  factory $HomeMoodsStateCopyWith(
          HomeMoodsState value, $Res Function(HomeMoodsState) then) =
      _$HomeMoodsStateCopyWithImpl<$Res, HomeMoodsState>;
}

/// @nodoc
class _$HomeMoodsStateCopyWithImpl<$Res, $Val extends HomeMoodsState>
    implements $HomeMoodsStateCopyWith<$Res> {
  _$HomeMoodsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HomeMoodsInitialStateImplCopyWith<$Res> {
  factory _$$HomeMoodsInitialStateImplCopyWith(
          _$HomeMoodsInitialStateImpl value,
          $Res Function(_$HomeMoodsInitialStateImpl) then) =
      __$$HomeMoodsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeMoodsInitialStateImplCopyWithImpl<$Res>
    extends _$HomeMoodsStateCopyWithImpl<$Res, _$HomeMoodsInitialStateImpl>
    implements _$$HomeMoodsInitialStateImplCopyWith<$Res> {
  __$$HomeMoodsInitialStateImplCopyWithImpl(_$HomeMoodsInitialStateImpl _value,
      $Res Function(_$HomeMoodsInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HomeMoodsInitialStateImpl implements HomeMoodsInitialState {
  const _$HomeMoodsInitialStateImpl();

  @override
  String toString() {
    return 'HomeMoodsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeMoodsInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Mood> moods, bool loadingMore,
            bool hasReachedMax, int nextPageToLoad)
        loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Mood> moods, bool loadingMore, bool hasReachedMax,
            int nextPageToLoad)?
        loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Mood> moods, bool loadingMore, bool hasReachedMax,
            int nextPageToLoad)?
        loaded,
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
    required TResult Function(HomeMoodsInitialState value) initial,
    required TResult Function(HomeMoodsLoadingState value) loading,
    required TResult Function(HomeMoodsSuccessState value) loaded,
    required TResult Function(HomeMoodsErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeMoodsInitialState value)? initial,
    TResult? Function(HomeMoodsLoadingState value)? loading,
    TResult? Function(HomeMoodsSuccessState value)? loaded,
    TResult? Function(HomeMoodsErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeMoodsInitialState value)? initial,
    TResult Function(HomeMoodsLoadingState value)? loading,
    TResult Function(HomeMoodsSuccessState value)? loaded,
    TResult Function(HomeMoodsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class HomeMoodsInitialState implements HomeMoodsState {
  const factory HomeMoodsInitialState() = _$HomeMoodsInitialStateImpl;
}

/// @nodoc
abstract class _$$HomeMoodsLoadingStateImplCopyWith<$Res> {
  factory _$$HomeMoodsLoadingStateImplCopyWith(
          _$HomeMoodsLoadingStateImpl value,
          $Res Function(_$HomeMoodsLoadingStateImpl) then) =
      __$$HomeMoodsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeMoodsLoadingStateImplCopyWithImpl<$Res>
    extends _$HomeMoodsStateCopyWithImpl<$Res, _$HomeMoodsLoadingStateImpl>
    implements _$$HomeMoodsLoadingStateImplCopyWith<$Res> {
  __$$HomeMoodsLoadingStateImplCopyWithImpl(_$HomeMoodsLoadingStateImpl _value,
      $Res Function(_$HomeMoodsLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HomeMoodsLoadingStateImpl implements HomeMoodsLoadingState {
  const _$HomeMoodsLoadingStateImpl();

  @override
  String toString() {
    return 'HomeMoodsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeMoodsLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Mood> moods, bool loadingMore,
            bool hasReachedMax, int nextPageToLoad)
        loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Mood> moods, bool loadingMore, bool hasReachedMax,
            int nextPageToLoad)?
        loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Mood> moods, bool loadingMore, bool hasReachedMax,
            int nextPageToLoad)?
        loaded,
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
    required TResult Function(HomeMoodsInitialState value) initial,
    required TResult Function(HomeMoodsLoadingState value) loading,
    required TResult Function(HomeMoodsSuccessState value) loaded,
    required TResult Function(HomeMoodsErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeMoodsInitialState value)? initial,
    TResult? Function(HomeMoodsLoadingState value)? loading,
    TResult? Function(HomeMoodsSuccessState value)? loaded,
    TResult? Function(HomeMoodsErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeMoodsInitialState value)? initial,
    TResult Function(HomeMoodsLoadingState value)? loading,
    TResult Function(HomeMoodsSuccessState value)? loaded,
    TResult Function(HomeMoodsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeMoodsLoadingState implements HomeMoodsState {
  const factory HomeMoodsLoadingState() = _$HomeMoodsLoadingStateImpl;
}

/// @nodoc
abstract class _$$HomeMoodsSuccessStateImplCopyWith<$Res> {
  factory _$$HomeMoodsSuccessStateImplCopyWith(
          _$HomeMoodsSuccessStateImpl value,
          $Res Function(_$HomeMoodsSuccessStateImpl) then) =
      __$$HomeMoodsSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Mood> moods,
      bool loadingMore,
      bool hasReachedMax,
      int nextPageToLoad});
}

/// @nodoc
class __$$HomeMoodsSuccessStateImplCopyWithImpl<$Res>
    extends _$HomeMoodsStateCopyWithImpl<$Res, _$HomeMoodsSuccessStateImpl>
    implements _$$HomeMoodsSuccessStateImplCopyWith<$Res> {
  __$$HomeMoodsSuccessStateImplCopyWithImpl(_$HomeMoodsSuccessStateImpl _value,
      $Res Function(_$HomeMoodsSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moods = null,
    Object? loadingMore = null,
    Object? hasReachedMax = null,
    Object? nextPageToLoad = null,
  }) {
    return _then(_$HomeMoodsSuccessStateImpl(
      moods: null == moods
          ? _value._moods
          : moods // ignore: cast_nullable_to_non_nullable
              as List<Mood>,
      loadingMore: null == loadingMore
          ? _value.loadingMore
          : loadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPageToLoad: null == nextPageToLoad
          ? _value.nextPageToLoad
          : nextPageToLoad // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HomeMoodsSuccessStateImpl implements HomeMoodsSuccessState {
  const _$HomeMoodsSuccessStateImpl(
      {required final List<Mood> moods,
      required this.loadingMore,
      required this.hasReachedMax,
      required this.nextPageToLoad})
      : _moods = moods;

  final List<Mood> _moods;
  @override
  List<Mood> get moods {
    if (_moods is EqualUnmodifiableListView) return _moods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moods);
  }

  @override
  final bool loadingMore;
  @override
  final bool hasReachedMax;
  @override
  final int nextPageToLoad;

  @override
  String toString() {
    return 'HomeMoodsState.loaded(moods: $moods, loadingMore: $loadingMore, hasReachedMax: $hasReachedMax, nextPageToLoad: $nextPageToLoad)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeMoodsSuccessStateImpl &&
            const DeepCollectionEquality().equals(other._moods, _moods) &&
            (identical(other.loadingMore, loadingMore) ||
                other.loadingMore == loadingMore) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.nextPageToLoad, nextPageToLoad) ||
                other.nextPageToLoad == nextPageToLoad));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_moods),
      loadingMore,
      hasReachedMax,
      nextPageToLoad);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeMoodsSuccessStateImplCopyWith<_$HomeMoodsSuccessStateImpl>
      get copyWith => __$$HomeMoodsSuccessStateImplCopyWithImpl<
          _$HomeMoodsSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Mood> moods, bool loadingMore,
            bool hasReachedMax, int nextPageToLoad)
        loaded,
    required TResult Function() error,
  }) {
    return loaded(moods, loadingMore, hasReachedMax, nextPageToLoad);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Mood> moods, bool loadingMore, bool hasReachedMax,
            int nextPageToLoad)?
        loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(moods, loadingMore, hasReachedMax, nextPageToLoad);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Mood> moods, bool loadingMore, bool hasReachedMax,
            int nextPageToLoad)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(moods, loadingMore, hasReachedMax, nextPageToLoad);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeMoodsInitialState value) initial,
    required TResult Function(HomeMoodsLoadingState value) loading,
    required TResult Function(HomeMoodsSuccessState value) loaded,
    required TResult Function(HomeMoodsErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeMoodsInitialState value)? initial,
    TResult? Function(HomeMoodsLoadingState value)? loading,
    TResult? Function(HomeMoodsSuccessState value)? loaded,
    TResult? Function(HomeMoodsErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeMoodsInitialState value)? initial,
    TResult Function(HomeMoodsLoadingState value)? loading,
    TResult Function(HomeMoodsSuccessState value)? loaded,
    TResult Function(HomeMoodsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HomeMoodsSuccessState implements HomeMoodsState {
  const factory HomeMoodsSuccessState(
      {required final List<Mood> moods,
      required final bool loadingMore,
      required final bool hasReachedMax,
      required final int nextPageToLoad}) = _$HomeMoodsSuccessStateImpl;

  List<Mood> get moods;
  bool get loadingMore;
  bool get hasReachedMax;
  int get nextPageToLoad;
  @JsonKey(ignore: true)
  _$$HomeMoodsSuccessStateImplCopyWith<_$HomeMoodsSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeMoodsErrorStateImplCopyWith<$Res> {
  factory _$$HomeMoodsErrorStateImplCopyWith(_$HomeMoodsErrorStateImpl value,
          $Res Function(_$HomeMoodsErrorStateImpl) then) =
      __$$HomeMoodsErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeMoodsErrorStateImplCopyWithImpl<$Res>
    extends _$HomeMoodsStateCopyWithImpl<$Res, _$HomeMoodsErrorStateImpl>
    implements _$$HomeMoodsErrorStateImplCopyWith<$Res> {
  __$$HomeMoodsErrorStateImplCopyWithImpl(_$HomeMoodsErrorStateImpl _value,
      $Res Function(_$HomeMoodsErrorStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HomeMoodsErrorStateImpl implements HomeMoodsErrorState {
  const _$HomeMoodsErrorStateImpl();

  @override
  String toString() {
    return 'HomeMoodsState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeMoodsErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Mood> moods, bool loadingMore,
            bool hasReachedMax, int nextPageToLoad)
        loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Mood> moods, bool loadingMore, bool hasReachedMax,
            int nextPageToLoad)?
        loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Mood> moods, bool loadingMore, bool hasReachedMax,
            int nextPageToLoad)?
        loaded,
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
    required TResult Function(HomeMoodsInitialState value) initial,
    required TResult Function(HomeMoodsLoadingState value) loading,
    required TResult Function(HomeMoodsSuccessState value) loaded,
    required TResult Function(HomeMoodsErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeMoodsInitialState value)? initial,
    TResult? Function(HomeMoodsLoadingState value)? loading,
    TResult? Function(HomeMoodsSuccessState value)? loaded,
    TResult? Function(HomeMoodsErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeMoodsInitialState value)? initial,
    TResult Function(HomeMoodsLoadingState value)? loading,
    TResult Function(HomeMoodsSuccessState value)? loaded,
    TResult Function(HomeMoodsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HomeMoodsErrorState implements HomeMoodsState {
  const factory HomeMoodsErrorState() = _$HomeMoodsErrorStateImpl;
}
