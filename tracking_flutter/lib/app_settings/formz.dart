import 'package:formz/formz.dart';
import 'package:tracking_app/shared/formz.dart';

class AppSettingsFormzState with FormzMixin {
  const AppSettingsFormzState({
    this.revenue = const RevenueInput.pure(),
    this.workTime = const WorkTimeInput.pure(),
    this.currency = const CurrencyInput.pure(),
  });

  final RevenueInput revenue;
  final WorkTimeInput workTime;
  final CurrencyInput currency;

  AppSettingsFormzState copyWith({
    RevenueInput? revenue,
    WorkTimeInput? workTime,
    CurrencyInput? currency,
  }) {
    return AppSettingsFormzState(
      revenue: revenue ?? this.revenue,
      workTime: workTime ?? this.workTime,
      currency: currency ?? this.currency,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs =>
      [revenue, workTime, currency];
}

enum CurrencyInputError {
  invalid,
}

class CurrencyInput extends FormzInput<String, CurrencyInputError> {
  const CurrencyInput.pure() : super.pure('');
  const CurrencyInput.dirty({String value = ''}) : super.dirty(value);

  @override
  CurrencyInputError? validator(String value) {
    return value.isNotEmpty ? null : CurrencyInputError.invalid;
  }
}
