part of '../update_mood_screen.dart';

class _UpdateMoodForm extends StatefulWidget {
  const _UpdateMoodForm({
    required this.mood,
    super.key,
  });

  final Mood mood;

  @override
  State<_UpdateMoodForm> createState() => _UpdateMoodFormState();
}

class _UpdateMoodFormState extends State<_UpdateMoodForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _thingIAmGreatfulAbout1Controller;
  late final TextEditingController _thingIAmGreatfulAbout2Controller;
  late final TextEditingController _thingIAmGreatfulAbout3Controller;
  late final TextEditingController _diaryController;
  late final TextEditingController _revenueController;

  void _onMoodValueChanged(double value) {
    context.read<UpdateMoodBloc>().add(UpdateMoodEvent.moodValueChanged(value));
  }

  void _onThingIAmGreatfulAbout1Changed() {
    context.read<UpdateMoodBloc>().add(
          UpdateMoodEvent.thingsIAmGratefulFor1Changed(
            _thingIAmGreatfulAbout1Controller.text,
          ),
        );
  }

  void _onThingIAmGreatfulAbout2Changed() {
    context.read<UpdateMoodBloc>().add(
          UpdateMoodEvent.thingsIAmGratefulFor2Changed(
            _thingIAmGreatfulAbout2Controller.text,
          ),
        );
  }

  void _onThingIAmGreatfulAbout3Changed() {
    context.read<UpdateMoodBloc>().add(
          UpdateMoodEvent.thingsIAmGratefulFor3Changed(
            _thingIAmGreatfulAbout3Controller.text,
          ),
        );
  }

  void _onDiaryChanged() {
    context.read<UpdateMoodBloc>().add(
          UpdateMoodEvent.diaryChanged(
            _diaryController.text,
          ),
        );
  }

  void _onRevenueChanged() {
    context.read<UpdateMoodBloc>().add(
          UpdateMoodEvent.revenueChanged(
            _revenueController.text,
          ),
        );
  }

  void _onWorkTimeChanged(Duration value) {
    context.read<UpdateMoodBloc>().add(
          UpdateMoodEvent.workTimeChanged(
            value,
          ),
        );
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    context
        .read<UpdateMoodBloc>()
        .add(UpdateMoodEvent.updateSubmitted(widget.mood));

    if (!mounted) return;

    setState(() {});

    FocusScope.of(context)
      ..nextFocus()
      ..unfocus();
  }

  @override
  void initState() {
    super.initState();

    final moodFormState = context.read<UpdateMoodBloc>().state.moodFormState;

    _thingIAmGreatfulAbout1Controller = TextEditingController(
      text: moodFormState.thingsIAmGreatfulAbout1.value,
    )..addListener(_onThingIAmGreatfulAbout1Changed);

    _thingIAmGreatfulAbout2Controller = TextEditingController(
      text: moodFormState.thingsIAmGreatfulAbout2.value,
    )..addListener(_onThingIAmGreatfulAbout2Changed);

    _thingIAmGreatfulAbout3Controller = TextEditingController(
      text: moodFormState.thingsIAmGreatfulAbout3.value,
    )..addListener(_onThingIAmGreatfulAbout3Changed);

    _diaryController = TextEditingController(
      text: moodFormState.diary.value,
    )..addListener(_onDiaryChanged);

    _revenueController = TextEditingController(
      text: moodFormState.revenue.value != 0
          ? moodFormState.revenue.value.toString()
          : '',
    )..addListener(_onRevenueChanged);
  }

  @override
  void dispose() {
    _thingIAmGreatfulAbout1Controller.dispose();
    _thingIAmGreatfulAbout2Controller.dispose();
    _thingIAmGreatfulAbout3Controller.dispose();
    _diaryController.dispose();
    _revenueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    final updateMoodBloc = context.read<UpdateMoodBloc>();

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacing.large(),
                Text(
                  translations.howAreYouFeeling,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const VerticalSpacing.medium(),
                Text(
                  translations.estimateYourMood,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const VerticalSpacing.large(),
                BlocBuilder<UpdateMoodBloc, UpdateMoodState>(
                  buildWhen: (previousState, currentState) =>
                      previousState.moodFormState.moodValue !=
                      currentState.moodFormState.moodValue,
                  builder: (context, state) {
                    return Slider(
                      autofocus: true,
                      value: state.moodFormState.moodValue.value.toDouble(),
                      min: MoodValueInput.minValue.toDouble(),
                      max: MoodValueInput.maxValue.toDouble(),
                      divisions: MoodValueInput.maxValue - 1,
                      label: state.moodFormState.moodValue.value.toString(),
                      onChanged: _onMoodValueChanged,
                      activeColor: blue,
                      inactiveColor: lightBlue,
                    );
                  },
                ),
                const VerticalSpacing.extraLarge(),
                Text(
                  translations.whatAreYouGreatfulFor,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const VerticalSpacing.medium(),
                Text(
                  translations.writeDownThingsYouAreGreatfulFor,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const VerticalSpacing.large(),
                TextFormField(
                  key: const Key(
                    'Update mood form thingIAmGreatfulAbout1 input',
                  ),
                  controller: _thingIAmGreatfulAbout1Controller,
                  decoration: InputDecoration(
                    icon: const Icon(Iconsax.heart_edit_outline),
                    iconColor: Theme.of(context).primaryColor,
                  ),
                  validator: (value) => updateMoodBloc
                      .state.moodFormState.thingsIAmGreatfulAbout1
                      .validator(value ?? '')
                      ?.toString(),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const VerticalSpacing.medium(),
                TextFormField(
                  key: const Key(
                    'Update mood form thingIAmGreatfulAbout2 input',
                  ),
                  controller: _thingIAmGreatfulAbout2Controller,
                  decoration: InputDecoration(
                    icon: const Icon(Iconsax.heart_edit_outline),
                    iconColor: Theme.of(context).primaryColor,
                  ),
                  validator: (value) => updateMoodBloc
                      .state.moodFormState.thingsIAmGreatfulAbout2
                      .validator(value ?? '')
                      ?.toString(),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const VerticalSpacing.medium(),
                TextFormField(
                  key: const Key(
                    'Update mood form thingIAmGreatfulAbout3 input',
                  ),
                  controller: _thingIAmGreatfulAbout3Controller,
                  decoration: InputDecoration(
                    icon: const Icon(Iconsax.heart_edit_outline),
                    iconColor: Theme.of(context).primaryColor,
                  ),
                  validator: (value) => updateMoodBloc
                      .state.moodFormState.thingsIAmGreatfulAbout3
                      .validator(value ?? '')
                      ?.toString(),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const VerticalSpacing.extraLarge(),
                Text(
                  translations.whatIsOnYourMind,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const VerticalSpacing.medium(),
                Text(
                  translations.whatIsOnYourMindDescription,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const VerticalSpacing.large(),
                TextFormField(
                  key: const Key('Update mood form diary input'),
                  controller: _diaryController,
                  validator: (value) => updateMoodBloc.state.moodFormState.diary
                      .validator(value ?? '')
                      ?.toString(),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  minLines: 5,
                  maxLines: null,
                ),
                const VerticalSpacing.extraLarge(),
                Text(
                  translations.howMuchDidYouEarn,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const VerticalSpacing.medium(),
                Text(
                  translations.howMuchDidYouEarnDescription,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const VerticalSpacing.large(),
                TextFormField(
                  key: const Key('Update mood form revenue input'),
                  controller: _revenueController,
                  decoration: const InputDecoration(
                    hintText: '0.0',
                    helperText: 'Revenue in your currency',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                  ],
                  textInputAction: TextInputAction.next,
                ),
                const VerticalSpacing.extraLarge(),
                Text(
                  translations.howLongDidYouWork,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const VerticalSpacing.large(),
                BlocBuilder<UpdateMoodBloc, UpdateMoodState>(
                  buildWhen: (previousState, currentState) =>
                      previousState.moodFormState.workTime !=
                      currentState.moodFormState.workTime,
                  builder: (context, state) {
                    final workTime = state.moodFormState.workTime.value;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          workTime.toFormattedString(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        IconButton(
                          onPressed: () async {
                            final updatedWorkTime = await showDurationPicker(
                              context: context,
                              initialTime: workTime,
                              upperBound: const Duration(hours: 24),
                            );

                            if (updatedWorkTime != null) {
                              _onWorkTimeChanged(updatedWorkTime);
                            }
                          },
                          icon: Icon(
                            Iconsax.edit_2_outline,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: BlocBuilder<UpdateMoodBloc, UpdateMoodState>(
            buildWhen: (previousState, currentState) =>
                previousState.formStatus != currentState.formStatus,
            builder: (context, state) {
              return AppElevatedButton(
                isLoading: state.formStatus.isInProgress,
                icon: Iconsax.edit_2_bold,
                onPressed: _onSubmit,
                label: translations.updateMood,
              );
            },
          ),
        ),
      ],
    );
  }
}
