// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_mood_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateMoodEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Mood mood) updateSubmitted,
    required TResult Function(double value) moodValueChanged,
    required TResult Function(String value) thingsIAmGratefulFor1Changed,
    required TResult Function(String value) thingsIAmGratefulFor2Changed,
    required TResult Function(String value) thingsIAmGratefulFor3Changed,
    required TResult Function(String value) revenueChanged,
    required TResult Function(Duration value) workTimeChanged,
    required TResult Function(Mood mood) moodSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Mood mood)? updateSubmitted,
    TResult? Function(double value)? moodValueChanged,
    TResult? Function(String value)? thingsIAmGratefulFor1Changed,
    TResult? Function(String value)? thingsIAmGratefulFor2Changed,
    TResult? Function(String value)? thingsIAmGratefulFor3Changed,
    TResult? Function(String value)? revenueChanged,
    TResult? Function(Duration value)? workTimeChanged,
    TResult? Function(Mood mood)? moodSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Mood mood)? updateSubmitted,
    TResult Function(double value)? moodValueChanged,
    TResult Function(String value)? thingsIAmGratefulFor1Changed,
    TResult Function(String value)? thingsIAmGratefulFor2Changed,
    TResult Function(String value)? thingsIAmGratefulFor3Changed,
    TResult Function(String value)? revenueChanged,
    TResult Function(Duration value)? workTimeChanged,
    TResult Function(Mood mood)? moodSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateSubmitted value) updateSubmitted,
    required TResult Function(_MoodValueChanged value) moodValueChanged,
    required TResult Function(_ThingsIAmGratefulFor1Changed value)
        thingsIAmGratefulFor1Changed,
    required TResult Function(_ThingsIAmGratefulFor2Changed value)
        thingsIAmGratefulFor2Changed,
    required TResult Function(_ThingsIAmGratefulFor3Changed value)
        thingsIAmGratefulFor3Changed,
    required TResult Function(_RevenueChanged value) revenueChanged,
    required TResult Function(_WorkTimeChanged value) workTimeChanged,
    required TResult Function(_MoodSelected value) moodSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateSubmitted value)? updateSubmitted,
    TResult? Function(_MoodValueChanged value)? moodValueChanged,
    TResult? Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult? Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult? Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult? Function(_RevenueChanged value)? revenueChanged,
    TResult? Function(_WorkTimeChanged value)? workTimeChanged,
    TResult? Function(_MoodSelected value)? moodSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateSubmitted value)? updateSubmitted,
    TResult Function(_MoodValueChanged value)? moodValueChanged,
    TResult Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult Function(_RevenueChanged value)? revenueChanged,
    TResult Function(_WorkTimeChanged value)? workTimeChanged,
    TResult Function(_MoodSelected value)? moodSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateMoodEventCopyWith<$Res> {
  factory $UpdateMoodEventCopyWith(
          UpdateMoodEvent value, $Res Function(UpdateMoodEvent) then) =
      _$UpdateMoodEventCopyWithImpl<$Res, UpdateMoodEvent>;
}

/// @nodoc
class _$UpdateMoodEventCopyWithImpl<$Res, $Val extends UpdateMoodEvent>
    implements $UpdateMoodEventCopyWith<$Res> {
  _$UpdateMoodEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UpdateSubmittedImplCopyWith<$Res> {
  factory _$$UpdateSubmittedImplCopyWith(_$UpdateSubmittedImpl value,
          $Res Function(_$UpdateSubmittedImpl) then) =
      __$$UpdateSubmittedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Mood mood});

  $MoodCopyWith<$Res> get mood;
}

/// @nodoc
class __$$UpdateSubmittedImplCopyWithImpl<$Res>
    extends _$UpdateMoodEventCopyWithImpl<$Res, _$UpdateSubmittedImpl>
    implements _$$UpdateSubmittedImplCopyWith<$Res> {
  __$$UpdateSubmittedImplCopyWithImpl(
      _$UpdateSubmittedImpl _value, $Res Function(_$UpdateSubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mood = null,
  }) {
    return _then(_$UpdateSubmittedImpl(
      null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood,
    ));
  }

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MoodCopyWith<$Res> get mood {
    return $MoodCopyWith<$Res>(_value.mood, (value) {
      return _then(_value.copyWith(mood: value));
    });
  }
}

/// @nodoc

class _$UpdateSubmittedImpl implements _UpdateSubmitted {
  const _$UpdateSubmittedImpl(this.mood);

  @override
  final Mood mood;

