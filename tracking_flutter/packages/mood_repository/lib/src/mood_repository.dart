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

  Future<void> init() async {
    await _serverpodClient.authenticationKeyManager!.put('valid');
  }

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

  Future<Mood> createMood({
    required String userId,
    required int value,
    required DateTime createdOn,
    String? diary,
    List<String>? thingsIAmGratefulAbout,
  }) async {
    try {
      // As no timezone info is passed to the server,
      // add the local timezone offset to the createdOn date.
      final createdOnWithOffset = createdOn.add(createdOn.timeZoneOffset);

      final moodEntryToCreate = MoodEntry(
        userId: userId,
        value: value,
        createdOn: createdOnWithOffset,
        diary: diary != null && diary.isNotEmpty ? diary : null,
        thingsIAmGratefulFor: thingsIAmGratefulAbout,
      );

      final createdMoodEntry =
          await _serverpodClient.moodEntries.createMoodEntry(moodEntryToCreate);

      return Mood.fromMoodEntry(createdMoodEntry);
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
    String? diary,
    List<String>? thingsIAmGratefulAbout,
  }) async {
    try {
      final updatedMoodEntry =
          await _serverpodClient.moodEntries.updateMoodEntry(
        id: mood.id,
        value: value,
        diary: diary,
        thingsIAmGratefulFor: thingsIAmGratefulAbout,
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
