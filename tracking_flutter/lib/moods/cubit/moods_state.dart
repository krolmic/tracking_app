part of 'moods_cubit.dart';

@freezed
class MoodsState with _$MoodsState {
  const factory MoodsState({
    @Default(MoodsListState.initial()) MoodsListState moodsListState,
  }) = _MoodsState;
}

extension MoodsStateX on MoodsState {
  bool get isInitialOrLoading =>
      moodsListState.isInitial || moodsListState.isLoading;
  bool get isError => moodsListState.isError;
  bool get isSuccess => moodsListState.isSuccess;
}

@freezed
class MoodsListState with _$MoodsListState {
  const factory MoodsListState.initial() = MoodsListInitialState;
  const factory MoodsListState.loading() = MoodsListLoadingState;
  const factory MoodsListState.loaded({
    required List<Mood> moods,
    required bool loadingMore,
    required bool hasReachedMax,
    required int nextPageToLoad,
  }) = MoodsListSuccessState;
  const factory MoodsListState.error() = MoodsListErrorState;
}

extension MoodsListStateX on MoodsListState {
  bool get isInitial => this is MoodsListInitialState;
  bool get isLoading => this is MoodsListLoadingState;
  bool get isError => this is MoodsListErrorState;
  bool get isSuccess => this is MoodsListSuccessState;

  List<Mood> get moods {
    return maybeWhen(
      loaded: (moods, _, __, ___) => moods,
      orElse: () => [],
    );
  }

  bool get hasReachedMax {
    return maybeWhen(
      loaded: (_, __, hasReachedMax, ___) => hasReachedMax,
      orElse: () => false,
    );
  }

  bool get containsTodayMood {
    return maybeWhen(
      loaded: (moods, _, __, ___) {
        return moods.any((mood) => mood.createdOn.isToday);
      },
      orElse: () => false,
    );
  }

  Mood? get todaysMood {
    if (isSuccess) {
      try {
        return (this as MoodsListSuccessState).moods.firstWhere(
              (mood) => mood.createdOn.isToday,
            );
      } catch (e) {
        return null;
      }
    } else {
      return null;
    }
  }
}