  @override
  String toString() {
    return 'UpdateMoodEvent.updateSubmitted(mood: $mood)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSubmittedImpl &&
            (identical(other.mood, mood) || other.mood == mood));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mood);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSubmittedImplCopyWith<_$UpdateSubmittedImpl> get copyWith =>
      __$$UpdateSubmittedImplCopyWithImpl<_$UpdateSubmittedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Mood mood) updateSubmitted,
    required TResult Function(double value) moodValueChanged,
    required TResult Function(String value) thingsIAmGratefulFor1Changed,
    required TResult Function(String value) thingsIAmGratefulFor2Changed,
    required TResult Function(String value) thingsIAmGratefulFor3Changed,
    required TResult Function(String value) revenueChanged,
    required TResult Function(Duration value) workTimeChanged,
    required TResult Function(Mood mood) moodSelected,
  }) {
    return updateSubmitted(mood);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Mood mood)? updateSubmitted,
    TResult? Function(double value)? moodValueChanged,
    TResult? Function(String value)? thingsIAmGratefulFor1Changed,
    TResult? Function(String value)? thingsIAmGratefulFor2Changed,
    TResult? Function(String value)? thingsIAmGratefulFor3Changed,
    TResult? Function(String value)? revenueChanged,
    TResult? Function(Duration value)? workTimeChanged,
    TResult? Function(Mood mood)? moodSelected,
  }) {
    return updateSubmitted?.call(mood);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Mood mood)? updateSubmitted,
    TResult Function(double value)? moodValueChanged,
    TResult Function(String value)? thingsIAmGratefulFor1Changed,
    TResult Function(String value)? thingsIAmGratefulFor2Changed,
    TResult Function(String value)? thingsIAmGratefulFor3Changed,
    TResult Function(String value)? revenueChanged,
    TResult Function(Duration value)? workTimeChanged,
    TResult Function(Mood mood)? moodSelected,
    required TResult orElse(),
  }) {
    if (updateSubmitted != null) {
      return updateSubmitted(mood);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateSubmitted value) updateSubmitted,
    required TResult Function(_MoodValueChanged value) moodValueChanged,
    required TResult Function(_ThingsIAmGratefulFor1Changed value)
        thingsIAmGratefulFor1Changed,
    required TResult Function(_ThingsIAmGratefulFor2Changed value)
        thingsIAmGratefulFor2Changed,
    required TResult Function(_ThingsIAmGratefulFor3Changed value)
        thingsIAmGratefulFor3Changed,
    required TResult Function(_RevenueChanged value) revenueChanged,
    required TResult Function(_WorkTimeChanged value) workTimeChanged,
    required TResult Function(_MoodSelected value) moodSelected,
  }) {
    return updateSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateSubmitted value)? updateSubmitted,
    TResult? Function(_MoodValueChanged value)? moodValueChanged,
    TResult? Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult? Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult? Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult? Function(_RevenueChanged value)? revenueChanged,
    TResult? Function(_WorkTimeChanged value)? workTimeChanged,
    TResult? Function(_MoodSelected value)? moodSelected,
  }) {
    return updateSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateSubmitted value)? updateSubmitted,
    TResult Function(_MoodValueChanged value)? moodValueChanged,
    TResult Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult Function(_RevenueChanged value)? revenueChanged,
    TResult Function(_WorkTimeChanged value)? workTimeChanged,
    TResult Function(_MoodSelected value)? moodSelected,
    required TResult orElse(),
  }) {
    if (updateSubmitted != null) {
      return updateSubmitted(this);
    }
    return orElse();
  }
}

abstract class _UpdateSubmitted implements UpdateMoodEvent {
  const factory _UpdateSubmitted(final Mood mood) = _$UpdateSubmittedImpl;

  Mood get mood;

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSubmittedImplCopyWith<_$UpdateSubmittedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MoodValueChangedImplCopyWith<$Res> {
  factory _$$MoodValueChangedImplCopyWith(_$MoodValueChangedImpl value,
          $Res Function(_$MoodValueChangedImpl) then) =
      __$$MoodValueChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$MoodValueChangedImplCopyWithImpl<$Res>
    extends _$UpdateMoodEventCopyWithImpl<$Res, _$MoodValueChangedImpl>
    implements _$$MoodValueChangedImplCopyWith<$Res> {
  __$$MoodValueChangedImplCopyWithImpl(_$MoodValueChangedImpl _value,
      $Res Function(_$MoodValueChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$MoodValueChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$MoodValueChangedImpl implements _MoodValueChanged {
  const _$MoodValueChangedImpl(this.value);

  @override
  final double value;

  @override
  String toString() {
    return 'UpdateMoodEvent.moodValueChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodValueChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoodValueChangedImplCopyWith<_$MoodValueChangedImpl> get copyWith =>
      __$$MoodValueChangedImplCopyWithImpl<_$MoodValueChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Mood mood) updateSubmitted,
    required TResult Function(double value) moodValueChanged,
    required TResult Function(String value) thingsIAmGratefulFor1Changed,
    required TResult Function(String value) thingsIAmGratefulFor2Changed,
    required TResult Function(String value) thingsIAmGratefulFor3Changed,
    required TResult Function(String value) revenueChanged,
    required TResult Function(Duration value) workTimeChanged,
    required TResult Function(Mood mood) moodSelected,
  }) {
    return moodValueChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Mood mood)? updateSubmitted,
    TResult? Function(double value)? moodValueChanged,
    TResult? Function(String value)? thingsIAmGratefulFor1Changed,
    TResult? Function(String value)? thingsIAmGratefulFor2Changed,
    TResult? Function(String value)? thingsIAmGratefulFor3Changed,
    TResult? Function(String value)? revenueChanged,
    TResult? Function(Duration value)? workTimeChanged,
    TResult? Function(Mood mood)? moodSelected,
  }) {
    return moodValueChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Mood mood)? updateSubmitted,
    TResult Function(double value)? moodValueChanged,
    TResult Function(String value)? thingsIAmGratefulFor1Changed,
    TResult Function(String value)? thingsIAmGratefulFor2Changed,
    TResult Function(String value)? thingsIAmGratefulFor3Changed,
    TResult Function(String value)? revenueChanged,
    TResult Function(Duration value)? workTimeChanged,
    TResult Function(Mood mood)? moodSelected,
    required TResult orElse(),
  }) {
    if (moodValueChanged != null) {
      return moodValueChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateSubmitted value) updateSubmitted,
    required TResult Function(_MoodValueChanged value) moodValueChanged,
    required TResult Function(_ThingsIAmGratefulFor1Changed value)
        thingsIAmGratefulFor1Changed,
    required TResult Function(_ThingsIAmGratefulFor2Changed value)
        thingsIAmGratefulFor2Changed,
    required TResult Function(_ThingsIAmGratefulFor3Changed value)
        thingsIAmGratefulFor3Changed,
    required TResult Function(_RevenueChanged value) revenueChanged,
    required TResult Function(_WorkTimeChanged value) workTimeChanged,
    required TResult Function(_MoodSelected value) moodSelected,
  }) {
    return moodValueChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateSubmitted value)? updateSubmitted,
    TResult? Function(_MoodValueChanged value)? moodValueChanged,
    TResult? Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult? Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult? Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult? Function(_RevenueChanged value)? revenueChanged,
    TResult? Function(_WorkTimeChanged value)? workTimeChanged,
    TResult? Function(_MoodSelected value)? moodSelected,
  }) {
    return moodValueChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateSubmitted value)? updateSubmitted,
    TResult Function(_MoodValueChanged value)? moodValueChanged,
    TResult Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult Function(_RevenueChanged value)? revenueChanged,
    TResult Function(_WorkTimeChanged value)? workTimeChanged,
    TResult Function(_MoodSelected value)? moodSelected,
    required TResult orElse(),
  }) {
    if (moodValueChanged != null) {
      return moodValueChanged(this);
    }
    return orElse();
  }
}

