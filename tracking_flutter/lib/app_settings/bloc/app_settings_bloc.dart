import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:tracking_app/app_settings/formz.dart';
import 'package:tracking_app/shared/formz.dart';

part 'app_settings_bloc.freezed.dart';
part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettingsBloc({
    required SettingsRepository settingsRepository,
  })  : _settingsRepository = settingsRepository,
        super(const AppSettingsState()) {
    on<AppSettingsEvent>((event, emit) async {
      if (event.isSettingsFormSubmitted) {
        await _onSettingsFormSubmitted(emit);
      } else if (event.isSettingsFormInitialized) {
        _onSettingsFormInitialized(emit);
      } else if (event.isSettingsInitialized) {
        await _onSettingsInitialized(emit);
      } else if (event.isRevenueChanged) {
        _onRevenueChanged(event.revenue, emit);
      } else if (event.isWorkTimeChanged) {
        _onWorkTimeChanged(event.workTime, emit);
      } else if (event.isCurrencyChanged) {
        _onCurrencyChanged(event.currency, emit);
      }
    });
  }

  final SettingsRepository _settingsRepository;

  Future<void> _onSettingsInitialized(Emitter<AppSettingsState> emit) async {
    await _loadAppSettings(emit);
  }

  Future<void> _onSettingsFormSubmitted(Emitter<AppSettingsState> emit) async {
    try {
      emit(
        state.copyWith(formSubmissionStatus: FormzSubmissionStatus.inProgress),
      );

      final formState = state.appSettingsForm.formState;

      await _settingsRepository.saveAppSettings(
        currency: formState.currency.value,
        workTime: formState.workTime.value,
        revenue: formState.revenue.value,
      );

      emit(
        state.copyWith(
          formSubmissionStatus: FormzSubmissionStatus.success,
          appSettingsData: AppSettingsDataState.success(
            currency: formState.currency.value,
            preSetWorkTime: formState.workTime.value,
            preSetRevenue: formState.revenue.value,
          ),
        ),
      );
    } catch (e, stackTrace) {
      Fimber.e(
        'App settings form submission failed',
        ex: e,
        stacktrace: stackTrace,
      );
      emit(
        state.copyWith(
          formSubmissionStatus: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  void _onSettingsFormInitialized(Emitter<AppSettingsState> emit) {
    emit(
      state.copyWith(
        appSettingsForm: AppSettingsFormState.initialized(
          formState: AppSettingsFormzState(
            currency: CurrencyInput.dirty(
              value: state.appSettingsData.currency,
            ),
            revenue: RevenueInput.dirty(
              value: state.appSettingsData.preSetRevenue,
            ),
            workTime: WorkTimeInput.dirty(
              value: state.appSettingsData.preSetWorkTime,
            ),
          ),
        ),
      ),
    );
  }

  void _onCurrencyChanged(String currency, Emitter<AppSettingsState> emit) {
    emit(
      state.copyWith(
        appSettingsForm: AppSettingsFormState.initialized(
          formState: state.appSettingsForm.formState.copyWith(
            currency: CurrencyInput.dirty(value: currency),
          ),
        ),
      ),
    );
  }

  void _onRevenueChanged(String value, Emitter<AppSettingsState> emit) {
    var revenue = value;
    revenue = revenue.isEmpty ? '0' : revenue;

    if (double.tryParse(revenue) == null) return;

    emit(
      state.copyWith(
        appSettingsForm: AppSettingsFormState.initialized(
          formState: state.appSettingsForm.formState.copyWith(
            revenue: RevenueInput.dirty(
              value: double.parse(revenue),
            ),
          ),
        ),
      ),
    );
  }

  void _onWorkTimeChanged(Duration value, Emitter<AppSettingsState> emit) {
    emit(
      state.copyWith(
        appSettingsForm: AppSettingsFormState.initialized(
          formState: state.appSettingsForm.formState.copyWith(
            workTime: WorkTimeInput.dirty(value: value),
          ),
        ),
      ),
    );
  }

  Future<void> _loadAppSettings(Emitter<AppSettingsState> emit) async {
    try {
      emit(
        state.copyWith(
          appSettingsData: const AppSettingsDataState.loading(),
        ),
      );

      final currency = _settingsRepository.readCurrency();
      final preSetWorkTime = _settingsRepository.readPreSetWorkTime();
      final preSetRevenue = _settingsRepository.readPreSetRevenue();

      emit(
        state.copyWith(
          appSettingsData: AppSettingsDataState.success(
            currency: currency,
            preSetWorkTime: preSetWorkTime,
            preSetRevenue: preSetRevenue,
          ),
        ),
      );
    } catch (e, stackTrace) {
      Fimber.e('Failed to load app settings', ex: e, stacktrace: stackTrace);
      emit(state.copyWith(appSettingsData: const AppSettingsDataState.error()));
    }
  }
}
