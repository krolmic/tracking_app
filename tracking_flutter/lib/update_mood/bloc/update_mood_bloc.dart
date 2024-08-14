import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/shared/formz.dart';

part 'update_mood_bloc.freezed.dart';
part 'update_mood_event.dart';
part 'update_mood_state.dart';

class UpdateMoodBloc extends Bloc<UpdateMoodEvent, UpdateMoodState> {
  UpdateMoodBloc({
    required MoodRepository moodRepository,
  })  : _moodRepository = moodRepository,
        super(const UpdateMoodState()) {
    on<UpdateMoodEvent>((event, emit) async {
      if (event.isUpdateSubmitted) {
        await _onUpdateSubmitted(event.moodtoUpdate, emit);
      } else if (event.isMoodValueChanged) {
        _onMoodValueChanged(event.moodValue, emit);
      } else if (event.isThingsIAmGratefulFor1Changed) {
        _onThingsIAmGratefulFor1Changed(event.thingsIAmGratefulFor1, emit);
      } else if (event.isThingsIAmGratefulFor2Changed) {
        _onThingsIAmGratefulFor2Changed(event.thingsIAmGratefulFor2, emit);
      } else if (event.isThingsIAmGratefulFor3Changed) {
        _onThingsIAmGratefulFor3Changed(event.thingsIAmGratefulFor3, emit);
      } else if (event.isRevenueChanged) {
        _onRevenueChanged(event.revenue, emit);
      } else if (event.isWorkTimeChanged) {
        _onWorkTimeChanged(event.workTime, emit);
      } else if (event.isMoodSelected) {
        _onMoodSelected(event.selectedMood, emit);
      }
    });
  }

  final MoodRepository _moodRepository;

  Future<void> _onUpdateSubmitted(
    Mood mood,
    Emitter<UpdateMoodState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.inProgress,
        ),
      );

      await _moodRepository.updateMood(
        mood,
        value: state.moodFormState.moodValue.value,
        thingsIAmGratefulAbout: [
          if (state.moodFormState.thingsIAmGreatfulAbout1.value.isNotEmpty)
            state.moodFormState.thingsIAmGreatfulAbout1.value,
          if (state.moodFormState.thingsIAmGreatfulAbout2.value.isNotEmpty)
            state.moodFormState.thingsIAmGreatfulAbout2.value,
          if (state.moodFormState.thingsIAmGreatfulAbout3.value.isNotEmpty)
            state.moodFormState.thingsIAmGreatfulAbout3.value,
        ],
        revenue: state.moodFormState.revenue.value,
        workTime: state.moodFormState.workTime.value,
      );

      emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.success,
        ),
      );
    } catch (e, stackTrace) {
      Fimber.e('Updating mood failed', ex: e, stacktrace: stackTrace);
      emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  void _onMoodValueChanged(double value, Emitter<UpdateMoodState> emit) {
    emit(
      state.copyWith(
        moodFormState: state.moodFormState.copyWith(
          moodValue: MoodValueInput.dirty(value: value.toInt()),
        ),
      ),
    );
  }

  void _onThingsIAmGratefulFor1Changed(
    String value,
    Emitter<UpdateMoodState> emit,
  ) {
    emit(
      state.copyWith(
        moodFormState: state.moodFormState.copyWith(
          thingsIAmGreatfulAbout1:
              ThingsIAmGreatfulAboutInput.dirty(value: value),
        ),
      ),
    );
  }

  void _onThingsIAmGratefulFor2Changed(
    String value,
    Emitter<UpdateMoodState> emit,
  ) {
    emit(
      state.copyWith(
        moodFormState: state.moodFormState.copyWith(
          thingsIAmGreatfulAbout2:
              ThingsIAmGreatfulAboutInput.dirty(value: value),
        ),
      ),
    );
  }

  void _onThingsIAmGratefulFor3Changed(
    String value,
    Emitter<UpdateMoodState> emit,
  ) {
    emit(
      state.copyWith(
        moodFormState: state.moodFormState.copyWith(
          thingsIAmGreatfulAbout3:
              ThingsIAmGreatfulAboutInput.dirty(value: value),
        ),
      ),
    );
  }

  void _onRevenueChanged(String value, Emitter<UpdateMoodState> emit) {
    if (double.tryParse(value) == null) return;

    emit(
      state.copyWith(
        moodFormState: state.moodFormState.copyWith(
          revenue: RevenueInput.dirty(
            value: value.isNotEmpty ? double.parse(value) : 0,
          ),
        ),
      ),
    );
  }

  void _onWorkTimeChanged(Duration value, Emitter<UpdateMoodState> emit) {
    emit(
      state.copyWith(
        moodFormState: state.moodFormState.copyWith(
          workTime: WorkTimeInput.dirty(value: value),
        ),
      ),
    );
  }

  void _onMoodSelected(Mood mood, Emitter<UpdateMoodState> emit) {
    emit(
      state.copyWith(
        mood: mood,
        moodFormState: MoodFormzState(
          moodValue: MoodValueInput.dirty(value: mood.value),
          thingsIAmGreatfulAbout1: ThingsIAmGreatfulAboutInput.dirty(
            value: mood.thingsIAmGratefulAbout != null &&
                    mood.thingsIAmGratefulAbout!.isNotEmpty
                ? mood.thingsIAmGratefulAbout![0]
                : '',
          ),
          thingsIAmGreatfulAbout2: ThingsIAmGreatfulAboutInput.dirty(
            value: mood.thingsIAmGratefulAbout != null &&
                    mood.thingsIAmGratefulAbout!.length > 1
                ? mood.thingsIAmGratefulAbout![1]
                : '',
          ),
          thingsIAmGreatfulAbout3: ThingsIAmGreatfulAboutInput.dirty(
            value: mood.thingsIAmGratefulAbout != null &&
                    mood.thingsIAmGratefulAbout!.length > 2
                ? mood.thingsIAmGratefulAbout![2]
                : '',
          ),
          revenue: RevenueInput.dirty(
            value: mood.revenue != null ? mood.revenue! : 0,
          ),
          workTime: WorkTimeInput.dirty(value: mood.workTime ?? Duration.zero),
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }
}
