// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GraphEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() graphInitialized,
    required TResult Function(DateTime date) targetDateChanged,
    required TResult Function() moodsUpdated,
    required TResult Function() showWorkTimeTriggered,
    required TResult Function() showRevenueTriggered,
    required TResult Function(GraphTimeRangeMode mode) timeRangeModeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? graphInitialized,
    TResult? Function(DateTime date)? targetDateChanged,
    TResult? Function()? moodsUpdated,
    TResult? Function()? showWorkTimeTriggered,
    TResult? Function()? showRevenueTriggered,
    TResult? Function(GraphTimeRangeMode mode)? timeRangeModeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? graphInitialized,
    TResult Function(DateTime date)? targetDateChanged,
    TResult Function()? moodsUpdated,
    TResult Function()? showWorkTimeTriggered,
    TResult Function()? showRevenueTriggered,
    TResult Function(GraphTimeRangeMode mode)? timeRangeModeChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GraphEventInitialized value) graphInitialized,
    required TResult Function(_GraphEventTargetDateChanged value)
        targetDateChanged,
    required TResult Function(_GraphEventMoodsUpdated value) moodsUpdated,
    required TResult Function(_GraphEventShowWorkTimeTriggered value)
        showWorkTimeTriggered,
    required TResult Function(_GraphEventShowRevenueTriggered value)
        showRevenueTriggered,
    required TResult Function(_GraphEventTimeRangeModeChanged value)
        timeRangeModeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GraphEventInitialized value)? graphInitialized,
    TResult? Function(_GraphEventTargetDateChanged value)? targetDateChanged,
    TResult? Function(_GraphEventMoodsUpdated value)? moodsUpdated,
    TResult? Function(_GraphEventShowWorkTimeTriggered value)?
        showWorkTimeTriggered,
    TResult? Function(_GraphEventShowRevenueTriggered value)?
        showRevenueTriggered,
    TResult? Function(_GraphEventTimeRangeModeChanged value)?
        timeRangeModeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GraphEventInitialized value)? graphInitialized,
    TResult Function(_GraphEventTargetDateChanged value)? targetDateChanged,
    TResult Function(_GraphEventMoodsUpdated value)? moodsUpdated,
    TResult Function(_GraphEventShowWorkTimeTriggered value)?
        showWorkTimeTriggered,
    TResult Function(_GraphEventShowRevenueTriggered value)?
        showRevenueTriggered,
    TResult Function(_GraphEventTimeRangeModeChanged value)?
        timeRangeModeChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphEventCopyWith<$Res> {
  factory $GraphEventCopyWith(
          GraphEvent value, $Res Function(GraphEvent) then) =
      _$GraphEventCopyWithImpl<$Res, GraphEvent>;
}

/// @nodoc
class _$GraphEventCopyWithImpl<$Res, $Val extends GraphEvent>
    implements $GraphEventCopyWith<$Res> {
  _$GraphEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GraphEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GraphEventInitializedImplCopyWith<$Res> {
  factory _$$GraphEventInitializedImplCopyWith(
          _$GraphEventInitializedImpl value,
          $Res Function(_$GraphEventInitializedImpl) then) =
      __$$GraphEventInitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GraphEventInitializedImplCopyWithImpl<$Res>
    extends _$GraphEventCopyWithImpl<$Res, _$GraphEventInitializedImpl>
    implements _$$GraphEventInitializedImplCopyWith<$Res> {
  __$$GraphEventInitializedImplCopyWithImpl(_$GraphEventInitializedImpl _value,
      $Res Function(_$GraphEventInitializedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GraphEventInitializedImpl implements _GraphEventInitialized {
  const _$GraphEventInitializedImpl();

  @override
  String toString() {
    return 'GraphEvent.graphInitialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphEventInitializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() graphInitialized,
    required TResult Function(DateTime date) targetDateChanged,
    required TResult Function() moodsUpdated,
    required TResult Function() showWorkTimeTriggered,
    required TResult Function() showRevenueTriggered,
    required TResult Function(GraphTimeRangeMode mode) timeRangeModeChanged,
  }) {
    return graphInitialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? graphInitialized,
    TResult? Function(DateTime date)? targetDateChanged,
    TResult? Function()? moodsUpdated,
    TResult? Function()? showWorkTimeTriggered,
    TResult? Function()? showRevenueTriggered,
    TResult? Function(GraphTimeRangeMode mode)? timeRangeModeChanged,
  }) {
    return graphInitialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? graphInitialized,
    TResult Function(DateTime date)? targetDateChanged,
    TResult Function()? moodsUpdated,
    TResult Function()? showWorkTimeTriggered,
    TResult Function()? showRevenueTriggered,
    TResult Function(GraphTimeRangeMode mode)? timeRangeModeChanged,
    required TResult orElse(),
  }) {
    if (graphInitialized != null) {
      return graphInitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GraphEventInitialized value) graphInitialized,
    required TResult Function(_GraphEventTargetDateChanged value)
        targetDateChanged,
    required TResult Function(_GraphEventMoodsUpdated value) moodsUpdated,
    required TResult Function(_GraphEventShowWorkTimeTriggered value)
        showWorkTimeTriggered,
    required TResult Function(_GraphEventShowRevenueTriggered value)
        showRevenueTriggered,
    required TResult Function(_GraphEventTimeRangeModeChanged value)
        timeRangeModeChanged,
  }) {
    return graphInitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GraphEventInitialized value)? graphInitialized,
    TResult? Function(_GraphEventTargetDateChanged value)? targetDateChanged,
    TResult? Function(_GraphEventMoodsUpdated value)? moodsUpdated,
    TResult? Function(_GraphEventShowWorkTimeTriggered value)?
        showWorkTimeTriggered,
    TResult? Function(_GraphEventShowRevenueTriggered value)?
        showRevenueTriggered,
    TResult? Function(_GraphEventTimeRangeModeChanged value)?
        timeRangeModeChanged,
  }) {
    return graphInitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GraphEventInitialized value)? graphInitialized,
    TResult Function(_GraphEventTargetDateChanged value)? targetDateChanged,
    TResult Function(_GraphEventMoodsUpdated value)? moodsUpdated,
    TResult Function(_GraphEventShowWorkTimeTriggered value)?
        showWorkTimeTriggered,
    TResult Function(_GraphEventShowRevenueTriggered value)?
        showRevenueTriggered,
    TResult Function(_GraphEventTimeRangeModeChanged value)?
        timeRangeModeChanged,
    required TResult orElse(),
  }) {
    if (graphInitialized != null) {
      return graphInitialized(this);
    }
    return orElse();
  }
}

abstract class _GraphEventInitialized implements GraphEvent {
  const factory _GraphEventInitialized() = _$GraphEventInitializedImpl;
}

