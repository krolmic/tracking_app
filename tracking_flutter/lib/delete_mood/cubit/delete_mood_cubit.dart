import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_repository/mood_repository.dart';

part 'delete_mood_cubit.freezed.dart';
part 'delete_mood_state.dart';

class DeleteMoodCubit extends Cubit<DeleteMoodState> {
  DeleteMoodCubit({
    required MoodRepository moodRepository,
  })  : _moodRepository = moodRepository,
        super(const DeleteMoodState.initial());

  final MoodRepository _moodRepository;

  Future<void> deleteMood(
    Mood mood,
  ) async {
    try {
      emit(const DeleteMoodState.loading());

      await _moodRepository.deleteMood(
        mood,
      );

      emit(const DeleteMoodState.success());
    } catch (e, stackTrace) {
      Fimber.e('Mood deletion failed', ex: e, stacktrace: stackTrace);

      emit(const DeleteMoodState.error());
    }
  }
}
