import 'package:hive_flutter/hive_flutter.dart';
import 'package:mood_repository/mood_repository.dart';

/// Exception thrown when a local mood repository operation fails
class LocalMoodRepositoryException implements Exception {
  LocalMoodRepositoryException({
    this.message,
    this.cause,
  });

  final String? message;
  final dynamic cause;

  @override
  String toString() {
    return 'LocalMoodRepositoryException { message: $message, cause: $cause }';
  }
}

/// A local storage implementation of [MoodRepository] using Hive
class LocalMoodRepository extends MoodRepository {
  LocalMoodRepository({
    required Box<Map<String, dynamic>> moodBox,
  }) : _moodBox = moodBox;

  final Box<Map<String, dynamic>> _moodBox;
  static const _boxName = 'moods';

  /// Initialize Hive and open the mood box
  static Future<LocalMoodRepository> initialize() async {
    await Hive.initFlutter();
    final box = await Hive.openBox<Map<String, dynamic>>(_boxName);
    return LocalMoodRepository(moodBox: box);
  }

  /// Closes the Hive box and cleans up resources
  Future<void> dispose() async {
    await _moodBox.compact(); // Optimize storage before closing
    await _moodBox.close();
  }

  @override
  Future<List<Mood>> getMoods({
    required int page,
    required String userId,
  }) async {
    try {
      final start = page * MoodRepository.paginationLimit;

      final moodMaps = _moodBox.values
          .where((map) => map['userId'] == userId)
          .toList()
          .reversed // Most recent first
          .skip(start)
          .take(MoodRepository.paginationLimit)
          .toList();

      return moodMaps.map(LocalMoodConverter.fromMap).toList();
    } catch (e) {
      throw LocalMoodRepositoryException(
        message: 'Failed to get moods from local storage',
        cause: e,
      );
    }
  }

  @override
  Future<List<Mood>> getMoodsInTimeRange({
    required DateTime from,
    required DateTime to,
    required String userId,
  }) async {
    try {
      final moodMaps = _moodBox.values
          .where(
            (map) =>
                map['userId'] == userId &&
                DateTime.parse(map['createdOn'] as String).isAfter(from) &&
                DateTime.parse(map['createdOn'] as String).isBefore(to),
          )
          .toList();

      return moodMaps.map(LocalMoodConverter.fromMap).toList();
    } catch (e) {
      throw LocalMoodRepositoryException(
        message: 'Failed to get moods in time range from local storage',
        cause: e,
      );
    }
  }

  @override
  Future<void> createMood({
    required String userId,
    required int value,
    required DateTime createdOn,
    List<String>? thingsIAmGratefulAbout,
    double? revenue,
    Duration? workTime,
  }) async {
    try {
      final id = _moodBox.length + 1;

      final mood = Mood(
        id: id,
        createdOn: createdOn,
        value: value,
        thingsIAmGratefulAbout: thingsIAmGratefulAbout,
        revenue: revenue,
        workTime: workTime,
      );

      final moodMap = LocalMoodConverter.toMap(mood, userId);
      await _moodBox.add(moodMap);
    } catch (e) {
      throw LocalMoodRepositoryException(
        message: 'Failed to create mood in local storage',
        cause: e,
      );
    }
  }

  @override
  Future<Mood> updateMood(
    Mood mood, {
    int? value,
    List<String>? thingsIAmGratefulAbout,
    double? revenue,
    Duration? workTime,
  }) async {
    try {
      final index =
          _moodBox.values.toList().indexWhere((map) => map['id'] == mood.id);
      final isExistingMood = index != -1;

      if (isExistingMood) {
        final existingMap = _moodBox.getAt(index)! as Map;
        final updatedMood = Mood(
          id: mood.id,
          createdOn: mood.createdOn,
          value: value ?? mood.value,
          thingsIAmGratefulAbout:
              thingsIAmGratefulAbout ?? mood.thingsIAmGratefulAbout,
          revenue: revenue ?? mood.revenue,
          workTime: workTime ?? mood.workTime,
        );

        final updatedMap = LocalMoodConverter.toMap(
          updatedMood,
          existingMap['userId'] as String,
        );
        await _moodBox.putAt(index, updatedMap);
        return updatedMood;
      }

      throw LocalMoodRepositoryException(
        message: 'Mood not found in local storage',
      );
    } catch (e) {
      throw LocalMoodRepositoryException(
        message: 'Failed to update mood in local storage',
        cause: e,
      );
    }
  }

  @override
  Future<void> deleteMood(Mood mood) async {
    try {
      final index =
          _moodBox.values.toList().indexWhere((map) => map['id'] == mood.id);

      if (index != -1) {
        await _moodBox.deleteAt(index);
      }
    } catch (e) {
      throw LocalMoodRepositoryException(
        message: 'Failed to delete mood from local storage',
        cause: e,
      );
    }
  }

  @override
  Future<void> deleteMoods({required String userId}) async {
    try {
      final indexes = _moodBox.values
          .toList()
          .asMap()
          .entries
          .where((entry) => entry.value['userId'] == userId)
          .map((entry) => entry.key)
          .toList();

      // Delete from highest index to lowest to avoid shifting issues
      for (final index in indexes.reversed) {
        await _moodBox.deleteAt(index);
      }
    } catch (e) {
      throw LocalMoodRepositoryException(
        message: 'Failed to delete moods from local storage',
        cause: e,
      );
    }
  }
}

/// Converts between [Mood] and Map representations for local storage
class LocalMoodConverter {
  /// Converts a Map from local storage to a [Mood] instance
  static Mood fromMap(Map<String, dynamic> map) {
    return Mood(
      id: map['id'] as int,
      createdOn: DateTime.parse(map['createdOn'] as String),
      value: map['value'] as int,
      thingsIAmGratefulAbout:
          (map['thingsIAmGratefulAbout'] as List?)?.cast<String>(),
      revenue: map['revenue'] as double?,
      workTime: map['workTime'] != null
          ? Duration(seconds: map['workTime'] as int)
          : null,
    );
  }

  /// Converts a [Mood] instance to a Map for local storage
  static Map<String, dynamic> toMap(Mood mood, String userId) {
    return {
      'id': mood.id,
      'userId': userId,
      'createdOn': mood.createdOn.toIso8601String(),
      'value': mood.value,
      'thingsIAmGratefulAbout': mood.thingsIAmGratefulAbout,
      'revenue': mood.revenue,
      'workTime': mood.workTime?.inSeconds,
    };
  }
}
