/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class MoodEntry implements _i1.SerializableModel {
  MoodEntry._({
    this.id,
    required this.userId,
    required this.value,
    this.thingsIAmGratefulFor,
    this.diary,
    this.revenue,
    this.workTime,
    required this.createdOn,
  });

  factory MoodEntry({
    int? id,
    required String userId,
    required int value,
    List<String>? thingsIAmGratefulFor,
    String? diary,
    double? revenue,
    Duration? workTime,
    required DateTime createdOn,
  }) = _MoodEntryImpl;

  factory MoodEntry.fromJson(Map<String, dynamic> jsonSerialization) {
    return MoodEntry(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      value: jsonSerialization['value'] as int,
      thingsIAmGratefulFor: (jsonSerialization['thingsIAmGratefulFor'] as List?)
          ?.map((e) => e as String)
          .toList(),
      diary: jsonSerialization['diary'] as String?,
      revenue: (jsonSerialization['revenue'] as num?)?.toDouble(),
      workTime: jsonSerialization['workTime'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(jsonSerialization['workTime']),
      createdOn:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdOn']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String userId;

  int value;

  List<String>? thingsIAmGratefulFor;

  String? diary;

  double? revenue;

  Duration? workTime;

  DateTime createdOn;

  MoodEntry copyWith({
    int? id,
    String? userId,
    int? value,
    List<String>? thingsIAmGratefulFor,
    String? diary,
    double? revenue,
    Duration? workTime,
    DateTime? createdOn,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'value': value,
      if (thingsIAmGratefulFor != null)
        'thingsIAmGratefulFor': thingsIAmGratefulFor?.toJson(),
      if (diary != null) 'diary': diary,
      if (revenue != null) 'revenue': revenue,
      if (workTime != null) 'workTime': workTime?.toJson(),
      'createdOn': createdOn.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MoodEntryImpl extends MoodEntry {
  _MoodEntryImpl({
    int? id,
    required String userId,
    required int value,
    List<String>? thingsIAmGratefulFor,
    String? diary,
    double? revenue,
    Duration? workTime,
    required DateTime createdOn,
  }) : super._(
          id: id,
          userId: userId,
          value: value,
          thingsIAmGratefulFor: thingsIAmGratefulFor,
          diary: diary,
          revenue: revenue,
          workTime: workTime,
          createdOn: createdOn,
        );

  @override
  MoodEntry copyWith({
    Object? id = _Undefined,
    String? userId,
    int? value,
    Object? thingsIAmGratefulFor = _Undefined,
    Object? diary = _Undefined,
    Object? revenue = _Undefined,
    Object? workTime = _Undefined,
    DateTime? createdOn,
  }) {
    return MoodEntry(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      value: value ?? this.value,
      thingsIAmGratefulFor: thingsIAmGratefulFor is List<String>?
          ? thingsIAmGratefulFor
          : this.thingsIAmGratefulFor?.clone(),
      diary: diary is String? ? diary : this.diary,
      revenue: revenue is double? ? revenue : this.revenue,
      workTime: workTime is Duration? ? workTime : this.workTime,
      createdOn: createdOn ?? this.createdOn,
    );
  }
}