abstract class _MoodValueChanged implements UpdateMoodEvent {
  const factory _MoodValueChanged(final double value) = _$MoodValueChangedImpl;

  double get value;

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoodValueChangedImplCopyWith<_$MoodValueChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThingsIAmGratefulFor1ChangedImplCopyWith<$Res> {
  factory _$$ThingsIAmGratefulFor1ChangedImplCopyWith(
          _$ThingsIAmGratefulFor1ChangedImpl value,
          $Res Function(_$ThingsIAmGratefulFor1ChangedImpl) then) =
      __$$ThingsIAmGratefulFor1ChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$ThingsIAmGratefulFor1ChangedImplCopyWithImpl<$Res>
    extends _$UpdateMoodEventCopyWithImpl<$Res,
        _$ThingsIAmGratefulFor1ChangedImpl>
    implements _$$ThingsIAmGratefulFor1ChangedImplCopyWith<$Res> {
  __$$ThingsIAmGratefulFor1ChangedImplCopyWithImpl(
      _$ThingsIAmGratefulFor1ChangedImpl _value,
      $Res Function(_$ThingsIAmGratefulFor1ChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ThingsIAmGratefulFor1ChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ThingsIAmGratefulFor1ChangedImpl
    implements _ThingsIAmGratefulFor1Changed {
  const _$ThingsIAmGratefulFor1ChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'UpdateMoodEvent.thingsIAmGratefulFor1Changed(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThingsIAmGratefulFor1ChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThingsIAmGratefulFor1ChangedImplCopyWith<
          _$ThingsIAmGratefulFor1ChangedImpl>
      get copyWith => __$$ThingsIAmGratefulFor1ChangedImplCopyWithImpl<
          _$ThingsIAmGratefulFor1ChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Mood mood) updateSubmitted,
    required TResult Function(double value) moodValueChanged,
    required TResult Function(String value) thingsIAmGratefulFor1Changed,
    required TResult Function(String value) thingsIAmGratefulFor2Changed,
    required TResult Function(String value) thingsIAmGratefulFor3Changed,
    required TResult Function(String value) revenueChanged,
    required TResult Function(Duration value) workTimeChanged,
    required TResult Function(Mood mood) moodSelected,
  }) {
    return thingsIAmGratefulFor1Changed(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Mood mood)? updateSubmitted,
    TResult? Function(double value)? moodValueChanged,
    TResult? Function(String value)? thingsIAmGratefulFor1Changed,
    TResult? Function(String value)? thingsIAmGratefulFor2Changed,
    TResult? Function(String value)? thingsIAmGratefulFor3Changed,
    TResult? Function(String value)? revenueChanged,
    TResult? Function(Duration value)? workTimeChanged,
    TResult? Function(Mood mood)? moodSelected,
  }) {
    return thingsIAmGratefulFor1Changed?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Mood mood)? updateSubmitted,
    TResult Function(double value)? moodValueChanged,
    TResult Function(String value)? thingsIAmGratefulFor1Changed,
    TResult Function(String value)? thingsIAmGratefulFor2Changed,
    TResult Function(String value)? thingsIAmGratefulFor3Changed,
    TResult Function(String value)? revenueChanged,
    TResult Function(Duration value)? workTimeChanged,
    TResult Function(Mood mood)? moodSelected,
    required TResult orElse(),
  }) {
    if (thingsIAmGratefulFor1Changed != null) {
      return thingsIAmGratefulFor1Changed(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateSubmitted value) updateSubmitted,
    required TResult Function(_MoodValueChanged value) moodValueChanged,
    required TResult Function(_ThingsIAmGratefulFor1Changed value)
        thingsIAmGratefulFor1Changed,
    required TResult Function(_ThingsIAmGratefulFor2Changed value)
        thingsIAmGratefulFor2Changed,
    required TResult Function(_ThingsIAmGratefulFor3Changed value)
        thingsIAmGratefulFor3Changed,
    required TResult Function(_RevenueChanged value) revenueChanged,
    required TResult Function(_WorkTimeChanged value) workTimeChanged,
    required TResult Function(_MoodSelected value) moodSelected,
  }) {
    return thingsIAmGratefulFor1Changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateSubmitted value)? updateSubmitted,
    TResult? Function(_MoodValueChanged value)? moodValueChanged,
    TResult? Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult? Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult? Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult? Function(_RevenueChanged value)? revenueChanged,
    TResult? Function(_WorkTimeChanged value)? workTimeChanged,
    TResult? Function(_MoodSelected value)? moodSelected,
  }) {
    return thingsIAmGratefulFor1Changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateSubmitted value)? updateSubmitted,
    TResult Function(_MoodValueChanged value)? moodValueChanged,
    TResult Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult Function(_RevenueChanged value)? revenueChanged,
    TResult Function(_WorkTimeChanged value)? workTimeChanged,
    TResult Function(_MoodSelected value)? moodSelected,
    required TResult orElse(),
  }) {
    if (thingsIAmGratefulFor1Changed != null) {
      return thingsIAmGratefulFor1Changed(this);
    }
    return orElse();
  }
}

