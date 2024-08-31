import 'package:mood_repository/src/models/mood.dart';
import 'package:tracking_client/tracking_client.dart';

class MoodRepositoryException implements Exception {
  MoodRepositoryException({
    this.message,
    this.cause,
  });

  final String? message;
  final dynamic cause;

  @override
  String toString() {
    return 'MoodRepositoryException { message: $message, cause: $cause }';
  }
}

class MoodRepository {
  MoodRepository({
    required Client serverpodClient,
  }) : _serverpodClient = serverpodClient;

  final Client _serverpodClient;

  static const paginationLimit = 15;

  Future<List<Mood>> getMoods({
    required int page,
    required String userId,
  }) async {
    try {
      final moodEntries = await _serverpodClient.moodEntries.getMoodEntries(
        page: page,
        userId: userId,
      );

      final moods = <Mood>[];

      if (moodEntries.isNotEmpty) {
        for (final moodEntry in moodEntries) {
          moods.add(Mood.fromMoodEntry(moodEntry));
        }
      }

      return moods;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        MoodRepositoryException(
          message: 'MoodEntry query failed.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Future<List<Mood>> getMoodsInTimeRange({
    required DateTime from,
    required DateTime to,
    required String userId,
  }) async {
    try {
      final fromDate = from.add(from.timeZoneOffset);
      final toDate = to.add(to.timeZoneOffset);

      final moodEntries =
          await _serverpodClient.moodEntries.getMoodEntriesInTimeRange(
        userId: userId,
        from: fromDate,
        to: toDate,
      );

      final moods = <Mood>[];

      if (moodEntries.isNotEmpty) {
        for (final moodEntry in moodEntries) {
          moods.add(Mood.fromMoodEntry(moodEntry));
        }
      }

      return moods;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        MoodRepositoryException(
          message: 'MoodEntry query for time range ${from.toIso8601String()}'
              '- ${to.toIso8601String()} failed.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Future<void> createMood({
    required String userId,
    required int value,
    required DateTime createdOn,
    List<String>? thingsIAmGratefulAbout,
    double? revenue,
    Duration? workTime,
  }) async {
    try {
      final createdOnDate = createdOn.add(createdOn.timeZoneOffset);

      // TODO(krolmic): Add text encryption for diary field (#44)
      final moodEntryToCreate = MoodEntry(
        userId: userId,
        value: value,
        createdOn: createdOnDate,
        thingsIAmGratefulFor: thingsIAmGratefulAbout,
        revenue: revenue,
        workTime: workTime,
      );

      await _serverpodClient.moodEntries.createMoodEntry(moodEntryToCreate);
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        MoodRepositoryException(
          message: 'MoodEntry creation failed.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Future<Mood> updateMood(
    Mood mood, {
    int? value,
    List<String>? thingsIAmGratefulAbout,
    double? revenue,
    Duration? workTime,
  }) async {
    try {
      final updatedMoodEntry =
          await _serverpodClient.moodEntries.updateMoodEntry(
        id: mood.id,
        value: value,
        thingsIAmGratefulFor: thingsIAmGratefulAbout,
        revenue: revenue,
        workTime: workTime,
      );

      return Mood.fromMoodEntry(updatedMoodEntry);
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        MoodRepositoryException(
          message: 'MoodEntry query failed.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Future<void> deleteMood(Mood mood) async {
    try {
      await _serverpodClient.moodEntries.deleteMoodEntry(id: mood.id);
    } catch (e, strackTrace) {
      Error.throwWithStackTrace(
        MoodRepositoryException(
          message: 'MoodEntry query failed.',
          cause: e,
        ),
        strackTrace,
      );
    }
  }

  Future<void> deleteMoods({
    required String userId,
  }) async {
    try {
      await _serverpodClient.moodEntries.deleteMoodEntries(userId: userId);
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        MoodRepositoryException(
          message: 'Deleting mood entries assigned to $userId failed',
          cause: e,
        ),
        stackTrace,
      );
    }
  }
}
