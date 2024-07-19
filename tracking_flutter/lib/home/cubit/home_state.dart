part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeMoodsState.initial()) HomeMoodsState moodsState,
  }) = _HomeState;
}

extension HomeStateX on HomeState {
  bool get isInitialOrLoading => moodsState.isInitial || moodsState.isLoading;
  bool get isError => moodsState.isError;
  bool get isSuccess => moodsState.isSuccess;
}

@freezed
class HomeMoodsState with _$HomeMoodsState {
  const factory HomeMoodsState.initial() = HomeMoodsInitialState;
  const factory HomeMoodsState.loading() = HomeMoodsLoadingState;
  const factory HomeMoodsState.loaded({
    required List<Mood> moods,
    required bool loadingMore,
    required bool hasReachedMax,
    required int nextPageToLoad,
  }) = HomeMoodsSuccessState;
  const factory HomeMoodsState.error() = HomeMoodsErrorState;
}

extension HomeMoodsStateX on HomeMoodsState {
  bool get isInitial => this is HomeMoodsInitialState;
  bool get isLoading => this is HomeMoodsLoadingState;
  bool get isError => this is HomeMoodsErrorState;
  bool get isSuccess => this is HomeMoodsSuccessState;

  bool get containsTodayMood {
    return maybeWhen(
      loaded: (moods, _, __, ___) {
        return moods.any((mood) => mood.isToday);
      },
      orElse: () => false,
    );
  }

  Mood? get todaysMood {
    if (isSuccess) {
      try {
        return (this as HomeMoodsSuccessState).moods.firstWhere(
              (mood) => mood.isToday,
            );
      } catch (e) {
        return null;
      }
    } else {
      return null;
    }
  }
}
