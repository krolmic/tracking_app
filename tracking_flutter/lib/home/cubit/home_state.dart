part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(MoodsListState.initial()) MoodsListState moodsListState,
  }) = _HomeState;
}

extension HomeStateX on HomeState {
  bool get isInitialOrLoading => moodsListState.isInitialOrLoading;
  bool get isError => moodsListState.isError;
  bool get isSuccess => moodsListState.isSuccess;
}

@freezed
class MoodsListState with _$MoodsListState {
  const factory MoodsListState.initial() = MoodsListInitialState;
  const factory MoodsListState.loading() = MoodsListLoadingState;
  const factory MoodsListState.loaded({
    required List<Mood> moods,
  }) = MoodsListSuccessState;
  const factory MoodsListState.error() = MoodsListErrorState;
}

extension MoodsListStateX on MoodsListState {
  bool get isInitial => this is MoodsListInitialState;
  bool get isLoading => this is MoodsListLoadingState;
  bool get isInitialOrLoading => isInitial || isLoading;
  bool get isError => this is MoodsListErrorState;
  bool get isSuccess => this is MoodsListSuccessState;

  bool get containsTodayMood {
    return maybeWhen(
      loaded: (moods) {
        return moods.any((mood) => mood.isToday);
      },
      orElse: () => false,
    );
  }

  List<Mood> get moodsThisWeek {
    return maybeWhen(
      loaded: (moods) {
        return moods.where((mood) => mood.isThisWeek).toList();
      },
      orElse: () => [],
    );
  }

  double get averageMoodThisWeek {
    return maybeWhen(
      loaded: (moods) {
        return moodsThisWeek.isEmpty
            ? 0
            : moodsThisWeek.map((mood) => mood.value).reduce((a, b) => a + b) /
                moodsThisWeek.length;
      },
      orElse: () => 0,
    );
  }

  int get averageWorkTimeInHoursThisWeek {
    return maybeWhen(
      loaded: (moods) {
        if (moodsThisWeek.isEmpty) {
          return 0;
        }
        final totalDuration = moodsThisWeek
            .map((mood) => mood.workTime ?? Duration.zero)
            .reduce((a, b) => a + b);
        final averageDuration = totalDuration.inHours ~/ moodsThisWeek.length;
        return averageDuration;
      },
      orElse: () => 0,
    );
  }

  int get averageRevenueThisWeek {
    return maybeWhen(
      loaded: (moods) {
        if (moodsThisWeek.isEmpty) {
          return 0;
        }
        final totalRevenue = moodsThisWeek
            .map((mood) => mood.revenue ?? 0)
            .reduce((a, b) => a + b);
        final averageRevenue = totalRevenue ~/ moodsThisWeek.length;
        return averageRevenue;
      },
      orElse: () => 0,
    );
  }

  bool get trackedEveryDayThisWeek {
    return maybeWhen(
      loaded: (moods) {
        return moodsThisWeek.length == DateTime.now().weekday;
      },
      orElse: () => false,
    );
  }

  List<Mood> get recentlyAddedMoods {
    return maybeWhen(
      loaded: (moods) {
        if (moodsThisWeek.length > 2) {
          return moodsThisWeek;
        }

        return moods.take(3).toList();
      },
      orElse: () => [],
    );
  }

  double get weeklyProgress {
    return maybeWhen(
      loaded: (moods) {
        return moodsThisWeek.length / DateTime.now().weekday;
      },
      orElse: () => 0,
    );
  }

  List<Mood> get moods {
    return maybeWhen(
      loaded: (moods) {
        return moods;
      },
      orElse: () => [],
    );
  }
}
