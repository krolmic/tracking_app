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
    double? revenue,
    Duration? workTime,
  }) = _Mood;

  const Mood._();

  /// [Mood] constructor awaiting Serverpod's client model [MoodEntry] object
  factory Mood.fromMoodEntry(MoodEntry moodEntry) =>
      MoodCoverter().convert(moodEntry);
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
      revenue: input.revenue,
      workTime: input.workTime,
    );
  }
}