abstract class _ThingsIAmGratefulFor1Changed implements UpdateMoodEvent {
  const factory _ThingsIAmGratefulFor1Changed(final String value) =
      _$ThingsIAmGratefulFor1ChangedImpl;

  String get value;

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThingsIAmGratefulFor1ChangedImplCopyWith<
          _$ThingsIAmGratefulFor1ChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThingsIAmGratefulFor2ChangedImplCopyWith<$Res> {
  factory _$$ThingsIAmGratefulFor2ChangedImplCopyWith(
          _$ThingsIAmGratefulFor2ChangedImpl value,
          $Res Function(_$ThingsIAmGratefulFor2ChangedImpl) then) =
      __$$ThingsIAmGratefulFor2ChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$ThingsIAmGratefulFor2ChangedImplCopyWithImpl<$Res>
    extends _$UpdateMoodEventCopyWithImpl<$Res,
        _$ThingsIAmGratefulFor2ChangedImpl>
    implements _$$ThingsIAmGratefulFor2ChangedImplCopyWith<$Res> {
  __$$ThingsIAmGratefulFor2ChangedImplCopyWithImpl(
      _$ThingsIAmGratefulFor2ChangedImpl _value,
      $Res Function(_$ThingsIAmGratefulFor2ChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ThingsIAmGratefulFor2ChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ThingsIAmGratefulFor2ChangedImpl
    implements _ThingsIAmGratefulFor2Changed {
  const _$ThingsIAmGratefulFor2ChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'UpdateMoodEvent.thingsIAmGratefulFor2Changed(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThingsIAmGratefulFor2ChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThingsIAmGratefulFor2ChangedImplCopyWith<
          _$ThingsIAmGratefulFor2ChangedImpl>
      get copyWith => __$$ThingsIAmGratefulFor2ChangedImplCopyWithImpl<
          _$ThingsIAmGratefulFor2ChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Mood mood) updateSubmitted,
    required TResult Function(double value) moodValueChanged,
    required TResult Function(String value) thingsIAmGratefulFor1Changed,
    required TResult Function(String value) thingsIAmGratefulFor2Changed,
    required TResult Function(String value) thingsIAmGratefulFor3Changed,
    required TResult Function(String value) revenueChanged,
    required TResult Function(Duration value) workTimeChanged,
    required TResult Function(Mood mood) moodSelected,
  }) {
    return thingsIAmGratefulFor2Changed(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Mood mood)? updateSubmitted,
    TResult? Function(double value)? moodValueChanged,
    TResult? Function(String value)? thingsIAmGratefulFor1Changed,
    TResult? Function(String value)? thingsIAmGratefulFor2Changed,
    TResult? Function(String value)? thingsIAmGratefulFor3Changed,
    TResult? Function(String value)? revenueChanged,
    TResult? Function(Duration value)? workTimeChanged,
    TResult? Function(Mood mood)? moodSelected,
  }) {
    return thingsIAmGratefulFor2Changed?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Mood mood)? updateSubmitted,
    TResult Function(double value)? moodValueChanged,
    TResult Function(String value)? thingsIAmGratefulFor1Changed,
    TResult Function(String value)? thingsIAmGratefulFor2Changed,
    TResult Function(String value)? thingsIAmGratefulFor3Changed,
    TResult Function(String value)? revenueChanged,
    TResult Function(Duration value)? workTimeChanged,
    TResult Function(Mood mood)? moodSelected,
    required TResult orElse(),
  }) {
    if (thingsIAmGratefulFor2Changed != null) {
      return thingsIAmGratefulFor2Changed(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateSubmitted value) updateSubmitted,
    required TResult Function(_MoodValueChanged value) moodValueChanged,
    required TResult Function(_ThingsIAmGratefulFor1Changed value)
        thingsIAmGratefulFor1Changed,
    required TResult Function(_ThingsIAmGratefulFor2Changed value)
        thingsIAmGratefulFor2Changed,
    required TResult Function(_ThingsIAmGratefulFor3Changed value)
        thingsIAmGratefulFor3Changed,
    required TResult Function(_RevenueChanged value) revenueChanged,
    required TResult Function(_WorkTimeChanged value) workTimeChanged,
    required TResult Function(_MoodSelected value) moodSelected,
  }) {
    return thingsIAmGratefulFor2Changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateSubmitted value)? updateSubmitted,
    TResult? Function(_MoodValueChanged value)? moodValueChanged,
    TResult? Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult? Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult? Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult? Function(_RevenueChanged value)? revenueChanged,
    TResult? Function(_WorkTimeChanged value)? workTimeChanged,
    TResult? Function(_MoodSelected value)? moodSelected,
  }) {
    return thingsIAmGratefulFor2Changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateSubmitted value)? updateSubmitted,
    TResult Function(_MoodValueChanged value)? moodValueChanged,
    TResult Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult Function(_RevenueChanged value)? revenueChanged,
    TResult Function(_WorkTimeChanged value)? workTimeChanged,
    TResult Function(_MoodSelected value)? moodSelected,
    required TResult orElse(),
  }) {
    if (thingsIAmGratefulFor2Changed != null) {
      return thingsIAmGratefulFor2Changed(this);
    }
    return orElse();
  }
}

abstract class _ThingsIAmGratefulFor2Changed implements UpdateMoodEvent {
  const factory _ThingsIAmGratefulFor2Changed(final String value) =
      _$ThingsIAmGratefulFor2ChangedImpl;