/// @nodoc
abstract class _$$GraphEventTargetDateChangedImplCopyWith<$Res> {
  factory _$$GraphEventTargetDateChangedImplCopyWith(
          _$GraphEventTargetDateChangedImpl value,
          $Res Function(_$GraphEventTargetDateChangedImpl) then) =
      __$$GraphEventTargetDateChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$GraphEventTargetDateChangedImplCopyWithImpl<$Res>
    extends _$GraphEventCopyWithImpl<$Res, _$GraphEventTargetDateChangedImpl>
    implements _$$GraphEventTargetDateChangedImplCopyWith<$Res> {
  __$$GraphEventTargetDateChangedImplCopyWithImpl(
      _$GraphEventTargetDateChangedImpl _value,
      $Res Function(_$GraphEventTargetDateChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$GraphEventTargetDateChangedImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$GraphEventTargetDateChangedImpl
    implements _GraphEventTargetDateChanged {
  const _$GraphEventTargetDateChangedImpl({required this.date});

  @override
  final DateTime date;

  @override
  String toString() {
    return 'GraphEvent.targetDateChanged(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphEventTargetDateChangedImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  /// Create a copy of GraphEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphEventTargetDateChangedImplCopyWith<_$GraphEventTargetDateChangedImpl>
      get copyWith => __$$GraphEventTargetDateChangedImplCopyWithImpl<
          _$GraphEventTargetDateChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() graphInitialized,
    required TResult Function(DateTime date) targetDateChanged,
    required TResult Function() moodsUpdated,
    required TResult Function() showWorkTimeTriggered,
    required TResult Function() showRevenueTriggered,
    required TResult Function(GraphTimeRangeMode mode) timeRangeModeChanged,
  }) {
    return targetDateChanged(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? graphInitialized,
    TResult? Function(DateTime date)? targetDateChanged,
    TResult? Function()? moodsUpdated,
    TResult? Function()? showWorkTimeTriggered,
    TResult? Function()? showRevenueTriggered,
    TResult? Function(GraphTimeRangeMode mode)? timeRangeModeChanged,
  }) {
    return targetDateChanged?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? graphInitialized,
    TResult Function(DateTime date)? targetDateChanged,
    TResult Function()? moodsUpdated,
    TResult Function()? showWorkTimeTriggered,
    TResult Function()? showRevenueTriggered,
    TResult Function(GraphTimeRangeMode mode)? timeRangeModeChanged,
    required TResult orElse(),
  }) {
    if (targetDateChanged != null) {
      return targetDateChanged(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GraphEventInitialized value) graphInitialized,
    required TResult Function(_GraphEventTargetDateChanged value)
        targetDateChanged,
    required TResult Function(_GraphEventMoodsUpdated value) moodsUpdated,
    required TResult Function(_GraphEventShowWorkTimeTriggered value)
        showWorkTimeTriggered,
    required TResult Function(_GraphEventShowRevenueTriggered value)
        showRevenueTriggered,
    required TResult Function(_GraphEventTimeRangeModeChanged value)
        timeRangeModeChanged,
  }) {
    return targetDateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GraphEventInitialized value)? graphInitialized,
    TResult? Function(_GraphEventTargetDateChanged value)? targetDateChanged,
    TResult? Function(_GraphEventMoodsUpdated value)? moodsUpdated,
    TResult? Function(_GraphEventShowWorkTimeTriggered value)?
        showWorkTimeTriggered,
    TResult? Function(_GraphEventShowRevenueTriggered value)?
        showRevenueTriggered,
    TResult? Function(_GraphEventTimeRangeModeChanged value)?
        timeRangeModeChanged,
  }) {
    return targetDateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GraphEventInitialized value)? graphInitialized,
    TResult Function(_GraphEventTargetDateChanged value)? targetDateChanged,
    TResult Function(_GraphEventMoodsUpdated value)? moodsUpdated,
    TResult Function(_GraphEventShowWorkTimeTriggered value)?
        showWorkTimeTriggered,
    TResult Function(_GraphEventShowRevenueTriggered value)?
        showRevenueTriggered,
    TResult Function(_GraphEventTimeRangeModeChanged value)?
        timeRangeModeChanged,
    required TResult orElse(),
  }) {
    if (targetDateChanged != null) {
      return targetDateChanged(this);
    }
    return orElse();
  }
}

abstract class _GraphEventTargetDateChanged implements GraphEvent {
  const factory _GraphEventTargetDateChanged({required final DateTime date}) =
      _$GraphEventTargetDateChangedImpl;

  DateTime get date;

  /// Create a copy of GraphEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GraphEventTargetDateChangedImplCopyWith<_$GraphEventTargetDateChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GraphEventMoodsUpdatedImplCopyWith<$Res> {
  factory _$$GraphEventMoodsUpdatedImplCopyWith(
          _$GraphEventMoodsUpdatedImpl value,
          $Res Function(_$GraphEventMoodsUpdatedImpl) then) =
      __$$GraphEventMoodsUpdatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GraphEventMoodsUpdatedImplCopyWithImpl<$Res>
    extends _$GraphEventCopyWithImpl<$Res, _$GraphEventMoodsUpdatedImpl>
    implements _$$GraphEventMoodsUpdatedImplCopyWith<$Res> {
  __$$GraphEventMoodsUpdatedImplCopyWithImpl(
      _$GraphEventMoodsUpdatedImpl _value,
      $Res Function(_$GraphEventMoodsUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GraphEventMoodsUpdatedImpl implements _GraphEventMoodsUpdated {
  const _$GraphEventMoodsUpdatedImpl();

  @override
  String toString() {
    return 'GraphEvent.moodsUpdated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphEventMoodsUpdatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() graphInitialized,
    required TResult Function(DateTime date) targetDateChanged,
    required TResult Function() moodsUpdated,
    required TResult Function() showWorkTimeTriggered,
    required TResult Function() showRevenueTriggered,
    required TResult Function(GraphTimeRangeMode mode) timeRangeModeChanged,
  }) {
    return moodsUpdated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? graphInitialized,
    TResult? Function(DateTime date)? targetDateChanged,
    TResult? Function()? moodsUpdated,
    TResult? Function()? showWorkTimeTriggered,
    TResult? Function()? showRevenueTriggered,
    TResult? Function(GraphTimeRangeMode mode)? timeRangeModeChanged,
  }) {
    return moodsUpdated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? graphInitialized,
    TResult Function(DateTime date)? targetDateChanged,
    TResult Function()? moodsUpdated,
    TResult Function()? showWorkTimeTriggered,
    TResult Function()? showRevenueTriggered,
    TResult Function(GraphTimeRangeMode mode)? timeRangeModeChanged,
    required TResult orElse(),
  }) {
    if (moodsUpdated != null) {
      return moodsUpdated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GraphEventInitialized value) graphInitialized,
    required TResult Function(_GraphEventTargetDateChanged value)
        targetDateChanged,
    required TResult Function(_GraphEventMoodsUpdated value) moodsUpdated,
    required TResult Function(_GraphEventShowWorkTimeTriggered value)
        showWorkTimeTriggered,
    required TResult Function(_GraphEventShowRevenueTriggered value)
        showRevenueTriggered,
    required TResult Function(_GraphEventTimeRangeModeChanged value)
        timeRangeModeChanged,
  }) {
    return moodsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GraphEventInitialized value)? graphInitialized,
    TResult? Function(_GraphEventTargetDateChanged value)? targetDateChanged,
    TResult? Function(_GraphEventMoodsUpdated value)? moodsUpdated,
    TResult? Function(_GraphEventShowWorkTimeTriggered value)?
        showWorkTimeTriggered,
    TResult? Function(_GraphEventShowRevenueTriggered value)?
        showRevenueTriggered,
    TResult? Function(_GraphEventTimeRangeModeChanged value)?
        timeRangeModeChanged,
  }) {
    return moodsUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GraphEventInitialized value)? graphInitialized,
    TResult Function(_GraphEventTargetDateChanged value)? targetDateChanged,
    TResult Function(_GraphEventMoodsUpdated value)? moodsUpdated,
    TResult Function(_GraphEventShowWorkTimeTriggered value)?
        showWorkTimeTriggered,
    TResult Function(_GraphEventShowRevenueTriggered value)?
        showRevenueTriggered,
    TResult Function(_GraphEventTimeRangeModeChanged value)?
        timeRangeModeChanged,
    required TResult orElse(),
  }) {
    if (moodsUpdated != null) {
      return moodsUpdated(this);
    }
    return orElse();
  }
}

abstract class _GraphEventMoodsUpdated implements GraphEvent {
  const factory _GraphEventMoodsUpdated() = _$GraphEventMoodsUpdatedImpl;
}

