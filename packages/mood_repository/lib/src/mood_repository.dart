import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:mood_repository/src/amplify_models/MoodEntry.dart';
import 'package:mood_repository/src/models/mood.dart';

extension DateTimeX on DateTime {
  /// Returns [TemporalDateTime] from [DateTime]
  TemporalDateTime toTemoralDateTime() {
    try {
      final formattedDate = toIso8601String();
      final offset = timeZoneOffset;
      final utcHourOffset = (offset.isNegative ? '-' : '+') +
          offset.inHours.abs().toString().padLeft(2, '0');
      final utcMinuteOffset =
          (offset.inMinutes - offset.inHours * 60).toString().padLeft(2, '0');

      final dateTimeWithOffset =
          '$formattedDate$utcHourOffset:$utcMinuteOffset';
      return TemporalDateTime.fromString(dateTimeWithOffset);
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        MoodRepositoryException(
          message: 'Formatting DateTime to TemporalDateTime failed.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }
}

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
    required DataStoreCategory amplifyDatastore,
  }) : _amplifyDatastore = amplifyDatastore;

  final DataStoreCategory _amplifyDatastore;

  static const paginationLimit = 15;

  Future<List<Mood>> getMoods({
    required int page,
    required String userId,
  }) async {
    try {
      final fetchedItems = await _amplifyDatastore.query(
        MoodEntry.classType,
        sortBy: [
          MoodEntry.CREATEDON.descending(),
        ],
        where: MoodEntry.USERID.eq(userId),
        pagination: QueryPagination(page: page, limit: paginationLimit),
      );

      final moods = <Mood>[];

      if (fetchedItems.isNotEmpty) {
        final moodEntries = fetchedItems.whereType<MoodEntry>();

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
      final newMoodEntry = MoodEntry(
        userId: userId,
        value: value,
        createdOn: createdOn.toTemoralDateTime(),
        diary: diary != null && diary.isNotEmpty ? diary : null,
        thingsIamGratefulAbout: thingsIAmGratefulAbout,
      );

      await _amplifyDatastore.save(newMoodEntry);

      return Mood.fromMoodEntry(newMoodEntry);
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
      final moodEntryToUpdate = (await _amplifyDatastore.query(
        MoodEntry.classType,
        where: MoodEntry.ID.eq(mood.id),
      ))
          .first;

      // Update MoodEntry
      final updatedMoodEntry = moodEntryToUpdate.copyWith(
        value: value ?? moodEntryToUpdate.value,
        diary: diary ?? moodEntryToUpdate.diary,
        thingsIamGratefulAbout:
            thingsIAmGratefulAbout ?? moodEntryToUpdate.thingsIamGratefulAbout,
      );

      await _amplifyDatastore.save(updatedMoodEntry);

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
      final moodEntryToDelete = (await _amplifyDatastore.query(
        MoodEntry.classType,
        where: MoodEntry.ID.eq(mood.id),
      ))
          .first;

      await _amplifyDatastore.delete(moodEntryToDelete);
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
      final fetchedItems = await _amplifyDatastore.query(
        MoodEntry.classType,
        where: MoodEntry.USERID.eq(userId),
      );

      for (final moodEntry in fetchedItems) {
        await _amplifyDatastore.delete(moodEntry);
      }
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
