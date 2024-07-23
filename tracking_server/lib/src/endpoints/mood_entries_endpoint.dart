import 'package:serverpod/server.dart';

import '../generated/protocol.dart';

class MoodEntriesEndpoint extends Endpoint {
  static const int moodEntriesPerPage = 15;

  @override
  bool get requireLogin => true;

  Future<List<MoodEntry>> getMoodEntries(
    Session session, {
    required int page,
    required String userId,
  }) async {
    return await MoodEntry.db.find(
      session,
      orderBy: (moodEntry) => moodEntry.createdOn,
      orderDescending: true,
      where: (moodEntry) => moodEntry.userId.equals(userId),
      limit: moodEntriesPerPage,
      offset: page > 0 ? (page - 1) * moodEntriesPerPage : 0,
    );
  }

  Future<List<MoodEntry>> getMoodEntriesInTimeRange(
    Session session, {
    required String userId,
    required DateTime from,
    required DateTime to,
  }) async {
    return await MoodEntry.db.find(
      session,
      orderBy: (moodEntry) => moodEntry.createdOn,
      orderDescending: true,
      where: (moodEntry) =>
          moodEntry.userId.equals(userId) &
          moodEntry.createdOn.between(from, to),
    );
  }

  Future<MoodEntry> createMoodEntry(
    Session session,
    MoodEntry moodEntry,
  ) async {
    return await MoodEntry.db.insertRow(session, moodEntry);
  }

  Future<MoodEntry> updateMoodEntry(
    Session session, {
    required int id,
    int? value,
    String? diary,
    List<String>? thingsIAmGratefulFor,
    double? revenue,
    Duration? workTime,
  }) async {
    var moodEntry = await MoodEntry.db.findById(session, id);
    if (moodEntry == null) {
      throw Exception('Mood entry not found.');
    }

    if (value != null) {
      moodEntry.value = value;
    }
    if (diary != null) {
      moodEntry.diary = diary;
    }
    if (thingsIAmGratefulFor != null) {
      moodEntry.thingsIAmGratefulFor = thingsIAmGratefulFor;
    }
    if (revenue != null) {
      moodEntry.revenue = revenue;
    }
    if (workTime != null) {
      moodEntry.workTime = workTime;
    }

    return await MoodEntry.db.updateRow(session, moodEntry);
  }

  Future<void> deleteMoodEntry(
    Session session, {
    required int id,
  }) async {
    final moodEntry = await MoodEntry.db.findById(session, id);
    if (moodEntry == null) {
      throw Exception('Mood entry not found.');
    }

    await MoodEntry.db.deleteRow(
      session,
      moodEntry,
    );
  }

  Future<void> deleteMoodEntries(
    Session session, {
    required String userId,
  }) async {
    await MoodEntry.db.deleteWhere(
      session,
      where: (moodEntry) => moodEntry.userId.equals(userId),
    );
  }
}
