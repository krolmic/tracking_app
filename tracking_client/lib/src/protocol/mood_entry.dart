/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class MoodEntry extends _i1.SerializableEntity {
  MoodEntry._({
    this.id,
    required this.userId,
    required this.value,
    this.thingsIAmGratefulFor,
    this.diary,
    required this.createdOn,
  });

  factory MoodEntry({
    int? id,
    required String userId,
    required int value,
    List<String>? thingsIAmGratefulFor,
    String? diary,
    required DateTime createdOn,
  }) = _MoodEntryImpl;

  factory MoodEntry.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return MoodEntry(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<String>(jsonSerialization['userId']),
      value: serializationManager.deserialize<int>(jsonSerialization['value']),
      thingsIAmGratefulFor: serializationManager.deserialize<List<String>?>(
          jsonSerialization['thingsIAmGratefulFor']),
      diary:
          serializationManager.deserialize<String?>(jsonSerialization['diary']),
      createdOn: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdOn']),
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

  DateTime createdOn;

  MoodEntry copyWith({
    int? id,
    String? userId,
    int? value,
    List<String>? thingsIAmGratefulFor,
    String? diary,
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
      'createdOn': createdOn.toJson(),
    };
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
    required DateTime createdOn,
  }) : super._(
          id: id,
          userId: userId,
          value: value,
          thingsIAmGratefulFor: thingsIAmGratefulFor,
          diary: diary,
          createdOn: createdOn,
        );

  @override
  MoodEntry copyWith({
    Object? id = _Undefined,
    String? userId,
    int? value,
    Object? thingsIAmGratefulFor = _Undefined,
    Object? diary = _Undefined,
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
      createdOn: createdOn ?? this.createdOn,
    );
  }
}