  String get value;

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThingsIAmGratefulFor2ChangedImplCopyWith<
          _$ThingsIAmGratefulFor2ChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThingsIAmGratefulFor3ChangedImplCopyWith<$Res> {
  factory _$$ThingsIAmGratefulFor3ChangedImplCopyWith(
          _$ThingsIAmGratefulFor3ChangedImpl value,
          $Res Function(_$ThingsIAmGratefulFor3ChangedImpl) then) =
      __$$ThingsIAmGratefulFor3ChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$ThingsIAmGratefulFor3ChangedImplCopyWithImpl<$Res>
    extends _$UpdateMoodEventCopyWithImpl<$Res,
        _$ThingsIAmGratefulFor3ChangedImpl>
    implements _$$ThingsIAmGratefulFor3ChangedImplCopyWith<$Res> {
  __$$ThingsIAmGratefulFor3ChangedImplCopyWithImpl(
      _$ThingsIAmGratefulFor3ChangedImpl _value,
      $Res Function(_$ThingsIAmGratefulFor3ChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ThingsIAmGratefulFor3ChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ThingsIAmGratefulFor3ChangedImpl
    implements _ThingsIAmGratefulFor3Changed {
  const _$ThingsIAmGratefulFor3ChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'UpdateMoodEvent.thingsIAmGratefulFor3Changed(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThingsIAmGratefulFor3ChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThingsIAmGratefulFor3ChangedImplCopyWith<
          _$ThingsIAmGratefulFor3ChangedImpl>
      get copyWith => __$$ThingsIAmGratefulFor3ChangedImplCopyWithImpl<
          _$ThingsIAmGratefulFor3ChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Mood mood) updateSubmitted,
    required TResult Function(double value) moodValueChanged,
    required TResult Function(String value) thingsIAmGratefulFor1Changed,
    required TResult Function(String value) thingsIAmGratefulFor2Changed,
    required TResult Function(String value) thingsIAmGratefulFor3Changed,
    required TResult Function(String value) revenueChanged,
    required TResult Function(Duration value) workTimeChanged,
    required TResult Function(Mood mood) moodSelected,
  }) {
    return thingsIAmGratefulFor3Changed(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Mood mood)? updateSubmitted,
    TResult? Function(double value)? moodValueChanged,
    TResult? Function(String value)? thingsIAmGratefulFor1Changed,
    TResult? Function(String value)? thingsIAmGratefulFor2Changed,
    TResult? Function(String value)? thingsIAmGratefulFor3Changed,
    TResult? Function(String value)? revenueChanged,
    TResult? Function(Duration value)? workTimeChanged,
    TResult? Function(Mood mood)? moodSelected,
  }) {
    return thingsIAmGratefulFor3Changed?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Mood mood)? updateSubmitted,
    TResult Function(double value)? moodValueChanged,
    TResult Function(String value)? thingsIAmGratefulFor1Changed,
    TResult Function(String value)? thingsIAmGratefulFor2Changed,
    TResult Function(String value)? thingsIAmGratefulFor3Changed,
    TResult Function(String value)? revenueChanged,
    TResult Function(Duration value)? workTimeChanged,
    TResult Function(Mood mood)? moodSelected,
    required TResult orElse(),
  }) {
    if (thingsIAmGratefulFor3Changed != null) {
      return thingsIAmGratefulFor3Changed(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateSubmitted value) updateSubmitted,
    required TResult Function(_MoodValueChanged value) moodValueChanged,
    required TResult Function(_ThingsIAmGratefulFor1Changed value)
        thingsIAmGratefulFor1Changed,
    required TResult Function(_ThingsIAmGratefulFor2Changed value)
        thingsIAmGratefulFor2Changed,
    required TResult Function(_ThingsIAmGratefulFor3Changed value)
        thingsIAmGratefulFor3Changed,
    required TResult Function(_RevenueChanged value) revenueChanged,
    required TResult Function(_WorkTimeChanged value) workTimeChanged,
    required TResult Function(_MoodSelected value) moodSelected,
  }) {
    return thingsIAmGratefulFor3Changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateSubmitted value)? updateSubmitted,
    TResult? Function(_MoodValueChanged value)? moodValueChanged,
    TResult? Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult? Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult? Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult? Function(_RevenueChanged value)? revenueChanged,
    TResult? Function(_WorkTimeChanged value)? workTimeChanged,
    TResult? Function(_MoodSelected value)? moodSelected,
  }) {
    return thingsIAmGratefulFor3Changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateSubmitted value)? updateSubmitted,
    TResult Function(_MoodValueChanged value)? moodValueChanged,
    TResult Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult Function(_RevenueChanged value)? revenueChanged,
    TResult Function(_WorkTimeChanged value)? workTimeChanged,
    TResult Function(_MoodSelected value)? moodSelected,
    required TResult orElse(),
  }) {
    if (thingsIAmGratefulFor3Changed != null) {
      return thingsIAmGratefulFor3Changed(this);
    }
    return orElse();
  }
}

abstract class _ThingsIAmGratefulFor3Changed implements UpdateMoodEvent {
  const factory _ThingsIAmGratefulFor3Changed(final String value) =
      _$ThingsIAmGratefulFor3ChangedImpl;

