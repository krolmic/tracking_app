part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  const factory AppState.loading() = _Loading;
  const factory AppState.success() = _Success;
  const factory AppState.error() = _Error;
}

extension AppStateX on AppState {
  bool get isInitial => this is _Initial;
  bool get isLoading => this is _Loading;
  bool get isInitialOrLoading => isInitial || isLoading;
  bool get isError => this is _Error;
  bool get isSuccess => this is _Success;
}