/// @nodoc
abstract class _$$GraphEventShowWorkTimeTriggeredImplCopyWith<$Res> {
  factory _$$GraphEventShowWorkTimeTriggeredImplCopyWith(
          _$GraphEventShowWorkTimeTriggeredImpl value,
          $Res Function(_$GraphEventShowWorkTimeTriggeredImpl) then) =
      __$$GraphEventShowWorkTimeTriggeredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GraphEventShowWorkTimeTriggeredImplCopyWithImpl<$Res>
    extends _$GraphEventCopyWithImpl<$Res,
        _$GraphEventShowWorkTimeTriggeredImpl>
    implements _$$GraphEventShowWorkTimeTriggeredImplCopyWith<$Res> {
  __$$GraphEventShowWorkTimeTriggeredImplCopyWithImpl(
      _$GraphEventShowWorkTimeTriggeredImpl _value,
      $Res Function(_$GraphEventShowWorkTimeTriggeredImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GraphEventShowWorkTimeTriggeredImpl
    implements _GraphEventShowWorkTimeTriggered {
  const _$GraphEventShowWorkTimeTriggeredImpl();

  @override
  String toString() {
    return 'GraphEvent.showWorkTimeTriggered()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphEventShowWorkTimeTriggeredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() graphInitialized,
    required TResult Function(DateTime date) targetDateChanged,
    required TResult Function() moodsUpdated,
    required TResult Function() showWorkTimeTriggered,
    required TResult Function() showRevenueTriggered,
    required TResult Function(GraphTimeRangeMode mode) timeRangeModeChanged,
  }) {
    return showWorkTimeTriggered();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? graphInitialized,
    TResult? Function(DateTime date)? targetDateChanged,
    TResult? Function()? moodsUpdated,
    TResult? Function()? showWorkTimeTriggered,
    TResult? Function()? showRevenueTriggered,
    TResult? Function(GraphTimeRangeMode mode)? timeRangeModeChanged,
  }) {
    return showWorkTimeTriggered?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? graphInitialized,
    TResult Function(DateTime date)? targetDateChanged,
    TResult Function()? moodsUpdated,
    TResult Function()? showWorkTimeTriggered,
    TResult Function()? showRevenueTriggered,
    TResult Function(GraphTimeRangeMode mode)? timeRangeModeChanged,
    required TResult orElse(),
  }) {
    if (showWorkTimeTriggered != null) {
      return showWorkTimeTriggered();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GraphEventInitialized value) graphInitialized,
    required TResult Function(_GraphEventTargetDateChanged value)
        targetDateChanged,
    required TResult Function(_GraphEventMoodsUpdated value) moodsUpdated,
    required TResult Function(_GraphEventShowWorkTimeTriggered value)
        showWorkTimeTriggered,
    required TResult Function(_GraphEventShowRevenueTriggered value)
        showRevenueTriggered,
    required TResult Function(_GraphEventTimeRangeModeChanged value)
        timeRangeModeChanged,
  }) {
    return showWorkTimeTriggered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GraphEventInitialized value)? graphInitialized,
    TResult? Function(_GraphEventTargetDateChanged value)? targetDateChanged,
    TResult? Function(_GraphEventMoodsUpdated value)? moodsUpdated,
    TResult? Function(_GraphEventShowWorkTimeTriggered value)?
        showWorkTimeTriggered,
    TResult? Function(_GraphEventShowRevenueTriggered value)?
        showRevenueTriggered,
    TResult? Function(_GraphEventTimeRangeModeChanged value)?
        timeRangeModeChanged,
  }) {
    return showWorkTimeTriggered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GraphEventInitialized value)? graphInitialized,
    TResult Function(_GraphEventTargetDateChanged value)? targetDateChanged,
    TResult Function(_GraphEventMoodsUpdated value)? moodsUpdated,
    TResult Function(_GraphEventShowWorkTimeTriggered value)?
        showWorkTimeTriggered,
    TResult Function(_GraphEventShowRevenueTriggered value)?
        showRevenueTriggered,
    TResult Function(_GraphEventTimeRangeModeChanged value)?
        timeRangeModeChanged,
    required TResult orElse(),
  }) {
    if (showWorkTimeTriggered != null) {
      return showWorkTimeTriggered(this);
    }
    return orElse();
  }
}

abstract class _GraphEventShowWorkTimeTriggered implements GraphEvent {
  const factory _GraphEventShowWorkTimeTriggered() =
      _$GraphEventShowWorkTimeTriggeredImpl;
}

/// @nodoc
abstract class _$$GraphEventShowRevenueTriggeredImplCopyWith<$Res> {
  factory _$$GraphEventShowRevenueTriggeredImplCopyWith(
          _$GraphEventShowRevenueTriggeredImpl value,
          $Res Function(_$GraphEventShowRevenueTriggeredImpl) then) =
      __$$GraphEventShowRevenueTriggeredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GraphEventShowRevenueTriggeredImplCopyWithImpl<$Res>
    extends _$GraphEventCopyWithImpl<$Res, _$GraphEventShowRevenueTriggeredImpl>
    implements _$$GraphEventShowRevenueTriggeredImplCopyWith<$Res> {
  __$$GraphEventShowRevenueTriggeredImplCopyWithImpl(
      _$GraphEventShowRevenueTriggeredImpl _value,
      $Res Function(_$GraphEventShowRevenueTriggeredImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GraphEventShowRevenueTriggeredImpl
    implements _GraphEventShowRevenueTriggered {
  const _$GraphEventShowRevenueTriggeredImpl();

  @override
  String toString() {
    return 'GraphEvent.showRevenueTriggered()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphEventShowRevenueTriggeredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() graphInitialized,
    required TResult Function(DateTime date) targetDateChanged,
    required TResult Function() moodsUpdated,
    required TResult Function() showWorkTimeTriggered,
    required TResult Function() showRevenueTriggered,
    required TResult Function(GraphTimeRangeMode mode) timeRangeModeChanged,
  }) {
    return showRevenueTriggered();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? graphInitialized,
    TResult? Function(DateTime date)? targetDateChanged,
    TResult? Function()? moodsUpdated,
    TResult? Function()? showWorkTimeTriggered,
    TResult? Function()? showRevenueTriggered,
    TResult? Function(GraphTimeRangeMode mode)? timeRangeModeChanged,
  }) {
    return showRevenueTriggered?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? graphInitialized,
    TResult Function(DateTime date)? targetDateChanged,
    TResult Function()? moodsUpdated,
    TResult Function()? showWorkTimeTriggered,
    TResult Function()? showRevenueTriggered,
    TResult Function(GraphTimeRangeMode mode)? timeRangeModeChanged,
    required TResult orElse(),
  }) {
    if (showRevenueTriggered != null) {
      return showRevenueTriggered();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GraphEventInitialized value) graphInitialized,
    required TResult Function(_GraphEventTargetDateChanged value)
        targetDateChanged,
    required TResult Function(_GraphEventMoodsUpdated value) moodsUpdated,
    required TResult Function(_GraphEventShowWorkTimeTriggered value)
        showWorkTimeTriggered,
    required TResult Function(_GraphEventShowRevenueTriggered value)
        showRevenueTriggered,
    required TResult Function(_GraphEventTimeRangeModeChanged value)
        timeRangeModeChanged,
  }) {
    return showRevenueTriggered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GraphEventInitialized value)? graphInitialized,
    TResult? Function(_GraphEventTargetDateChanged value)? targetDateChanged,
    TResult? Function(_GraphEventMoodsUpdated value)? moodsUpdated,
    TResult? Function(_GraphEventShowWorkTimeTriggered value)?
        showWorkTimeTriggered,
    TResult? Function(_GraphEventShowRevenueTriggered value)?
        showRevenueTriggered,
    TResult? Function(_GraphEventTimeRangeModeChanged value)?
        timeRangeModeChanged,
  }) {
    return showRevenueTriggered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GraphEventInitialized value)? graphInitialized,
    TResult Function(_GraphEventTargetDateChanged value)? targetDateChanged,
    TResult Function(_GraphEventMoodsUpdated value)? moodsUpdated,
    TResult Function(_GraphEventShowWorkTimeTriggered value)?
        showWorkTimeTriggered,
    TResult Function(_GraphEventShowRevenueTriggered value)?
        showRevenueTriggered,
    TResult Function(_GraphEventTimeRangeModeChanged value)?
        timeRangeModeChanged,
    required TResult orElse(),
  }) {
    if (showRevenueTriggered != null) {
      return showRevenueTriggered(this);
    }
    return orElse();
  }
}

abstract class _GraphEventShowRevenueTriggered implements GraphEvent {
  const factory _GraphEventShowRevenueTriggered() =
      _$GraphEventShowRevenueTriggeredImpl;
}