  String get value;

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThingsIAmGratefulFor3ChangedImplCopyWith<
          _$ThingsIAmGratefulFor3ChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RevenueChangedImplCopyWith<$Res> {
  factory _$$RevenueChangedImplCopyWith(_$RevenueChangedImpl value,
          $Res Function(_$RevenueChangedImpl) then) =
      __$$RevenueChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$RevenueChangedImplCopyWithImpl<$Res>
    extends _$UpdateMoodEventCopyWithImpl<$Res, _$RevenueChangedImpl>
    implements _$$RevenueChangedImplCopyWith<$Res> {
  __$$RevenueChangedImplCopyWithImpl(
      _$RevenueChangedImpl _value, $Res Function(_$RevenueChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$RevenueChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RevenueChangedImpl implements _RevenueChanged {
  const _$RevenueChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'UpdateMoodEvent.revenueChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RevenueChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RevenueChangedImplCopyWith<_$RevenueChangedImpl> get copyWith =>
      __$$RevenueChangedImplCopyWithImpl<_$RevenueChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Mood mood) updateSubmitted,
    required TResult Function(double value) moodValueChanged,
    required TResult Function(String value) thingsIAmGratefulFor1Changed,
    required TResult Function(String value) thingsIAmGratefulFor2Changed,
    required TResult Function(String value) thingsIAmGratefulFor3Changed,
    required TResult Function(String value) revenueChanged,
    required TResult Function(Duration value) workTimeChanged,
    required TResult Function(Mood mood) moodSelected,
  }) {
    return revenueChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Mood mood)? updateSubmitted,
    TResult? Function(double value)? moodValueChanged,
    TResult? Function(String value)? thingsIAmGratefulFor1Changed,
    TResult? Function(String value)? thingsIAmGratefulFor2Changed,
    TResult? Function(String value)? thingsIAmGratefulFor3Changed,
    TResult? Function(String value)? revenueChanged,
    TResult? Function(Duration value)? workTimeChanged,
    TResult? Function(Mood mood)? moodSelected,
  }) {
    return revenueChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Mood mood)? updateSubmitted,
    TResult Function(double value)? moodValueChanged,
    TResult Function(String value)? thingsIAmGratefulFor1Changed,
    TResult Function(String value)? thingsIAmGratefulFor2Changed,
    TResult Function(String value)? thingsIAmGratefulFor3Changed,
    TResult Function(String value)? revenueChanged,
    TResult Function(Duration value)? workTimeChanged,
    TResult Function(Mood mood)? moodSelected,
    required TResult orElse(),
  }) {
    if (revenueChanged != null) {
      return revenueChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateSubmitted value) updateSubmitted,
    required TResult Function(_MoodValueChanged value) moodValueChanged,
    required TResult Function(_ThingsIAmGratefulFor1Changed value)
        thingsIAmGratefulFor1Changed,
    required TResult Function(_ThingsIAmGratefulFor2Changed value)
        thingsIAmGratefulFor2Changed,
    required TResult Function(_ThingsIAmGratefulFor3Changed value)
        thingsIAmGratefulFor3Changed,
    required TResult Function(_RevenueChanged value) revenueChanged,
    required TResult Function(_WorkTimeChanged value) workTimeChanged,
    required TResult Function(_MoodSelected value) moodSelected,
  }) {
    return revenueChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateSubmitted value)? updateSubmitted,
    TResult? Function(_MoodValueChanged value)? moodValueChanged,
    TResult? Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult? Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult? Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult? Function(_RevenueChanged value)? revenueChanged,
    TResult? Function(_WorkTimeChanged value)? workTimeChanged,
    TResult? Function(_MoodSelected value)? moodSelected,
  }) {
    return revenueChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateSubmitted value)? updateSubmitted,
    TResult Function(_MoodValueChanged value)? moodValueChanged,
    TResult Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult Function(_RevenueChanged value)? revenueChanged,
    TResult Function(_WorkTimeChanged value)? workTimeChanged,
    TResult Function(_MoodSelected value)? moodSelected,
    required TResult orElse(),
  }) {
    if (revenueChanged != null) {
      return revenueChanged(this);
    }
    return orElse();
  }
}

abstract class _RevenueChanged implements UpdateMoodEvent {
  const factory _RevenueChanged(final String value) = _$RevenueChangedImpl;

  String get value;

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RevenueChangedImplCopyWith<_$RevenueChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WorkTimeChangedImplCopyWith<$Res> {
  factory _$$WorkTimeChangedImplCopyWith(_$WorkTimeChangedImpl value,
          $Res Function(_$WorkTimeChangedImpl) then) =
      __$$WorkTimeChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration value});
}

/// @nodoc
class __$$WorkTimeChangedImplCopyWithImpl<$Res>
    extends _$UpdateMoodEventCopyWithImpl<$Res, _$WorkTimeChangedImpl>
    implements _$$WorkTimeChangedImplCopyWith<$Res> {
  __$$WorkTimeChangedImplCopyWithImpl(
      _$WorkTimeChangedImpl _value, $Res Function(_$WorkTimeChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$WorkTimeChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$WorkTimeChangedImpl implements _WorkTimeChanged {
  const _$WorkTimeChangedImpl(this.value);

  @override
  final Duration value;

  @override
  String toString() {
    return 'UpdateMoodEvent.workTimeChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkTimeChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkTimeChangedImplCopyWith<_$WorkTimeChangedImpl> get copyWith =>
      __$$WorkTimeChangedImplCopyWithImpl<_$WorkTimeChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Mood mood) updateSubmitted,
    required TResult Function(double value) moodValueChanged,
    required TResult Function(String value) thingsIAmGratefulFor1Changed,
    required TResult Function(String value) thingsIAmGratefulFor2Changed,
    required TResult Function(String value) thingsIAmGratefulFor3Changed,
    required TResult Function(String value) revenueChanged,
    required TResult Function(Duration value) workTimeChanged,
    required TResult Function(Mood mood) moodSelected,
  }) {
    return workTimeChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Mood mood)? updateSubmitted,
    TResult? Function(double value)? moodValueChanged,
    TResult? Function(String value)? thingsIAmGratefulFor1Changed,
    TResult? Function(String value)? thingsIAmGratefulFor2Changed,
    TResult? Function(String value)? thingsIAmGratefulFor3Changed,
    TResult? Function(String value)? revenueChanged,
    TResult? Function(Duration value)? workTimeChanged,
    TResult? Function(Mood mood)? moodSelected,
  }) {
    return workTimeChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Mood mood)? updateSubmitted,
    TResult Function(double value)? moodValueChanged,
    TResult Function(String value)? thingsIAmGratefulFor1Changed,
    TResult Function(String value)? thingsIAmGratefulFor2Changed,
    TResult Function(String value)? thingsIAmGratefulFor3Changed,
    TResult Function(String value)? revenueChanged,
    TResult Function(Duration value)? workTimeChanged,
    TResult Function(Mood mood)? moodSelected,
    required TResult orElse(),
  }) {
    if (workTimeChanged != null) {
      return workTimeChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateSubmitted value) updateSubmitted,
    required TResult Function(_MoodValueChanged value) moodValueChanged,
    required TResult Function(_ThingsIAmGratefulFor1Changed value)
        thingsIAmGratefulFor1Changed,
    required TResult Function(_ThingsIAmGratefulFor2Changed value)
        thingsIAmGratefulFor2Changed,
    required TResult Function(_ThingsIAmGratefulFor3Changed value)
        thingsIAmGratefulFor3Changed,
    required TResult Function(_RevenueChanged value) revenueChanged,
    required TResult Function(_WorkTimeChanged value) workTimeChanged,
    required TResult Function(_MoodSelected value) moodSelected,
  }) {
    return workTimeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateSubmitted value)? updateSubmitted,
    TResult? Function(_MoodValueChanged value)? moodValueChanged,
    TResult? Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult? Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult? Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult? Function(_RevenueChanged value)? revenueChanged,
    TResult? Function(_WorkTimeChanged value)? workTimeChanged,
    TResult? Function(_MoodSelected value)? moodSelected,
  }) {
    return workTimeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateSubmitted value)? updateSubmitted,
    TResult Function(_MoodValueChanged value)? moodValueChanged,
    TResult Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult Function(_RevenueChanged value)? revenueChanged,
    TResult Function(_WorkTimeChanged value)? workTimeChanged,
    TResult Function(_MoodSelected value)? moodSelected,
    required TResult orElse(),
  }) {
    if (workTimeChanged != null) {
      return workTimeChanged(this);
    }
    return orElse();
  }
}

