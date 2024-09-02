part of 'calendar_bloc.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState({
    @Default(CalendarMoodsState.initial()) CalendarMoodsState moodsState,
    @Default(CalendarTargetDateState.initial())
    CalendarTargetDateState targetDate,
  }) = _CalendarState;
}

extension CalendarStateeX on CalendarState {
  bool get isInitialOrLoading => moodsState.isInitial || moodsState.isLoading;
  bool get isError => moodsState.isError;
  bool get isSuccess => moodsState.isSuccess;
}

@freezed
class CalendarTargetDateState with _$CalendarTargetDateState {
  const factory CalendarTargetDateState.initial() =
      CalendarTargetDateInitialState;
  const factory CalendarTargetDateState.set({
    required DateTime date,
  }) = CalendarTargetDateSetState;
}

extension CalendarTargetDateStateX on CalendarTargetDateState {
  bool get isInitial => this is CalendarTargetDateInitialState;
  bool get isSet => this is CalendarTargetDateSetState;

  DateTime get date =>
      isSet ? (this as CalendarTargetDateSetState).date : DateTime.now();
}

@freezed
class CalendarMoodsState with _$CalendarMoodsState {
  const factory CalendarMoodsState.initial() = CalendarMoodsInitialState;
  const factory CalendarMoodsState.loading() = CalendarMoodsLoadingState;
  const factory CalendarMoodsState.loaded({
    required List<Mood> moods,
  }) = CalendarMoodsSuccessState;
  const factory CalendarMoodsState.error() = CalendarMoodsErrorState;
}

extension CalendarMoodsStateX on CalendarMoodsState {
  bool get isInitial => this is CalendarMoodsInitialState;
  bool get isLoading => this is CalendarMoodsLoadingState;
  bool get isError => this is CalendarMoodsErrorState;
  bool get isSuccess => this is CalendarMoodsSuccessState;

  List<Mood> get moods =>
      isSuccess ? (this as CalendarMoodsSuccessState).moods : [];

  Mood? getMoodAtCreatedOnDate(DateTime date) {
    try {
      return moods.firstWhere(
        (mood) => mood.createdOn.isSameDay(date),
      );
    } catch (e) {
      return null;
    }
  }
}