/// @nodoc
abstract class _$$GraphEventTimeRangeModeChangedImplCopyWith<$Res> {
  factory _$$GraphEventTimeRangeModeChangedImplCopyWith(
          _$GraphEventTimeRangeModeChangedImpl value,
          $Res Function(_$GraphEventTimeRangeModeChangedImpl) then) =
      __$$GraphEventTimeRangeModeChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GraphTimeRangeMode mode});
}

/// @nodoc
class __$$GraphEventTimeRangeModeChangedImplCopyWithImpl<$Res>
    extends _$GraphEventCopyWithImpl<$Res, _$GraphEventTimeRangeModeChangedImpl>
    implements _$$GraphEventTimeRangeModeChangedImplCopyWith<$Res> {
  __$$GraphEventTimeRangeModeChangedImplCopyWithImpl(
      _$GraphEventTimeRangeModeChangedImpl _value,
      $Res Function(_$GraphEventTimeRangeModeChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
  }) {
    return _then(_$GraphEventTimeRangeModeChangedImpl(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as GraphTimeRangeMode,
    ));
  }
}

/// @nodoc

class _$GraphEventTimeRangeModeChangedImpl
    implements _GraphEventTimeRangeModeChanged {
  const _$GraphEventTimeRangeModeChangedImpl({required this.mode});

  @override
  final GraphTimeRangeMode mode;

  @override
  String toString() {
    return 'GraphEvent.timeRangeModeChanged(mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphEventTimeRangeModeChangedImpl &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode);

  /// Create a copy of GraphEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphEventTimeRangeModeChangedImplCopyWith<
          _$GraphEventTimeRangeModeChangedImpl>
      get copyWith => __$$GraphEventTimeRangeModeChangedImplCopyWithImpl<
          _$GraphEventTimeRangeModeChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() graphInitialized,
    required TResult Function(DateTime date) targetDateChanged,
    required TResult Function() moodsUpdated,
    required TResult Function() showWorkTimeTriggered,
    required TResult Function() showRevenueTriggered,
    required TResult Function(GraphTimeRangeMode mode) timeRangeModeChanged,
  }) {
    return timeRangeModeChanged(mode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? graphInitialized,
    TResult? Function(DateTime date)? targetDateChanged,
    TResult? Function()? moodsUpdated,
    TResult? Function()? showWorkTimeTriggered,
    TResult? Function()? showRevenueTriggered,
    TResult? Function(GraphTimeRangeMode mode)? timeRangeModeChanged,
  }) {
    return timeRangeModeChanged?.call(mode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? graphInitialized,
    TResult Function(DateTime date)? targetDateChanged,
    TResult Function()? moodsUpdated,
    TResult Function()? showWorkTimeTriggered,
    TResult Function()? showRevenueTriggered,
    TResult Function(GraphTimeRangeMode mode)? timeRangeModeChanged,
    required TResult orElse(),
  }) {
    if (timeRangeModeChanged != null) {
      return timeRangeModeChanged(mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GraphEventInitialized value) graphInitialized,
    required TResult Function(_GraphEventTargetDateChanged value)
        targetDateChanged,
    required TResult Function(_GraphEventMoodsUpdated value) moodsUpdated,
    required TResult Function(_GraphEventShowWorkTimeTriggered value)
        showWorkTimeTriggered,
    required TResult Function(_GraphEventShowRevenueTriggered value)
        showRevenueTriggered,
    required TResult Function(_GraphEventTimeRangeModeChanged value)
        timeRangeModeChanged,
  }) {
    return timeRangeModeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GraphEventInitialized value)? graphInitialized,
    TResult? Function(_GraphEventTargetDateChanged value)? targetDateChanged,
    TResult? Function(_GraphEventMoodsUpdated value)? moodsUpdated,
    TResult? Function(_GraphEventShowWorkTimeTriggered value)?
        showWorkTimeTriggered,
    TResult? Function(_GraphEventShowRevenueTriggered value)?
        showRevenueTriggered,
    TResult? Function(_GraphEventTimeRangeModeChanged value)?
        timeRangeModeChanged,
  }) {
    return timeRangeModeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GraphEventInitialized value)? graphInitialized,
    TResult Function(_GraphEventTargetDateChanged value)? targetDateChanged,
    TResult Function(_GraphEventMoodsUpdated value)? moodsUpdated,
    TResult Function(_GraphEventShowWorkTimeTriggered value)?
        showWorkTimeTriggered,
    TResult Function(_GraphEventShowRevenueTriggered value)?
        showRevenueTriggered,
    TResult Function(_GraphEventTimeRangeModeChanged value)?
        timeRangeModeChanged,
    required TResult orElse(),
  }) {
    if (timeRangeModeChanged != null) {
      return timeRangeModeChanged(this);
    }
    return orElse();
  }
}

abstract class _GraphEventTimeRangeModeChanged implements GraphEvent {
  const factory _GraphEventTimeRangeModeChanged(
          {required final GraphTimeRangeMode mode}) =
      _$GraphEventTimeRangeModeChangedImpl;

  GraphTimeRangeMode get mode;