abstract class _WorkTimeChanged implements UpdateMoodEvent {
  const factory _WorkTimeChanged(final Duration value) = _$WorkTimeChangedImpl;

  Duration get value;

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkTimeChangedImplCopyWith<_$WorkTimeChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MoodSelectedImplCopyWith<$Res> {
  factory _$$MoodSelectedImplCopyWith(
          _$MoodSelectedImpl value, $Res Function(_$MoodSelectedImpl) then) =
      __$$MoodSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Mood mood});

  $MoodCopyWith<$Res> get mood;
}

/// @nodoc
class __$$MoodSelectedImplCopyWithImpl<$Res>
    extends _$UpdateMoodEventCopyWithImpl<$Res, _$MoodSelectedImpl>
    implements _$$MoodSelectedImplCopyWith<$Res> {
  __$$MoodSelectedImplCopyWithImpl(
      _$MoodSelectedImpl _value, $Res Function(_$MoodSelectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mood = null,
  }) {
    return _then(_$MoodSelectedImpl(
      null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood,
    ));
  }

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MoodCopyWith<$Res> get mood {
    return $MoodCopyWith<$Res>(_value.mood, (value) {
      return _then(_value.copyWith(mood: value));
    });
  }
}

/// @nodoc

class _$MoodSelectedImpl implements _MoodSelected {
  const _$MoodSelectedImpl(this.mood);

  @override
  final Mood mood;

  @override
  String toString() {
    return 'UpdateMoodEvent.moodSelected(mood: $mood)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodSelectedImpl &&
            (identical(other.mood, mood) || other.mood == mood));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mood);

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoodSelectedImplCopyWith<_$MoodSelectedImpl> get copyWith =>
      __$$MoodSelectedImplCopyWithImpl<_$MoodSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Mood mood) updateSubmitted,
    required TResult Function(double value) moodValueChanged,
    required TResult Function(String value) thingsIAmGratefulFor1Changed,
    required TResult Function(String value) thingsIAmGratefulFor2Changed,
    required TResult Function(String value) thingsIAmGratefulFor3Changed,
    required TResult Function(String value) revenueChanged,
    required TResult Function(Duration value) workTimeChanged,
    required TResult Function(Mood mood) moodSelected,
  }) {
    return moodSelected(mood);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Mood mood)? updateSubmitted,
    TResult? Function(double value)? moodValueChanged,
    TResult? Function(String value)? thingsIAmGratefulFor1Changed,
    TResult? Function(String value)? thingsIAmGratefulFor2Changed,
    TResult? Function(String value)? thingsIAmGratefulFor3Changed,
    TResult? Function(String value)? revenueChanged,
    TResult? Function(Duration value)? workTimeChanged,
    TResult? Function(Mood mood)? moodSelected,
  }) {
    return moodSelected?.call(mood);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Mood mood)? updateSubmitted,
    TResult Function(double value)? moodValueChanged,
    TResult Function(String value)? thingsIAmGratefulFor1Changed,
    TResult Function(String value)? thingsIAmGratefulFor2Changed,
    TResult Function(String value)? thingsIAmGratefulFor3Changed,
    TResult Function(String value)? revenueChanged,
    TResult Function(Duration value)? workTimeChanged,
    TResult Function(Mood mood)? moodSelected,
    required TResult orElse(),
  }) {
    if (moodSelected != null) {
      return moodSelected(mood);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateSubmitted value) updateSubmitted,
    required TResult Function(_MoodValueChanged value) moodValueChanged,
    required TResult Function(_ThingsIAmGratefulFor1Changed value)
        thingsIAmGratefulFor1Changed,
    required TResult Function(_ThingsIAmGratefulFor2Changed value)
        thingsIAmGratefulFor2Changed,
    required TResult Function(_ThingsIAmGratefulFor3Changed value)
        thingsIAmGratefulFor3Changed,
    required TResult Function(_RevenueChanged value) revenueChanged,
    required TResult Function(_WorkTimeChanged value) workTimeChanged,
    required TResult Function(_MoodSelected value) moodSelected,
  }) {
    return moodSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateSubmitted value)? updateSubmitted,
    TResult? Function(_MoodValueChanged value)? moodValueChanged,
    TResult? Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult? Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult? Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult? Function(_RevenueChanged value)? revenueChanged,
    TResult? Function(_WorkTimeChanged value)? workTimeChanged,
    TResult? Function(_MoodSelected value)? moodSelected,
  }) {
    return moodSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateSubmitted value)? updateSubmitted,
    TResult Function(_MoodValueChanged value)? moodValueChanged,
    TResult Function(_ThingsIAmGratefulFor1Changed value)?
        thingsIAmGratefulFor1Changed,
    TResult Function(_ThingsIAmGratefulFor2Changed value)?
        thingsIAmGratefulFor2Changed,
    TResult Function(_ThingsIAmGratefulFor3Changed value)?
        thingsIAmGratefulFor3Changed,
    TResult Function(_RevenueChanged value)? revenueChanged,
    TResult Function(_WorkTimeChanged value)? workTimeChanged,
    TResult Function(_MoodSelected value)? moodSelected,
    required TResult orElse(),
  }) {
    if (moodSelected != null) {
      return moodSelected(this);
    }
    return orElse();
  }
}

