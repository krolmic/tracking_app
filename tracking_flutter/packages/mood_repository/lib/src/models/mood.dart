import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_repository/mood_repository.dart';

part 'mood.freezed.dart';

@freezed
class Mood with _$Mood {
  factory Mood({
    required int id,
    required DateTime createdOn,
    required int value,
    String? diary,
    List<String>? thingsIAmGratefulAbout,
  }) = _Mood;

  const Mood._();

  /// [Mood] constructor awaiting Serverpod's client model [MoodEntry] object
  factory Mood.fromMoodEntry(MoodEntry moodEntry) =>
      MoodCoverter().convert(moodEntry);

  bool get isToday {
    final now = DateTime.now();
    return createdOn.year == now.year &&
        createdOn.month == now.month &&
        createdOn.day == now.day;
  }
}

/// Converts [MoodEntry] to [Mood]
class MoodCoverter extends Converter<MoodEntry, Mood> {
  @override
  Mood convert(MoodEntry input) {
    return Mood(
      id: input.id!,
      diary: input.diary,
      createdOn: input.createdOn,
      thingsIAmGratefulAbout: input.thingsIAmGratefulFor,
      value: input.value,
    );
  }
}
