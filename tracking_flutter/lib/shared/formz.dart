import 'package:formz/formz.dart';
import 'package:mood_repository/mood_repository.dart';

/// [MoodValueInput] input validation errors
enum MoodValueInputError {
  outOfValidRange,
}

/// [FormzInput] class for today's mood estimation
/// (awaits integer value in the range 1-10, input for [Mood.value]).
class MoodValueInput extends FormzInput<int, MoodValueInputError> {
  /// Unmodified [MoodValueInput]
  const MoodValueInput.pure() : super.pure(5);

  /// Modified [MoodValueInput]
  const MoodValueInput.dirty({int value = 5}) : super.dirty(value);

  static const minValue = 1;
  static const maxValue = 10;

  @override
  MoodValueInputError? validator(int value) {
    return value >= MoodValueInput.minValue && value <= MoodValueInput.maxValue
        ? null
        : MoodValueInputError.outOfValidRange;
  }
}

enum ThingsIAmGreatfulAboutInputError {
  invalid,
}

/// [FormzInput] class for things I am greatful about
/// (awaits string value, input for [Mood.thingsIAmGratefulAbout] values)
class ThingsIAmGreatfulAboutInput
    extends FormzInput<String, ThingsIAmGreatfulAboutInputError> {
  const ThingsIAmGreatfulAboutInput.pure() : super.pure('');

  const ThingsIAmGreatfulAboutInput.dirty({String value = ''})
      : super.dirty(value);

  @override
  ThingsIAmGreatfulAboutInputError? validator(String value) {
    // There are no invalid values for now.
    return null;
  }
}

enum RevenueInputError {
  invalid,
}

class RevenueInput extends FormzInput<double, RevenueInputError> {
  const RevenueInput.pure() : super.pure(0);

  const RevenueInput.dirty({double value = 0.0}) : super.dirty(value);

  @override
  RevenueInputError? validator(double value) {
    return null;
  }
}

enum WorkingTimeInputError {
  invalid,
}

class WorkTimeInput extends FormzInput<Duration, WorkingTimeInputError> {
  const WorkTimeInput.pure() : super.pure(Duration.zero);

  const WorkTimeInput.dirty({Duration value = Duration.zero})
      : super.dirty(value);

  @override
  WorkingTimeInputError? validator(Duration value) {
    return null;
  }
}

class MoodFormzState with FormzMixin {
  const MoodFormzState({
    this.moodValue = const MoodValueInput.pure(),
    this.thingsIAmGreatfulAbout1 = const ThingsIAmGreatfulAboutInput.pure(),
    this.thingsIAmGreatfulAbout2 = const ThingsIAmGreatfulAboutInput.pure(),
    this.thingsIAmGreatfulAbout3 = const ThingsIAmGreatfulAboutInput.pure(),
    this.revenue = const RevenueInput.pure(),
    this.workTime = const WorkTimeInput.pure(),
  });

  final MoodValueInput moodValue;
  final ThingsIAmGreatfulAboutInput thingsIAmGreatfulAbout1;
  final ThingsIAmGreatfulAboutInput thingsIAmGreatfulAbout2;
  final ThingsIAmGreatfulAboutInput thingsIAmGreatfulAbout3;
  final RevenueInput revenue;
  final WorkTimeInput workTime;

  MoodFormzState copyWith({
    MoodValueInput? moodValue,
    ThingsIAmGreatfulAboutInput? thingsIAmGreatfulAbout1,
    ThingsIAmGreatfulAboutInput? thingsIAmGreatfulAbout2,
    ThingsIAmGreatfulAboutInput? thingsIAmGreatfulAbout3,
    RevenueInput? revenue,
    WorkTimeInput? workTime,
    FormzSubmissionStatus? status,
  }) {
    return MoodFormzState(
      moodValue: moodValue ?? this.moodValue,
      thingsIAmGreatfulAbout1:
          thingsIAmGreatfulAbout1 ?? this.thingsIAmGreatfulAbout1,
      thingsIAmGreatfulAbout2:
          thingsIAmGreatfulAbout2 ?? this.thingsIAmGreatfulAbout2,
      thingsIAmGreatfulAbout3:
          thingsIAmGreatfulAbout3 ?? this.thingsIAmGreatfulAbout3,
      revenue: revenue ?? this.revenue,
      workTime: workTime ?? this.workTime,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [
        moodValue,
        thingsIAmGreatfulAbout1,
        thingsIAmGreatfulAbout2,
        thingsIAmGreatfulAbout3,
        revenue,
        workTime,
      ];
}