abstract class _MoodSelected implements UpdateMoodEvent {
  const factory _MoodSelected(final Mood mood) = _$MoodSelectedImpl;

  Mood get mood;

  /// Create a copy of UpdateMoodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoodSelectedImplCopyWith<_$MoodSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateMoodState {
  FormzSubmissionStatus get formStatus => throw _privateConstructorUsedError;
  MoodFormzState get moodFormState => throw _privateConstructorUsedError;
  Mood? get mood => throw _privateConstructorUsedError;

  /// Create a copy of UpdateMoodState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateMoodStateCopyWith<UpdateMoodState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateMoodStateCopyWith<$Res> {
  factory $UpdateMoodStateCopyWith(
          UpdateMoodState value, $Res Function(UpdateMoodState) then) =
      _$UpdateMoodStateCopyWithImpl<$Res, UpdateMoodState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus formStatus,
      MoodFormzState moodFormState,
      Mood? mood});

  $MoodCopyWith<$Res>? get mood;
}

/// @nodoc
class _$UpdateMoodStateCopyWithImpl<$Res, $Val extends UpdateMoodState>
    implements $UpdateMoodStateCopyWith<$Res> {
  _$UpdateMoodStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateMoodState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formStatus = null,
    Object? moodFormState = null,
    Object? mood = freezed,
  }) {
    return _then(_value.copyWith(
      formStatus: null == formStatus
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      moodFormState: null == moodFormState
          ? _value.moodFormState
          : moodFormState // ignore: cast_nullable_to_non_nullable
              as MoodFormzState,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood?,
    ) as $Val);
  }

  /// Create a copy of UpdateMoodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MoodCopyWith<$Res>? get mood {
    if (_value.mood == null) {
      return null;
    }

    return $MoodCopyWith<$Res>(_value.mood!, (value) {
      return _then(_value.copyWith(mood: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdateMoodStateImplCopyWith<$Res>
    implements $UpdateMoodStateCopyWith<$Res> {
  factory _$$UpdateMoodStateImplCopyWith(_$UpdateMoodStateImpl value,
          $Res Function(_$UpdateMoodStateImpl) then) =
      __$$UpdateMoodStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus formStatus,
      MoodFormzState moodFormState,
      Mood? mood});

  @override
  $MoodCopyWith<$Res>? get mood;
}

/// @nodoc
class __$$UpdateMoodStateImplCopyWithImpl<$Res>
    extends _$UpdateMoodStateCopyWithImpl<$Res, _$UpdateMoodStateImpl>
    implements _$$UpdateMoodStateImplCopyWith<$Res> {
  __$$UpdateMoodStateImplCopyWithImpl(
      _$UpdateMoodStateImpl _value, $Res Function(_$UpdateMoodStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateMoodState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formStatus = null,
    Object? moodFormState = null,
    Object? mood = freezed,
  }) {
    return _then(_$UpdateMoodStateImpl(
      formStatus: null == formStatus
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      moodFormState: null == moodFormState
          ? _value.moodFormState
          : moodFormState // ignore: cast_nullable_to_non_nullable
              as MoodFormzState,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood?,
    ));
  }
}

/// @nodoc

class _$UpdateMoodStateImpl implements _UpdateMoodState {
  const _$UpdateMoodStateImpl(
      {this.formStatus = FormzSubmissionStatus.initial,
      this.moodFormState = const MoodFormzState(),
      this.mood});

  @override
  @JsonKey()
  final FormzSubmissionStatus formStatus;
  @override
  @JsonKey()
  final MoodFormzState moodFormState;
  @override
  final Mood? mood;

  @override
  String toString() {
    return 'UpdateMoodState(formStatus: $formStatus, moodFormState: $moodFormState, mood: $mood)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMoodStateImpl &&
            (identical(other.formStatus, formStatus) ||
                other.formStatus == formStatus) &&
            (identical(other.moodFormState, moodFormState) ||
                other.moodFormState == moodFormState) &&
            (identical(other.mood, mood) || other.mood == mood));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formStatus, moodFormState, mood);

  /// Create a copy of UpdateMoodState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMoodStateImplCopyWith<_$UpdateMoodStateImpl> get copyWith =>
      __$$UpdateMoodStateImplCopyWithImpl<_$UpdateMoodStateImpl>(
          this, _$identity);
}

abstract class _UpdateMoodState implements UpdateMoodState {
  const factory _UpdateMoodState(
      {final FormzSubmissionStatus formStatus,
      final MoodFormzState moodFormState,
      final Mood? mood}) = _$UpdateMoodStateImpl;

  @override
  FormzSubmissionStatus get formStatus;
  @override
  MoodFormzState get moodFormState;
  @override
  Mood? get mood;

  /// Create a copy of UpdateMoodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateMoodStateImplCopyWith<_$UpdateMoodStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