  /// Create a copy of GraphEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GraphEventTimeRangeModeChangedImplCopyWith<
          _$GraphEventTimeRangeModeChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GraphState {
  GraphMoodsState get moodsState => throw _privateConstructorUsedError;
  GraphTargetDateState get targetDate => throw _privateConstructorUsedError;
  GraphSettings get settings => throw _privateConstructorUsedError;
  SavingGraphSettingsState get savingGraphSettingsState =>
      throw _privateConstructorUsedError;

  /// Create a copy of GraphState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GraphStateCopyWith<GraphState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphStateCopyWith<$Res> {
  factory $GraphStateCopyWith(
          GraphState value, $Res Function(GraphState) then) =
      _$GraphStateCopyWithImpl<$Res, GraphState>;
  @useResult
  $Res call(
      {GraphMoodsState moodsState,
      GraphTargetDateState targetDate,
      GraphSettings settings,
      SavingGraphSettingsState savingGraphSettingsState});

  $GraphMoodsStateCopyWith<$Res> get moodsState;
  $GraphTargetDateStateCopyWith<$Res> get targetDate;
  $GraphSettingsCopyWith<$Res> get settings;
  $SavingGraphSettingsStateCopyWith<$Res> get savingGraphSettingsState;
}

/// @nodoc
class _$GraphStateCopyWithImpl<$Res, $Val extends GraphState>
    implements $GraphStateCopyWith<$Res> {
  _$GraphStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GraphState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moodsState = null,
    Object? targetDate = null,
    Object? settings = null,
    Object? savingGraphSettingsState = null,
  }) {
    return _then(_value.copyWith(
      moodsState: null == moodsState
          ? _value.moodsState
          : moodsState // ignore: cast_nullable_to_non_nullable
              as GraphMoodsState,
      targetDate: null == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as GraphTargetDateState,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as GraphSettings,
      savingGraphSettingsState: null == savingGraphSettingsState
          ? _value.savingGraphSettingsState
          : savingGraphSettingsState // ignore: cast_nullable_to_non_nullable
              as SavingGraphSettingsState,
    ) as $Val);
  }

  /// Create a copy of GraphState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GraphMoodsStateCopyWith<$Res> get moodsState {
    return $GraphMoodsStateCopyWith<$Res>(_value.moodsState, (value) {
      return _then(_value.copyWith(moodsState: value) as $Val);
    });
  }

  /// Create a copy of GraphState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GraphTargetDateStateCopyWith<$Res> get targetDate {
    return $GraphTargetDateStateCopyWith<$Res>(_value.targetDate, (value) {
      return _then(_value.copyWith(targetDate: value) as $Val);
    });
  }

  /// Create a copy of GraphState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GraphSettingsCopyWith<$Res> get settings {
    return $GraphSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }

  /// Create a copy of GraphState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SavingGraphSettingsStateCopyWith<$Res> get savingGraphSettingsState {
    return $SavingGraphSettingsStateCopyWith<$Res>(
        _value.savingGraphSettingsState, (value) {
      return _then(_value.copyWith(savingGraphSettingsState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GraphStateImplCopyWith<$Res>
    implements $GraphStateCopyWith<$Res> {
  factory _$$GraphStateImplCopyWith(
          _$GraphStateImpl value, $Res Function(_$GraphStateImpl) then) =
      __$$GraphStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GraphMoodsState moodsState,
      GraphTargetDateState targetDate,
      GraphSettings settings,
      SavingGraphSettingsState savingGraphSettingsState});

  @override
  $GraphMoodsStateCopyWith<$Res> get moodsState;
  @override
  $GraphTargetDateStateCopyWith<$Res> get targetDate;
  @override
  $GraphSettingsCopyWith<$Res> get settings;
  @override
  $SavingGraphSettingsStateCopyWith<$Res> get savingGraphSettingsState;
}

/// @nodoc
class __$$GraphStateImplCopyWithImpl<$Res>
    extends _$GraphStateCopyWithImpl<$Res, _$GraphStateImpl>
    implements _$$GraphStateImplCopyWith<$Res> {
  __$$GraphStateImplCopyWithImpl(
      _$GraphStateImpl _value, $Res Function(_$GraphStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moodsState = null,
    Object? targetDate = null,
    Object? settings = null,
    Object? savingGraphSettingsState = null,
  }) {
    return _then(_$GraphStateImpl(
      moodsState: null == moodsState
          ? _value.moodsState
          : moodsState // ignore: cast_nullable_to_non_nullable
              as GraphMoodsState,
      targetDate: null == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as GraphTargetDateState,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as GraphSettings,
      savingGraphSettingsState: null == savingGraphSettingsState
          ? _value.savingGraphSettingsState
          : savingGraphSettingsState // ignore: cast_nullable_to_non_nullable
              as SavingGraphSettingsState,
    ));
  }
}

/// @nodoc

class _$GraphStateImpl implements _GraphState {
  const _$GraphStateImpl(
      {this.moodsState = const GraphMoodsState.initial(),
      this.targetDate = const GraphTargetDateState.initial(),
      this.settings = const GraphSettings(
          showRevenue: false,
          showWorkTime: true,
          timeRangeMode: GraphTimeRangeMode.weekly),
      this.savingGraphSettingsState =
          const SavingGraphSettingsState.initial()});

  @override
  @JsonKey()
  final GraphMoodsState moodsState;
  @override
  @JsonKey()
  final GraphTargetDateState targetDate;
  @override
  @JsonKey()
  final GraphSettings settings;
  @override
  @JsonKey()
  final SavingGraphSettingsState savingGraphSettingsState;

  @override
  String toString() {
    return 'GraphState(moodsState: $moodsState, targetDate: $targetDate, settings: $settings, savingGraphSettingsState: $savingGraphSettingsState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphStateImpl &&
            (identical(other.moodsState, moodsState) ||
                other.moodsState == moodsState) &&
            (identical(other.targetDate, targetDate) ||
                other.targetDate == targetDate) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(
                    other.savingGraphSettingsState, savingGraphSettingsState) ||
                other.savingGraphSettingsState == savingGraphSettingsState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, moodsState, targetDate, settings, savingGraphSettingsState);

  /// Create a copy of GraphState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphStateImplCopyWith<_$GraphStateImpl> get copyWith =>
      __$$GraphStateImplCopyWithImpl<_$GraphStateImpl>(this, _$identity);
}

abstract class _GraphState implements GraphState {
  const factory _GraphState(
          {final GraphMoodsState moodsState,
          final GraphTargetDateState targetDate,
          final GraphSettings settings,
          final SavingGraphSettingsState savingGraphSettingsState}) =
      _$GraphStateImpl;

  @override
  GraphMoodsState get moodsState;
  @override
  GraphTargetDateState get targetDate;
  @override
  GraphSettings get settings;
  @override
  SavingGraphSettingsState get savingGraphSettingsState;

  /// Create a copy of GraphState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GraphStateImplCopyWith<_$GraphStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GraphSettings {
  bool get showRevenue => throw _privateConstructorUsedError;
  bool get showWorkTime => throw _privateConstructorUsedError;
  GraphTimeRangeMode get timeRangeMode => throw _privateConstructorUsedError;

  /// Create a copy of GraphSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GraphSettingsCopyWith<GraphSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphSettingsCopyWith<$Res> {
  factory $GraphSettingsCopyWith(
          GraphSettings value, $Res Function(GraphSettings) then) =
      _$GraphSettingsCopyWithImpl<$Res, GraphSettings>;
  @useResult
  $Res call(
      {bool showRevenue, bool showWorkTime, GraphTimeRangeMode timeRangeMode});
}

/// @nodoc
class _$GraphSettingsCopyWithImpl<$Res, $Val extends GraphSettings>
    implements $GraphSettingsCopyWith<$Res> {
  _$GraphSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GraphSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showRevenue = null,
    Object? showWorkTime = null,
    Object? timeRangeMode = null,
  }) {
    return _then(_value.copyWith(
      showRevenue: null == showRevenue
          ? _value.showRevenue
          : showRevenue // ignore: cast_nullable_to_non_nullable
              as bool,
      showWorkTime: null == showWorkTime
          ? _value.showWorkTime
          : showWorkTime // ignore: cast_nullable_to_non_nullable
              as bool,
      timeRangeMode: null == timeRangeMode
          ? _value.timeRangeMode
          : timeRangeMode // ignore: cast_nullable_to_non_nullable
              as GraphTimeRangeMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GraphSettingsImplCopyWith<$Res>
    implements $GraphSettingsCopyWith<$Res> {
  factory _$$GraphSettingsImplCopyWith(
          _$GraphSettingsImpl value, $Res Function(_$GraphSettingsImpl) then) =
      __$$GraphSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool showRevenue, bool showWorkTime, GraphTimeRangeMode timeRangeMode});
}

/// @nodoc
class __$$GraphSettingsImplCopyWithImpl<$Res>
    extends _$GraphSettingsCopyWithImpl<$Res, _$GraphSettingsImpl>
    implements _$$GraphSettingsImplCopyWith<$Res> {
  __$$GraphSettingsImplCopyWithImpl(
      _$GraphSettingsImpl _value, $Res Function(_$GraphSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showRevenue = null,
    Object? showWorkTime = null,
    Object? timeRangeMode = null,
  }) {
    return _then(_$GraphSettingsImpl(
      showRevenue: null == showRevenue
          ? _value.showRevenue
          : showRevenue // ignore: cast_nullable_to_non_nullable
              as bool,
      showWorkTime: null == showWorkTime
          ? _value.showWorkTime
          : showWorkTime // ignore: cast_nullable_to_non_nullable
              as bool,
      timeRangeMode: null == timeRangeMode
          ? _value.timeRangeMode
          : timeRangeMode // ignore: cast_nullable_to_non_nullable
              as GraphTimeRangeMode,
    ));
  }
}

/// @nodoc

class _$GraphSettingsImpl implements _GraphSettings {
  const _$GraphSettingsImpl(
      {required this.showRevenue,
      required this.showWorkTime,
      required this.timeRangeMode});

  @override
  final bool showRevenue;
  @override
  final bool showWorkTime;
  @override
  final GraphTimeRangeMode timeRangeMode;

  @override
  String toString() {
    return 'GraphSettings(showRevenue: $showRevenue, showWorkTime: $showWorkTime, timeRangeMode: $timeRangeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphSettingsImpl &&
            (identical(other.showRevenue, showRevenue) ||
                other.showRevenue == showRevenue) &&
            (identical(other.showWorkTime, showWorkTime) ||
                other.showWorkTime == showWorkTime) &&
            (identical(other.timeRangeMode, timeRangeMode) ||
                other.timeRangeMode == timeRangeMode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, showRevenue, showWorkTime, timeRangeMode);

  /// Create a copy of GraphSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphSettingsImplCopyWith<_$GraphSettingsImpl> get copyWith =>
      __$$GraphSettingsImplCopyWithImpl<_$GraphSettingsImpl>(this, _$identity);
}

abstract class _GraphSettings implements GraphSettings {
  const factory _GraphSettings(
      {required final bool showRevenue,
      required final bool showWorkTime,
      required final GraphTimeRangeMode timeRangeMode}) = _$GraphSettingsImpl;

  @override
  bool get showRevenue;
  @override
  bool get showWorkTime;
  @override
  GraphTimeRangeMode get timeRangeMode;

  /// Create a copy of GraphSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GraphSettingsImplCopyWith<_$GraphSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SavingGraphSettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SavingGraphSettingsInitialState value) initial,
    required TResult Function(SavingGraphSettingsLoadingState value) loading,
    required TResult Function(SavingGraphSettingsSuccessState value) success,
    required TResult Function(SavingGraphSettingsErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SavingGraphSettingsInitialState value)? initial,
    TResult? Function(SavingGraphSettingsLoadingState value)? loading,
    TResult? Function(SavingGraphSettingsSuccessState value)? success,
    TResult? Function(SavingGraphSettingsErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SavingGraphSettingsInitialState value)? initial,
    TResult Function(SavingGraphSettingsLoadingState value)? loading,
    TResult Function(SavingGraphSettingsSuccessState value)? success,
    TResult Function(SavingGraphSettingsErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavingGraphSettingsStateCopyWith<$Res> {
  factory $SavingGraphSettingsStateCopyWith(SavingGraphSettingsState value,
          $Res Function(SavingGraphSettingsState) then) =
      _$SavingGraphSettingsStateCopyWithImpl<$Res, SavingGraphSettingsState>;
}

/// @nodoc
class _$SavingGraphSettingsStateCopyWithImpl<$Res,
        $Val extends SavingGraphSettingsState>
    implements $SavingGraphSettingsStateCopyWith<$Res> {
  _$SavingGraphSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavingGraphSettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SavingGraphSettingsInitialStateImplCopyWith<$Res> {
  factory _$$SavingGraphSettingsInitialStateImplCopyWith(
          _$SavingGraphSettingsInitialStateImpl value,
          $Res Function(_$SavingGraphSettingsInitialStateImpl) then) =
      __$$SavingGraphSettingsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SavingGraphSettingsInitialStateImplCopyWithImpl<$Res>
    extends _$SavingGraphSettingsStateCopyWithImpl<$Res,
        _$SavingGraphSettingsInitialStateImpl>
    implements _$$SavingGraphSettingsInitialStateImplCopyWith<$Res> {
  __$$SavingGraphSettingsInitialStateImplCopyWithImpl(
      _$SavingGraphSettingsInitialStateImpl _value,
      $Res Function(_$SavingGraphSettingsInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavingGraphSettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SavingGraphSettingsInitialStateImpl
    implements SavingGraphSettingsInitialState {
  const _$SavingGraphSettingsInitialStateImpl();

  @override
  String toString() {
    return 'SavingGraphSettingsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavingGraphSettingsInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(SavingGraphSettingsInitialState value) initial,
    required TResult Function(SavingGraphSettingsLoadingState value) loading,
    required TResult Function(SavingGraphSettingsSuccessState value) success,
    required TResult Function(SavingGraphSettingsErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SavingGraphSettingsInitialState value)? initial,
    TResult? Function(SavingGraphSettingsLoadingState value)? loading,
    TResult? Function(SavingGraphSettingsSuccessState value)? success,
    TResult? Function(SavingGraphSettingsErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SavingGraphSettingsInitialState value)? initial,
    TResult Function(SavingGraphSettingsLoadingState value)? loading,
    TResult Function(SavingGraphSettingsSuccessState value)? success,
    TResult Function(SavingGraphSettingsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SavingGraphSettingsInitialState
    implements SavingGraphSettingsState {
  const factory SavingGraphSettingsInitialState() =
      _$SavingGraphSettingsInitialStateImpl;
}

/// @nodoc
abstract class _$$SavingGraphSettingsLoadingStateImplCopyWith<$Res> {
  factory _$$SavingGraphSettingsLoadingStateImplCopyWith(
          _$SavingGraphSettingsLoadingStateImpl value,
          $Res Function(_$SavingGraphSettingsLoadingStateImpl) then) =
      __$$SavingGraphSettingsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SavingGraphSettingsLoadingStateImplCopyWithImpl<$Res>
    extends _$SavingGraphSettingsStateCopyWithImpl<$Res,
        _$SavingGraphSettingsLoadingStateImpl>
    implements _$$SavingGraphSettingsLoadingStateImplCopyWith<$Res> {
  __$$SavingGraphSettingsLoadingStateImplCopyWithImpl(
      _$SavingGraphSettingsLoadingStateImpl _value,
      $Res Function(_$SavingGraphSettingsLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavingGraphSettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SavingGraphSettingsLoadingStateImpl
    implements SavingGraphSettingsLoadingState {
  const _$SavingGraphSettingsLoadingStateImpl();

  @override
  String toString() {
    return 'SavingGraphSettingsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavingGraphSettingsLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(SavingGraphSettingsInitialState value) initial,
    required TResult Function(SavingGraphSettingsLoadingState value) loading,
    required TResult Function(SavingGraphSettingsSuccessState value) success,
    required TResult Function(SavingGraphSettingsErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SavingGraphSettingsInitialState value)? initial,
    TResult? Function(SavingGraphSettingsLoadingState value)? loading,
    TResult? Function(SavingGraphSettingsSuccessState value)? success,
    TResult? Function(SavingGraphSettingsErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SavingGraphSettingsInitialState value)? initial,
    TResult Function(SavingGraphSettingsLoadingState value)? loading,
    TResult Function(SavingGraphSettingsSuccessState value)? success,
    TResult Function(SavingGraphSettingsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SavingGraphSettingsLoadingState
    implements SavingGraphSettingsState {
  const factory SavingGraphSettingsLoadingState() =
      _$SavingGraphSettingsLoadingStateImpl;
}

/// @nodoc
abstract class _$$SavingGraphSettingsSuccessStateImplCopyWith<$Res> {
  factory _$$SavingGraphSettingsSuccessStateImplCopyWith(
          _$SavingGraphSettingsSuccessStateImpl value,
          $Res Function(_$SavingGraphSettingsSuccessStateImpl) then) =
      __$$SavingGraphSettingsSuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SavingGraphSettingsSuccessStateImplCopyWithImpl<$Res>
    extends _$SavingGraphSettingsStateCopyWithImpl<$Res,
        _$SavingGraphSettingsSuccessStateImpl>
    implements _$$SavingGraphSettingsSuccessStateImplCopyWith<$Res> {
  __$$SavingGraphSettingsSuccessStateImplCopyWithImpl(
      _$SavingGraphSettingsSuccessStateImpl _value,
      $Res Function(_$SavingGraphSettingsSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavingGraphSettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SavingGraphSettingsSuccessStateImpl
    implements SavingGraphSettingsSuccessState {
  const _$SavingGraphSettingsSuccessStateImpl();

  @override
  String toString() {
    return 'SavingGraphSettingsState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavingGraphSettingsSuccessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SavingGraphSettingsInitialState value) initial,
    required TResult Function(SavingGraphSettingsLoadingState value) loading,
    required TResult Function(SavingGraphSettingsSuccessState value) success,
    required TResult Function(SavingGraphSettingsErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SavingGraphSettingsInitialState value)? initial,
    TResult? Function(SavingGraphSettingsLoadingState value)? loading,
    TResult? Function(SavingGraphSettingsSuccessState value)? success,
    TResult? Function(SavingGraphSettingsErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SavingGraphSettingsInitialState value)? initial,
    TResult Function(SavingGraphSettingsLoadingState value)? loading,
    TResult Function(SavingGraphSettingsSuccessState value)? success,
    TResult Function(SavingGraphSettingsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SavingGraphSettingsSuccessState
    implements SavingGraphSettingsState {
  const factory SavingGraphSettingsSuccessState() =
      _$SavingGraphSettingsSuccessStateImpl;
}

/// @nodoc
abstract class _$$SavingGraphSettingsErrorStateImplCopyWith<$Res> {
  factory _$$SavingGraphSettingsErrorStateImplCopyWith(
          _$SavingGraphSettingsErrorStateImpl value,
          $Res Function(_$SavingGraphSettingsErrorStateImpl) then) =
      __$$SavingGraphSettingsErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SavingGraphSettingsErrorStateImplCopyWithImpl<$Res>
    extends _$SavingGraphSettingsStateCopyWithImpl<$Res,
        _$SavingGraphSettingsErrorStateImpl>
    implements _$$SavingGraphSettingsErrorStateImplCopyWith<$Res> {
  __$$SavingGraphSettingsErrorStateImplCopyWithImpl(
      _$SavingGraphSettingsErrorStateImpl _value,
      $Res Function(_$SavingGraphSettingsErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavingGraphSettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SavingGraphSettingsErrorStateImpl
    implements SavingGraphSettingsErrorState {
  const _$SavingGraphSettingsErrorStateImpl();

  @override
  String toString() {
    return 'SavingGraphSettingsState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavingGraphSettingsErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(SavingGraphSettingsInitialState value) initial,
    required TResult Function(SavingGraphSettingsLoadingState value) loading,
    required TResult Function(SavingGraphSettingsSuccessState value) success,
    required TResult Function(SavingGraphSettingsErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SavingGraphSettingsInitialState value)? initial,
    TResult? Function(SavingGraphSettingsLoadingState value)? loading,
    TResult? Function(SavingGraphSettingsSuccessState value)? success,
    TResult? Function(SavingGraphSettingsErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SavingGraphSettingsInitialState value)? initial,
    TResult Function(SavingGraphSettingsLoadingState value)? loading,
    TResult Function(SavingGraphSettingsSuccessState value)? success,
    TResult Function(SavingGraphSettingsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SavingGraphSettingsErrorState
    implements SavingGraphSettingsState {
  const factory SavingGraphSettingsErrorState() =
      _$SavingGraphSettingsErrorStateImpl;
}

/// @nodoc
mixin _$GraphTargetDateState {
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
    required TResult Function(GraphTargetDateInitialState value) initial,
    required TResult Function(GraphTargetDateSetState value) set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GraphTargetDateInitialState value)? initial,
    TResult? Function(GraphTargetDateSetState value)? set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GraphTargetDateInitialState value)? initial,
    TResult Function(GraphTargetDateSetState value)? set,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphTargetDateStateCopyWith<$Res> {
  factory $GraphTargetDateStateCopyWith(GraphTargetDateState value,
          $Res Function(GraphTargetDateState) then) =
      _$GraphTargetDateStateCopyWithImpl<$Res, GraphTargetDateState>;
}

/// @nodoc
class _$GraphTargetDateStateCopyWithImpl<$Res,
        $Val extends GraphTargetDateState>
    implements $GraphTargetDateStateCopyWith<$Res> {
  _$GraphTargetDateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GraphTargetDateState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GraphTargetDateInitialStateImplCopyWith<$Res> {
  factory _$$GraphTargetDateInitialStateImplCopyWith(
          _$GraphTargetDateInitialStateImpl value,
          $Res Function(_$GraphTargetDateInitialStateImpl) then) =
      __$$GraphTargetDateInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GraphTargetDateInitialStateImplCopyWithImpl<$Res>
    extends _$GraphTargetDateStateCopyWithImpl<$Res,
        _$GraphTargetDateInitialStateImpl>
    implements _$$GraphTargetDateInitialStateImplCopyWith<$Res> {
  __$$GraphTargetDateInitialStateImplCopyWithImpl(
      _$GraphTargetDateInitialStateImpl _value,
      $Res Function(_$GraphTargetDateInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphTargetDateState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GraphTargetDateInitialStateImpl implements GraphTargetDateInitialState {
  const _$GraphTargetDateInitialStateImpl();

  @override
  String toString() {
    return 'GraphTargetDateState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphTargetDateInitialStateImpl);
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
    required TResult Function(GraphTargetDateInitialState value) initial,
    required TResult Function(GraphTargetDateSetState value) set,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GraphTargetDateInitialState value)? initial,
    TResult? Function(GraphTargetDateSetState value)? set,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GraphTargetDateInitialState value)? initial,
    TResult Function(GraphTargetDateSetState value)? set,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GraphTargetDateInitialState implements GraphTargetDateState {
  const factory GraphTargetDateInitialState() =
      _$GraphTargetDateInitialStateImpl;
}

/// @nodoc
abstract class _$$GraphTargetDateSetStateImplCopyWith<$Res> {
  factory _$$GraphTargetDateSetStateImplCopyWith(
          _$GraphTargetDateSetStateImpl value,
          $Res Function(_$GraphTargetDateSetStateImpl) then) =
      __$$GraphTargetDateSetStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$GraphTargetDateSetStateImplCopyWithImpl<$Res>
    extends _$GraphTargetDateStateCopyWithImpl<$Res,
        _$GraphTargetDateSetStateImpl>
    implements _$$GraphTargetDateSetStateImplCopyWith<$Res> {
  __$$GraphTargetDateSetStateImplCopyWithImpl(
      _$GraphTargetDateSetStateImpl _value,
      $Res Function(_$GraphTargetDateSetStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphTargetDateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$GraphTargetDateSetStateImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$GraphTargetDateSetStateImpl implements GraphTargetDateSetState {
  const _$GraphTargetDateSetStateImpl({required this.date});

  @override
  final DateTime date;

  @override
  String toString() {
    return 'GraphTargetDateState.set(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphTargetDateSetStateImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  /// Create a copy of GraphTargetDateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphTargetDateSetStateImplCopyWith<_$GraphTargetDateSetStateImpl>
      get copyWith => __$$GraphTargetDateSetStateImplCopyWithImpl<
          _$GraphTargetDateSetStateImpl>(this, _$identity);

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
    required TResult Function(GraphTargetDateInitialState value) initial,
    required TResult Function(GraphTargetDateSetState value) set,
  }) {
    return set(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GraphTargetDateInitialState value)? initial,
    TResult? Function(GraphTargetDateSetState value)? set,
  }) {
    return set?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GraphTargetDateInitialState value)? initial,
    TResult Function(GraphTargetDateSetState value)? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(this);
    }
    return orElse();
  }
}

abstract class GraphTargetDateSetState implements GraphTargetDateState {
  const factory GraphTargetDateSetState({required final DateTime date}) =
      _$GraphTargetDateSetStateImpl;

  DateTime get date;

  /// Create a copy of GraphTargetDateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GraphTargetDateSetStateImplCopyWith<_$GraphTargetDateSetStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GraphMoodsState {
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
    required TResult Function(GraphMoodsInitialState value) initial,
    required TResult Function(GraphMoodsLoadingState value) loading,
    required TResult Function(GraphMoodsSuccessState value) loaded,
    required TResult Function(GraphMoodsErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GraphMoodsInitialState value)? initial,
    TResult? Function(GraphMoodsLoadingState value)? loading,
    TResult? Function(GraphMoodsSuccessState value)? loaded,
    TResult? Function(GraphMoodsErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GraphMoodsInitialState value)? initial,
    TResult Function(GraphMoodsLoadingState value)? loading,
    TResult Function(GraphMoodsSuccessState value)? loaded,
    TResult Function(GraphMoodsErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphMoodsStateCopyWith<$Res> {
  factory $GraphMoodsStateCopyWith(
          GraphMoodsState value, $Res Function(GraphMoodsState) then) =
      _$GraphMoodsStateCopyWithImpl<$Res, GraphMoodsState>;
}

/// @nodoc
class _$GraphMoodsStateCopyWithImpl<$Res, $Val extends GraphMoodsState>
    implements $GraphMoodsStateCopyWith<$Res> {
  _$GraphMoodsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GraphMoodsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GraphMoodsInitialStateImplCopyWith<$Res> {
  factory _$$GraphMoodsInitialStateImplCopyWith(
          _$GraphMoodsInitialStateImpl value,
          $Res Function(_$GraphMoodsInitialStateImpl) then) =
      __$$GraphMoodsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GraphMoodsInitialStateImplCopyWithImpl<$Res>
    extends _$GraphMoodsStateCopyWithImpl<$Res, _$GraphMoodsInitialStateImpl>
    implements _$$GraphMoodsInitialStateImplCopyWith<$Res> {
  __$$GraphMoodsInitialStateImplCopyWithImpl(
      _$GraphMoodsInitialStateImpl _value,
      $Res Function(_$GraphMoodsInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphMoodsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GraphMoodsInitialStateImpl implements GraphMoodsInitialState {
  const _$GraphMoodsInitialStateImpl();

  @override
  String toString() {
    return 'GraphMoodsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphMoodsInitialStateImpl);
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
    required TResult Function(GraphMoodsInitialState value) initial,
    required TResult Function(GraphMoodsLoadingState value) loading,
    required TResult Function(GraphMoodsSuccessState value) loaded,
    required TResult Function(GraphMoodsErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GraphMoodsInitialState value)? initial,
    TResult? Function(GraphMoodsLoadingState value)? loading,
    TResult? Function(GraphMoodsSuccessState value)? loaded,
    TResult? Function(GraphMoodsErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GraphMoodsInitialState value)? initial,
    TResult Function(GraphMoodsLoadingState value)? loading,
    TResult Function(GraphMoodsSuccessState value)? loaded,
    TResult Function(GraphMoodsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GraphMoodsInitialState implements GraphMoodsState {
  const factory GraphMoodsInitialState() = _$GraphMoodsInitialStateImpl;
}

/// @nodoc
abstract class _$$GraphMoodsLoadingStateImplCopyWith<$Res> {
  factory _$$GraphMoodsLoadingStateImplCopyWith(
          _$GraphMoodsLoadingStateImpl value,
          $Res Function(_$GraphMoodsLoadingStateImpl) then) =
      __$$GraphMoodsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GraphMoodsLoadingStateImplCopyWithImpl<$Res>
    extends _$GraphMoodsStateCopyWithImpl<$Res, _$GraphMoodsLoadingStateImpl>
    implements _$$GraphMoodsLoadingStateImplCopyWith<$Res> {
  __$$GraphMoodsLoadingStateImplCopyWithImpl(
      _$GraphMoodsLoadingStateImpl _value,
      $Res Function(_$GraphMoodsLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphMoodsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GraphMoodsLoadingStateImpl implements GraphMoodsLoadingState {
  const _$GraphMoodsLoadingStateImpl();

  @override
  String toString() {
    return 'GraphMoodsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphMoodsLoadingStateImpl);
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
    required TResult Function(GraphMoodsInitialState value) initial,
    required TResult Function(GraphMoodsLoadingState value) loading,
    required TResult Function(GraphMoodsSuccessState value) loaded,
    required TResult Function(GraphMoodsErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GraphMoodsInitialState value)? initial,
    TResult? Function(GraphMoodsLoadingState value)? loading,
    TResult? Function(GraphMoodsSuccessState value)? loaded,
    TResult? Function(GraphMoodsErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GraphMoodsInitialState value)? initial,
    TResult Function(GraphMoodsLoadingState value)? loading,
    TResult Function(GraphMoodsSuccessState value)? loaded,
    TResult Function(GraphMoodsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GraphMoodsLoadingState implements GraphMoodsState {
  const factory GraphMoodsLoadingState() = _$GraphMoodsLoadingStateImpl;
}

/// @nodoc
abstract class _$$GraphMoodsSuccessStateImplCopyWith<$Res> {
  factory _$$GraphMoodsSuccessStateImplCopyWith(
          _$GraphMoodsSuccessStateImpl value,
          $Res Function(_$GraphMoodsSuccessStateImpl) then) =
      __$$GraphMoodsSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Mood> moods});
}

/// @nodoc
class __$$GraphMoodsSuccessStateImplCopyWithImpl<$Res>
    extends _$GraphMoodsStateCopyWithImpl<$Res, _$GraphMoodsSuccessStateImpl>
    implements _$$GraphMoodsSuccessStateImplCopyWith<$Res> {
  __$$GraphMoodsSuccessStateImplCopyWithImpl(
      _$GraphMoodsSuccessStateImpl _value,
      $Res Function(_$GraphMoodsSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphMoodsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moods = null,
  }) {
    return _then(_$GraphMoodsSuccessStateImpl(
      moods: null == moods
          ? _value._moods
          : moods // ignore: cast_nullable_to_non_nullable
              as List<Mood>,
    ));
  }
}

/// @nodoc

class _$GraphMoodsSuccessStateImpl implements GraphMoodsSuccessState {
  const _$GraphMoodsSuccessStateImpl({required final List<Mood> moods})
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
    return 'GraphMoodsState.loaded(moods: $moods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphMoodsSuccessStateImpl &&
            const DeepCollectionEquality().equals(other._moods, _moods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_moods));

  /// Create a copy of GraphMoodsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphMoodsSuccessStateImplCopyWith<_$GraphMoodsSuccessStateImpl>
      get copyWith => __$$GraphMoodsSuccessStateImplCopyWithImpl<
          _$GraphMoodsSuccessStateImpl>(this, _$identity);

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
    required TResult Function(GraphMoodsInitialState value) initial,
    required TResult Function(GraphMoodsLoadingState value) loading,
    required TResult Function(GraphMoodsSuccessState value) loaded,
    required TResult Function(GraphMoodsErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GraphMoodsInitialState value)? initial,
    TResult? Function(GraphMoodsLoadingState value)? loading,
    TResult? Function(GraphMoodsSuccessState value)? loaded,
    TResult? Function(GraphMoodsErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GraphMoodsInitialState value)? initial,
    TResult Function(GraphMoodsLoadingState value)? loading,
    TResult Function(GraphMoodsSuccessState value)? loaded,
    TResult Function(GraphMoodsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class GraphMoodsSuccessState implements GraphMoodsState {
  const factory GraphMoodsSuccessState({required final List<Mood> moods}) =
      _$GraphMoodsSuccessStateImpl;

  List<Mood> get moods;

  /// Create a copy of GraphMoodsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GraphMoodsSuccessStateImplCopyWith<_$GraphMoodsSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GraphMoodsErrorStateImplCopyWith<$Res> {
  factory _$$GraphMoodsErrorStateImplCopyWith(_$GraphMoodsErrorStateImpl value,
          $Res Function(_$GraphMoodsErrorStateImpl) then) =
      __$$GraphMoodsErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GraphMoodsErrorStateImplCopyWithImpl<$Res>
    extends _$GraphMoodsStateCopyWithImpl<$Res, _$GraphMoodsErrorStateImpl>
    implements _$$GraphMoodsErrorStateImplCopyWith<$Res> {
  __$$GraphMoodsErrorStateImplCopyWithImpl(_$GraphMoodsErrorStateImpl _value,
      $Res Function(_$GraphMoodsErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphMoodsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GraphMoodsErrorStateImpl implements GraphMoodsErrorState {
  const _$GraphMoodsErrorStateImpl();

  @override
  String toString() {
    return 'GraphMoodsState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphMoodsErrorStateImpl);
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
    required TResult Function(GraphMoodsInitialState value) initial,
    required TResult Function(GraphMoodsLoadingState value) loading,
    required TResult Function(GraphMoodsSuccessState value) loaded,
    required TResult Function(GraphMoodsErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GraphMoodsInitialState value)? initial,
    TResult? Function(GraphMoodsLoadingState value)? loading,
    TResult? Function(GraphMoodsSuccessState value)? loaded,
    TResult? Function(GraphMoodsErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GraphMoodsInitialState value)? initial,
    TResult Function(GraphMoodsLoadingState value)? loading,
    TResult Function(GraphMoodsSuccessState value)? loaded,
    TResult Function(GraphMoodsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GraphMoodsErrorState implements GraphMoodsState {
  const factory GraphMoodsErrorState() = _$GraphMoodsErrorStateImpl;
}
