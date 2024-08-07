part of '../app_settings_screen.dart';

class _AppSettingsForm extends StatefulWidget {
  @override
  State<_AppSettingsForm> createState() => _AppSettingsFormState();
}

class _AppSettingsFormState extends State<_AppSettingsForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _revenueController;

  @override
  void initState() {
    super.initState();

    final formState =
        context.read<AppSettingsBloc>().state.appSettingsForm.formState;

    _revenueController = TextEditingController(
      text: formState.revenue.value != 0
          ? formState.revenue.value.toFormattedString()
          : '',
    )..addListener(_onRevenueChanged);
  }

  @override
  void dispose() {
    _revenueController.dispose();
    super.dispose();
  }

  void _onRevenueChanged() {
    context.read<AppSettingsBloc>().add(
          AppSettingsEvent.revenueChanged(
            _revenueController.text,
          ),
        );
  }

  void _onWorkTimeChanged(Duration value) {
    context.read<AppSettingsBloc>().add(
          AppSettingsEvent.workTimeChanged(
            value,
          ),
        );
  }

  void _onCurrencyChanged(String? value) {
    if (value != null) {
      context.read<AppSettingsBloc>().add(
            AppSettingsEvent.currencyChanged(
              value,
            ),
          );
    }
  }

  void _onFormSubmitted() {
    if (_formKey.currentState!.validate()) {
      context.read<AppSettingsBloc>().add(
            const AppSettingsEvent.settingsFromSubmitted(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              translations.currency,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const VerticalSpacing.small(),
            BlocBuilder<AppSettingsBloc, AppSettingsState>(
              buildWhen: (previousState, currentState) =>
                  previousState.appSettingsForm.formState.currency !=
                  currentState.appSettingsForm.formState.currency,
              builder: (context, state) {
                return DropdownButtonFormField<String>(
                  icon: const Icon(Iconsax.arrow_down_1_outline, size: 18),
                  iconEnabledColor: Theme.of(context).primaryColor,
                  menuMaxHeight: 300,
                  focusColor: Colors.transparent,
                  focusNode: FocusNode(canRequestFocus: false),
                  style: Theme.of(context).textTheme.bodyMedium,
                  value: state.appSettingsForm.formState.currency.value,
                  dropdownColor: Colors.white,
                  elevation: 4,
                  items:
                      currenciesCodesAndSymbols.keys.toList().map((currency) {
                    return DropdownMenuItem(
                      value: currency,
                      alignment: Alignment.center,
                      child: Text(currency),
                    );
                  }).toList(),
                  onChanged: _onCurrencyChanged,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Text(
                translations.currencySettingDescription,
                style: Theme.of(context).inputDecorationTheme.helperStyle,
              ),
            ),
            const VerticalSpacing.large(),
            Text(
              translations.presetRevenue,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const VerticalSpacing.small(),
            TextFormField(
              key: const Key('App settings form revenue input'),
              controller: _revenueController,
              decoration: InputDecoration(
                hintText: '0.0',
                helperText: translations.presetRevenueDescription,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
              ],
              textInputAction: TextInputAction.next,
            ),
            const VerticalSpacing.large(),
            Text(
              translations.presetWorkTime,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const VerticalSpacing.small(),
            BlocBuilder<AppSettingsBloc, AppSettingsState>(
              buildWhen: (previousState, currentState) =>
                  previousState.appSettingsForm.formState.workTime !=
                  currentState.appSettingsForm.formState.workTime,
              builder: (context, state) {
                final workTime = state.appSettingsForm.formState.workTime.value;

                return TimeInput(
                  time: workTime,
                  onChange: _onWorkTimeChanged,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Text(
                translations.presetWorkTimeDescription,
                style: Theme.of(context).inputDecorationTheme.helperStyle,
              ),
            ),
            const VerticalSpacing.extraLarge(),
            BlocBuilder<AppSettingsBloc, AppSettingsState>(
              buildWhen: (previousState, currentState) =>
                  previousState.formSubmissionStatus !=
                  currentState.formSubmissionStatus,
              builder: (context, state) {
                return AppElevatedButton(
                  isLoading: state.formSubmissionStatus.isInProgress,
                  icon: Iconsax.edit_2_bold,
                  onPressed: _onFormSubmitted,
                  label: translations.update,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
