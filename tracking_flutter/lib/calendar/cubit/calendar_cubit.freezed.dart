// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalendarState {
  CalendarMoodsState get moodsState => throw _privateConstructorUsedError;
  CalendarTargetDateState get targetDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarStateCopyWith<CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res, CalendarState>;
  @useResult
  $Res call(
      {CalendarMoodsState moodsState, CalendarTargetDateState targetDate});

  $CalendarMoodsStateCopyWith<$Res> get moodsState;
  $CalendarTargetDateStateCopyWith<$Res> get targetDate;
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res, $Val extends CalendarState>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moodsState = null,
    Object? targetDate = null,
  }) {
    return _then(_value.copyWith(
      moodsState: null == moodsState
          ? _value.moodsState
          : moodsState // ignore: cast_nullable_to_non_nullable
              as CalendarMoodsState,
      targetDate: null == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as CalendarTargetDateState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CalendarMoodsStateCopyWith<$Res> get moodsState {
    return $CalendarMoodsStateCopyWith<$Res>(_value.moodsState, (value) {
      return _then(_value.copyWith(moodsState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CalendarTargetDateStateCopyWith<$Res> get targetDate {
    return $CalendarTargetDateStateCopyWith<$Res>(_value.targetDate, (value) {
      return _then(_value.copyWith(targetDate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CalendarStateImplCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$$CalendarStateImplCopyWith(
          _$CalendarStateImpl value, $Res Function(_$CalendarStateImpl) then) =
      __$$CalendarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CalendarMoodsState moodsState, CalendarTargetDateState targetDate});

  @override
  $CalendarMoodsStateCopyWith<$Res> get moodsState;
  @override
  $CalendarTargetDateStateCopyWith<$Res> get targetDate;
}

/// @nodoc
class __$$CalendarStateImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$CalendarStateImpl>
    implements _$$CalendarStateImplCopyWith<$Res> {
  __$$CalendarStateImplCopyWithImpl(
      _$CalendarStateImpl _value, $Res Function(_$CalendarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moodsState = null,
    Object? targetDate = null,
  }) {
    return _then(_$CalendarStateImpl(
      moodsState: null == moodsState
          ? _value.moodsState
          : moodsState // ignore: cast_nullable_to_non_nullable
              as CalendarMoodsState,
      targetDate: null == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as CalendarTargetDateState,
    ));
  }
}

/// @nodoc

class _$CalendarStateImpl implements _CalendarState {
  const _$CalendarStateImpl(
      {this.moodsState = const CalendarMoodsState.initial(),
      this.targetDate = const CalendarTargetDateState.initial()});

  @override
  @JsonKey()
  final CalendarMoodsState moodsState;
  @override
  @JsonKey()
  final CalendarTargetDateState targetDate;

  @override
  String toString() {
    return 'CalendarState(moodsState: $moodsState, targetDate: $targetDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarStateImpl &&
            (identical(other.moodsState, moodsState) ||
                other.moodsState == moodsState) &&
            (identical(other.targetDate, targetDate) ||
                other.targetDate == targetDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, moodsState, targetDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarStateImplCopyWith<_$CalendarStateImpl> get copyWith =>
      __$$CalendarStateImplCopyWithImpl<_$CalendarStateImpl>(this, _$identity);
}

abstract class _CalendarState implements CalendarState {
  const factory _CalendarState(
      {final CalendarMoodsState moodsState,
      final CalendarTargetDateState targetDate}) = _$CalendarStateImpl;

  @override
  CalendarMoodsState get moodsState;
  @override
  CalendarTargetDateState get targetDate;
  @override
  @JsonKey(ignore: true)
  _$$CalendarStateImplCopyWith<_$CalendarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CalendarTargetDateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DateTime date) set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DateTime date)? set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DateTime date)? set,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CalendarTargetDateInitialState value) initial,
    required TResult Function(CalendarTargetDateSetState value) set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalendarTargetDateInitialState value)? initial,
    TResult? Function(CalendarTargetDateSetState value)? set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarTargetDateInitialState value)? initial,
    TResult Function(CalendarTargetDateSetState value)? set,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarTargetDateStateCopyWith<$Res> {
  factory $CalendarTargetDateStateCopyWith(CalendarTargetDateState value,
          $Res Function(CalendarTargetDateState) then) =
      _$CalendarTargetDateStateCopyWithImpl<$Res, CalendarTargetDateState>;
}

/// @nodoc
class _$CalendarTargetDateStateCopyWithImpl<$Res,
        $Val extends CalendarTargetDateState>
    implements $CalendarTargetDateStateCopyWith<$Res> {
  _$CalendarTargetDateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CalendarTargetDateInitialStateImplCopyWith<$Res> {
  factory _$$CalendarTargetDateInitialStateImplCopyWith(
          _$CalendarTargetDateInitialStateImpl value,
          $Res Function(_$CalendarTargetDateInitialStateImpl) then) =
      __$$CalendarTargetDateInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CalendarTargetDateInitialStateImplCopyWithImpl<$Res>
    extends _$CalendarTargetDateStateCopyWithImpl<$Res,
        _$CalendarTargetDateInitialStateImpl>
    implements _$$CalendarTargetDateInitialStateImplCopyWith<$Res> {
  __$$CalendarTargetDateInitialStateImplCopyWithImpl(
      _$CalendarTargetDateInitialStateImpl _value,
      $Res Function(_$CalendarTargetDateInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CalendarTargetDateInitialStateImpl
    implements CalendarTargetDateInitialState {
  const _$CalendarTargetDateInitialStateImpl();

  @override
  String toString() {
    return 'CalendarTargetDateState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarTargetDateInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DateTime date) set,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DateTime date)? set,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DateTime date)? set,
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
    required TResult Function(CalendarTargetDateInitialState value) initial,
    required TResult Function(CalendarTargetDateSetState value) set,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalendarTargetDateInitialState value)? initial,
    TResult? Function(CalendarTargetDateSetState value)? set,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarTargetDateInitialState value)? initial,
    TResult Function(CalendarTargetDateSetState value)? set,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CalendarTargetDateInitialState
    implements CalendarTargetDateState {
  const factory CalendarTargetDateInitialState() =
      _$CalendarTargetDateInitialStateImpl;
}

/// @nodoc
abstract class _$$CalendarTargetDateSetStateImplCopyWith<$Res> {
  factory _$$CalendarTargetDateSetStateImplCopyWith(
          _$CalendarTargetDateSetStateImpl value,
          $Res Function(_$CalendarTargetDateSetStateImpl) then) =
      __$$CalendarTargetDateSetStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$CalendarTargetDateSetStateImplCopyWithImpl<$Res>
    extends _$CalendarTargetDateStateCopyWithImpl<$Res,
        _$CalendarTargetDateSetStateImpl>
    implements _$$CalendarTargetDateSetStateImplCopyWith<$Res> {
  __$$CalendarTargetDateSetStateImplCopyWithImpl(
      _$CalendarTargetDateSetStateImpl _value,
      $Res Function(_$CalendarTargetDateSetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$CalendarTargetDateSetStateImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$CalendarTargetDateSetStateImpl implements CalendarTargetDateSetState {
  const _$CalendarTargetDateSetStateImpl({required this.date});

  @override
  final DateTime date;

  @override
  String toString() {
    return 'CalendarTargetDateState.set(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarTargetDateSetStateImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarTargetDateSetStateImplCopyWith<_$CalendarTargetDateSetStateImpl>
      get copyWith => __$$CalendarTargetDateSetStateImplCopyWithImpl<
          _$CalendarTargetDateSetStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DateTime date) set,
  }) {
    return set(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DateTime date)? set,
  }) {
    return set?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DateTime date)? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CalendarTargetDateInitialState value) initial,
    required TResult Function(CalendarTargetDateSetState value) set,
  }) {
    return set(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalendarTargetDateInitialState value)? initial,
    TResult? Function(CalendarTargetDateSetState value)? set,
  }) {
    return set?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarTargetDateInitialState value)? initial,
    TResult Function(CalendarTargetDateSetState value)? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(this);
    }
    return orElse();
  }
}

abstract class CalendarTargetDateSetState implements CalendarTargetDateState {
  const factory CalendarTargetDateSetState({required final DateTime date}) =
      _$CalendarTargetDateSetStateImpl;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$CalendarTargetDateSetStateImplCopyWith<_$CalendarTargetDateSetStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CalendarMoodsState {
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
    required TResult Function(CalendarMoodsInitialState value) initial,
    required TResult Function(CalendarMoodsLoadingState value) loading,
    required TResult Function(CalendarMoodsSuccessState value) loaded,
    required TResult Function(CalendarMoodsErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalendarMoodsInitialState value)? initial,
    TResult? Function(CalendarMoodsLoadingState value)? loading,
    TResult? Function(CalendarMoodsSuccessState value)? loaded,
    TResult? Function(CalendarMoodsErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarMoodsInitialState value)? initial,
    TResult Function(CalendarMoodsLoadingState value)? loading,
    TResult Function(CalendarMoodsSuccessState value)? loaded,
    TResult Function(CalendarMoodsErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarMoodsStateCopyWith<$Res> {
  factory $CalendarMoodsStateCopyWith(
          CalendarMoodsState value, $Res Function(CalendarMoodsState) then) =
      _$CalendarMoodsStateCopyWithImpl<$Res, CalendarMoodsState>;
}

/// @nodoc
class _$CalendarMoodsStateCopyWithImpl<$Res, $Val extends CalendarMoodsState>
    implements $CalendarMoodsStateCopyWith<$Res> {
  _$CalendarMoodsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CalendarMoodsInitialStateImplCopyWith<$Res> {
  factory _$$CalendarMoodsInitialStateImplCopyWith(
          _$CalendarMoodsInitialStateImpl value,
          $Res Function(_$CalendarMoodsInitialStateImpl) then) =
      __$$CalendarMoodsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CalendarMoodsInitialStateImplCopyWithImpl<$Res>
    extends _$CalendarMoodsStateCopyWithImpl<$Res,
        _$CalendarMoodsInitialStateImpl>
    implements _$$CalendarMoodsInitialStateImplCopyWith<$Res> {
  __$$CalendarMoodsInitialStateImplCopyWithImpl(
      _$CalendarMoodsInitialStateImpl _value,
      $Res Function(_$CalendarMoodsInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CalendarMoodsInitialStateImpl implements CalendarMoodsInitialState {
  const _$CalendarMoodsInitialStateImpl();

  @override
  String toString() {
    return 'CalendarMoodsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarMoodsInitialStateImpl);
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
    required TResult Function(CalendarMoodsInitialState value) initial,
    required TResult Function(CalendarMoodsLoadingState value) loading,
    required TResult Function(CalendarMoodsSuccessState value) loaded,
    required TResult Function(CalendarMoodsErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalendarMoodsInitialState value)? initial,
    TResult? Function(CalendarMoodsLoadingState value)? loading,
    TResult? Function(CalendarMoodsSuccessState value)? loaded,
    TResult? Function(CalendarMoodsErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarMoodsInitialState value)? initial,
    TResult Function(CalendarMoodsLoadingState value)? loading,
    TResult Function(CalendarMoodsSuccessState value)? loaded,
    TResult Function(CalendarMoodsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CalendarMoodsInitialState implements CalendarMoodsState {
  const factory CalendarMoodsInitialState() = _$CalendarMoodsInitialStateImpl;
}

/// @nodoc
abstract class _$$CalendarMoodsLoadingStateImplCopyWith<$Res> {
  factory _$$CalendarMoodsLoadingStateImplCopyWith(
          _$CalendarMoodsLoadingStateImpl value,
          $Res Function(_$CalendarMoodsLoadingStateImpl) then) =
      __$$CalendarMoodsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CalendarMoodsLoadingStateImplCopyWithImpl<$Res>
    extends _$CalendarMoodsStateCopyWithImpl<$Res,
        _$CalendarMoodsLoadingStateImpl>
    implements _$$CalendarMoodsLoadingStateImplCopyWith<$Res> {
  __$$CalendarMoodsLoadingStateImplCopyWithImpl(
      _$CalendarMoodsLoadingStateImpl _value,
      $Res Function(_$CalendarMoodsLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CalendarMoodsLoadingStateImpl implements CalendarMoodsLoadingState {
  const _$CalendarMoodsLoadingStateImpl();

  @override
  String toString() {
    return 'CalendarMoodsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarMoodsLoadingStateImpl);
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
    required TResult Function(CalendarMoodsInitialState value) initial,
    required TResult Function(CalendarMoodsLoadingState value) loading,
    required TResult Function(CalendarMoodsSuccessState value) loaded,
    required TResult Function(CalendarMoodsErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalendarMoodsInitialState value)? initial,
    TResult? Function(CalendarMoodsLoadingState value)? loading,
    TResult? Function(CalendarMoodsSuccessState value)? loaded,
    TResult? Function(CalendarMoodsErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarMoodsInitialState value)? initial,
    TResult Function(CalendarMoodsLoadingState value)? loading,
    TResult Function(CalendarMoodsSuccessState value)? loaded,
    TResult Function(CalendarMoodsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CalendarMoodsLoadingState implements CalendarMoodsState {
  const factory CalendarMoodsLoadingState() = _$CalendarMoodsLoadingStateImpl;
}

/// @nodoc
abstract class _$$CalendarMoodsSuccessStateImplCopyWith<$Res> {
  factory _$$CalendarMoodsSuccessStateImplCopyWith(
          _$CalendarMoodsSuccessStateImpl value,
          $Res Function(_$CalendarMoodsSuccessStateImpl) then) =
      __$$CalendarMoodsSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Mood> moods});
}

/// @nodoc
class __$$CalendarMoodsSuccessStateImplCopyWithImpl<$Res>
    extends _$CalendarMoodsStateCopyWithImpl<$Res,
        _$CalendarMoodsSuccessStateImpl>
    implements _$$CalendarMoodsSuccessStateImplCopyWith<$Res> {
  __$$CalendarMoodsSuccessStateImplCopyWithImpl(
      _$CalendarMoodsSuccessStateImpl _value,
      $Res Function(_$CalendarMoodsSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moods = null,
  }) {
    return _then(_$CalendarMoodsSuccessStateImpl(
      moods: null == moods
          ? _value._moods
          : moods // ignore: cast_nullable_to_non_nullable
              as List<Mood>,
    ));
  }
}

/// @nodoc

class _$CalendarMoodsSuccessStateImpl implements CalendarMoodsSuccessState {
  const _$CalendarMoodsSuccessStateImpl({required final List<Mood> moods})
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
    return 'CalendarMoodsState.loaded(moods: $moods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarMoodsSuccessStateImpl &&
            const DeepCollectionEquality().equals(other._moods, _moods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_moods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarMoodsSuccessStateImplCopyWith<_$CalendarMoodsSuccessStateImpl>
      get copyWith => __$$CalendarMoodsSuccessStateImplCopyWithImpl<
          _$CalendarMoodsSuccessStateImpl>(this, _$identity);

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
    required TResult Function(CalendarMoodsInitialState value) initial,
    required TResult Function(CalendarMoodsLoadingState value) loading,
    required TResult Function(CalendarMoodsSuccessState value) loaded,
    required TResult Function(CalendarMoodsErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalendarMoodsInitialState value)? initial,
    TResult? Function(CalendarMoodsLoadingState value)? loading,
    TResult? Function(CalendarMoodsSuccessState value)? loaded,
    TResult? Function(CalendarMoodsErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarMoodsInitialState value)? initial,
    TResult Function(CalendarMoodsLoadingState value)? loading,
    TResult Function(CalendarMoodsSuccessState value)? loaded,
    TResult Function(CalendarMoodsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class CalendarMoodsSuccessState implements CalendarMoodsState {
  const factory CalendarMoodsSuccessState({required final List<Mood> moods}) =
      _$CalendarMoodsSuccessStateImpl;

  List<Mood> get moods;
  @JsonKey(ignore: true)
  _$$CalendarMoodsSuccessStateImplCopyWith<_$CalendarMoodsSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CalendarMoodsErrorStateImplCopyWith<$Res> {
  factory _$$CalendarMoodsErrorStateImplCopyWith(
          _$CalendarMoodsErrorStateImpl value,
          $Res Function(_$CalendarMoodsErrorStateImpl) then) =
      __$$CalendarMoodsErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CalendarMoodsErrorStateImplCopyWithImpl<$Res>
    extends _$CalendarMoodsStateCopyWithImpl<$Res,
        _$CalendarMoodsErrorStateImpl>
    implements _$$CalendarMoodsErrorStateImplCopyWith<$Res> {
  __$$CalendarMoodsErrorStateImplCopyWithImpl(
      _$CalendarMoodsErrorStateImpl _value,
      $Res Function(_$CalendarMoodsErrorStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CalendarMoodsErrorStateImpl implements CalendarMoodsErrorState {
  const _$CalendarMoodsErrorStateImpl();

  @override
  String toString() {
    return 'CalendarMoodsState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarMoodsErrorStateImpl);
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
    required TResult Function(CalendarMoodsInitialState value) initial,
    required TResult Function(CalendarMoodsLoadingState value) loading,
    required TResult Function(CalendarMoodsSuccessState value) loaded,
    required TResult Function(CalendarMoodsErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalendarMoodsInitialState value)? initial,
    TResult? Function(CalendarMoodsLoadingState value)? loading,
    TResult? Function(CalendarMoodsSuccessState value)? loaded,
    TResult? Function(CalendarMoodsErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarMoodsInitialState value)? initial,
    TResult Function(CalendarMoodsLoadingState value)? loading,
    TResult Function(CalendarMoodsSuccessState value)? loaded,
    TResult Function(CalendarMoodsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CalendarMoodsErrorState implements CalendarMoodsState {
  const factory CalendarMoodsErrorState() = _$CalendarMoodsErrorStateImpl;
}
