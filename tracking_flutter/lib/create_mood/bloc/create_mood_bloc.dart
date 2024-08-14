import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_repository/mood_repository.dart';
import 'package:tracking_app/shared/formz.dart';
import 'package:user_profile_repository/user_profile_repository.dart'
    as user_profile_repository;

part 'create_mood_bloc.freezed.dart';
part 'create_mood_event.dart';
part 'create_mood_state.dart';

class CreateMoodBloc extends Bloc<CreateMoodEvent, CreateMoodState> {
  CreateMoodBloc({
    required MoodRepository moodRepository,
    required user_profile_repository.UserProfileRepository
        userProfileRepository,
  })  : _moodRepository = moodRepository,
        _userProfileRepository = userProfileRepository,
        super(const CreateMoodState()) {
    on<CreateMoodEvent>((event, emit) async {
      if (event.isCreationSubmitted) {
        await _onCreationSubmitted(emit);
      } else if (event.isMoodValueChanged) {
        _onMoodValueChanged(event.moodValue, emit);
      } else if (event.isThingsIAmGratefulFor1Changed) {
        _onThingsIAmGratefulFor1Changed(event.thingsIAmGratefulFor1, emit);
      } else if (event.isThingsIAmGratefulFor2Changed) {
        _onThingsIAAmGratefulFor2Changed(event.thingsIAmGratefulFor2, emit);
      } else if (event.isThingsIAmGratefulFor3Changed) {
        _onThingsIAmGratefulFor3Changed(event.thingsIAmGratefulFor3, emit);
      } else if (event.isRevenueChanged) {
        _onRevenueChanged(event.revenue, emit);
      } else if (event.isWorkTimeChanged) {
        _onWorkTimeChanged(event.workTime, emit);
      } else if (event.isDateChanged) {
        _onDateChanged(event.date, emit);
      } else if (event.isFormResetRequested) {
        _onFormResetRequested(
          event.formResetRevenue,
          event.formResetWorkTime,
          emit,
        );
      }
    });
  }

  final MoodRepository _moodRepository;
  final user_profile_repository.UserProfileRepository _userProfileRepository;

  Future<void> _createMood(Emitter<CreateMoodState> emit) async {
    try {
      emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.inProgress,
        ),
      );

      final userId = await _userProfileRepository.getCurrentUserId();

      await _moodRepository.createMood(
        userId: userId,
        createdOn: state.selectedDate ?? DateTime.now(),
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
          moodFormState: const MoodFormzState(),
          selectedDate: null,
        ),
      );
    } catch (e, stackTrace) {
      Fimber.e('Mood creation failed', ex: e, stacktrace: stackTrace);
      emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  Future<void> _onCreationSubmitted(Emitter<CreateMoodState> emit) async {
    await _createMood(emit);
  }

  void _onMoodValueChanged(double value, Emitter<CreateMoodState> emit) {
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
    Emitter<CreateMoodState> emit,
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

  void _onThingsIAAmGratefulFor2Changed(
    String value,
    Emitter<CreateMoodState> emit,
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
    Emitter<CreateMoodState> emit,
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

  void _onRevenueChanged(String value, Emitter<CreateMoodState> emit) {
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

  void _onWorkTimeChanged(Duration value, Emitter<CreateMoodState> emit) {
    emit(
      state.copyWith(
        moodFormState: state.moodFormState.copyWith(
          workTime: WorkTimeInput.dirty(value: value),
        ),
      ),
    );
  }

  void _onDateChanged(DateTime value, Emitter<CreateMoodState> emit) {
    emit(
      state.copyWith(
        selectedDate: value,
      ),
    );
  }

  void _onFormResetRequested(
    double revenue,
    Duration workTime,
    Emitter<CreateMoodState> emit,
  ) {
    emit(
      state.copyWith(
        moodFormState: state.moodFormState.copyWith(
          revenue: RevenueInput.dirty(value: revenue),
          workTime: WorkTimeInput.dirty(value: workTime),
        ),
      ),
    );
  }
}
