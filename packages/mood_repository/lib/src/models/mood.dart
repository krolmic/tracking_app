import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_repository/src/amplify_models/MoodEntry.dart';

part 'mood.freezed.dart';

@freezed
class Mood with _$Mood {
  factory Mood({
    required String id,
    required DateTime createdOn,
    required int value,
    String? diary,
    List<String>? thingsIAmGratefulAbout,
  }) = _Mood;

  /// [Mood] constructor awaiting Amplify model [MoodEntry] object
  factory Mood.fromMoodEntry(MoodEntry moodEntry) =>
      MoodCoverter().convert(moodEntry);
}

/// Converts [MoodEntry] to [Mood]
class MoodCoverter extends Converter<MoodEntry, Mood> {
  @override
  Mood convert(MoodEntry input) {
    return Mood(
      id: input.id,
      diary: input.diary,
      createdOn: input.createdOn.getDateTimeInUtc(),
      thingsIAmGratefulAbout: input.thingsIamGratefulAbout,
      value: input.value,
    );
  }
}
