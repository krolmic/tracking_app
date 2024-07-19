// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Mood {
  int get id => throw _privateConstructorUsedError;
  DateTime get createdOn => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  String? get diary => throw _privateConstructorUsedError;
  List<String>? get thingsIAmGratefulAbout =>
      throw _privateConstructorUsedError;
  double? get revenue => throw _privateConstructorUsedError;
  Duration? get workTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoodCopyWith<Mood> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodCopyWith<$Res> {
  factory $MoodCopyWith(Mood value, $Res Function(Mood) then) =
      _$MoodCopyWithImpl<$Res, Mood>;
  @useResult
  $Res call(
      {int id,
      DateTime createdOn,
      int value,
      String? diary,
      List<String>? thingsIAmGratefulAbout,
      double? revenue,
      Duration? workTime});
}

/// @nodoc
class _$MoodCopyWithImpl<$Res, $Val extends Mood>
    implements $MoodCopyWith<$Res> {
  _$MoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdOn = null,
    Object? value = null,
    Object? diary = freezed,
    Object? thingsIAmGratefulAbout = freezed,
    Object? revenue = freezed,
    Object? workTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      diary: freezed == diary
          ? _value.diary
          : diary // ignore: cast_nullable_to_non_nullable
              as String?,
      thingsIAmGratefulAbout: freezed == thingsIAmGratefulAbout
          ? _value.thingsIAmGratefulAbout
          : thingsIAmGratefulAbout // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      revenue: freezed == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double?,
      workTime: freezed == workTime
          ? _value.workTime
          : workTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoodCopyWith<$Res> implements $MoodCopyWith<$Res> {
  factory _$$_MoodCopyWith(_$_Mood value, $Res Function(_$_Mood) then) =
      __$$_MoodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime createdOn,
      int value,
      String? diary,
      List<String>? thingsIAmGratefulAbout,
      double? revenue,
      Duration? workTime});
}

/// @nodoc
class __$$_MoodCopyWithImpl<$Res> extends _$MoodCopyWithImpl<$Res, _$_Mood>
    implements _$$_MoodCopyWith<$Res> {
  __$$_MoodCopyWithImpl(_$_Mood _value, $Res Function(_$_Mood) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdOn = null,
    Object? value = null,
    Object? diary = freezed,
    Object? thingsIAmGratefulAbout = freezed,
    Object? revenue = freezed,
    Object? workTime = freezed,
  }) {
    return _then(_$_Mood(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      diary: freezed == diary
          ? _value.diary
          : diary // ignore: cast_nullable_to_non_nullable
              as String?,
      thingsIAmGratefulAbout: freezed == thingsIAmGratefulAbout
          ? _value._thingsIAmGratefulAbout
          : thingsIAmGratefulAbout // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      revenue: freezed == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double?,
      workTime: freezed == workTime
          ? _value.workTime
          : workTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

class _$_Mood extends _Mood {
  _$_Mood(
      {required this.id,
      required this.createdOn,
      required this.value,
      this.diary,
      final List<String>? thingsIAmGratefulAbout,
      this.revenue,
      this.workTime})
      : _thingsIAmGratefulAbout = thingsIAmGratefulAbout,
        super._();

  @override
  final int id;
  @override
  final DateTime createdOn;
  @override
  final int value;
  @override
  final String? diary;
  final List<String>? _thingsIAmGratefulAbout;
  @override
  List<String>? get thingsIAmGratefulAbout {
    final value = _thingsIAmGratefulAbout;
    if (value == null) return null;
    if (_thingsIAmGratefulAbout is EqualUnmodifiableListView)
      return _thingsIAmGratefulAbout;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? revenue;
  @override
  final Duration? workTime;

  @override
  String toString() {
    return 'Mood(id: $id, createdOn: $createdOn, value: $value, diary: $diary, thingsIAmGratefulAbout: $thingsIAmGratefulAbout, revenue: $revenue, workTime: $workTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Mood &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.diary, diary) || other.diary == diary) &&
            const DeepCollectionEquality().equals(
                other._thingsIAmGratefulAbout, _thingsIAmGratefulAbout) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.workTime, workTime) ||
                other.workTime == workTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdOn,
      value,
      diary,
      const DeepCollectionEquality().hash(_thingsIAmGratefulAbout),
      revenue,
      workTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoodCopyWith<_$_Mood> get copyWith =>
      __$$_MoodCopyWithImpl<_$_Mood>(this, _$identity);
}

abstract class _Mood extends Mood {
  factory _Mood(
      {required final int id,
      required final DateTime createdOn,
      required final int value,
      final String? diary,
      final List<String>? thingsIAmGratefulAbout,
      final double? revenue,
      final Duration? workTime}) = _$_Mood;
  _Mood._() : super._();

  @override
  int get id;
  @override
  DateTime get createdOn;
  @override
  int get value;
  @override
  String? get diary;
  @override
  List<String>? get thingsIAmGratefulAbout;
  @override
  double? get revenue;
  @override
  Duration? get workTime;
  @override
  @JsonKey(ignore: true)
  _$$_MoodCopyWith<_$_Mood> get copyWith => throw _privateConstructorUsedError;
}
