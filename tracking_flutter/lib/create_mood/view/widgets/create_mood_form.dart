part of '../create_mood_screen.dart';

class _CreateMoodForm extends StatefulWidget {
  const _CreateMoodForm({
    super.key,
  });

  @override
  State<_CreateMoodForm> createState() => _CreateMoodFormState();
}

class _CreateMoodFormState extends State<_CreateMoodForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _thingIAmGreatfulAbout1Controller;
  late final TextEditingController _thingIAmGreatfulAbout2Controller;
  late final TextEditingController _thingIAmGreatfulAbout3Controller;
  late final TextEditingController _diaryController;
  late final TextEditingController _revenueController;

  void _onMoodValueChanged(double value) {
    context.read<CreateMoodBloc>().add(CreateMoodEvent.moodValueChanged(value));
  }

  void _onThingIAmGreatfulAbout1Changed() {
    context.read<CreateMoodBloc>().add(
          CreateMoodEvent.thingsIAmGratefulFor1Changed(
            _thingIAmGreatfulAbout1Controller.text,
          ),
        );
  }

  void _onThingIAmGreatfulAbout2Changed() {
    context.read<CreateMoodBloc>().add(
          CreateMoodEvent.thingsIAmGratefulFor2Changed(
            _thingIAmGreatfulAbout2Controller.text,
          ),
        );
  }

  void _onThingIAmGreatfulAbout3Changed() {
    context.read<CreateMoodBloc>().add(
          CreateMoodEvent.thingsIAmGratefulFor3Changed(
            _thingIAmGreatfulAbout3Controller.text,
          ),
        );
  }

  void _onDiaryChanged() {
    context.read<CreateMoodBloc>().add(
          CreateMoodEvent.diaryChanged(
            _diaryController.text,
          ),
        );
  }

  void _onRevenueChanged() {
    context.read<CreateMoodBloc>().add(
          CreateMoodEvent.revenueChanged(
            _revenueController.text,
          ),
        );
  }

  void _onWorkTimeChanged(Duration value) {
    context.read<CreateMoodBloc>().add(
          CreateMoodEvent.workTimeChanged(
            value,
          ),
        );
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    context
        .read<CreateMoodBloc>()
        .add(const CreateMoodEvent.creationSubmitted());

    if (!mounted) return;

    setState(() {});

    FocusScope.of(context)
      ..nextFocus()
      ..unfocus();
  }

  @override
  void initState() {
    super.initState();

    final moodFormState = context.read<CreateMoodBloc>().state.moodFormState;

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
    return Form(
      key: _formKey,
      child: _CreateMoodStepper(
        onCompleted: _onSubmit,
        pages: _getStepperPages(),
      ),
    );
  }

  List<Widget> _getStepperPages() {
    final translations = AppLocalizations.of(context)!;

    final createMoodBloc = context.read<CreateMoodBloc>();

    return [
      _CreateMoodStepperPage(
        key: const Key(
          'Create mood stepper page 1',
        ),
        child: Column(
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
            BlocBuilder<CreateMoodBloc, CreateMoodState>(
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
            const VerticalSpacing.large(),
            BlocBuilder<CreateMoodBloc, CreateMoodState>(
              buildWhen: (previousState, currentState) =>
                  previousState.moodFormState.moodValue !=
                  currentState.moodFormState.moodValue,
              builder: (context, state) {
                return _MoodEmoji(
                  moodValue: state.moodFormState.moodValue.value,
                );
              },
            ),
          ],
        ),
      ),
      _CreateMoodStepperPage(
        key: const Key(
          'Create mood stepper page 2',
        ),
        child: Column(
          children: <Widget>[
            const VerticalSpacing.large(),
            Text(
              translations.whatAreYouGreatfulFor,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const VerticalSpacing.medium(),
            Text(
              translations.writeDownThingsYouAreGreatfulFor,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const VerticalSpacing.large(),
            TextFormField(
              key: const Key('Create mood form thingIAmGreatfulAbout1 input'),
              controller: _thingIAmGreatfulAbout1Controller,
              decoration: InputDecoration(
                icon: const Icon(Iconsax.heart_add_outline),
                iconColor: Theme.of(context).primaryColor,
              ),
              validator: (value) => createMoodBloc
                  .state.moodFormState.thingsIAmGreatfulAbout1
                  .validator(value ?? '')
                  ?.toString(),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            const VerticalSpacing.medium(),
            TextFormField(
              key: const Key('Create mood form thingIAmGreatfulAbout2 input'),
              controller: _thingIAmGreatfulAbout2Controller,
              decoration: InputDecoration(
                icon: const Icon(Iconsax.heart_add_outline),
                iconColor: Theme.of(context).primaryColor,
              ),
              validator: (value) => createMoodBloc
                  .state.moodFormState.thingsIAmGreatfulAbout2
                  .validator(value ?? '')
                  ?.toString(),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            const VerticalSpacing.medium(),
            TextFormField(
              key: const Key('Create mood form thingIAmGreatfulAbout3 input'),
              controller: _thingIAmGreatfulAbout3Controller,
              decoration: InputDecoration(
                icon: const Icon(Iconsax.heart_add_outline),
                iconColor: Theme.of(context).primaryColor,
              ),
              validator: (value) => createMoodBloc
                  .state.moodFormState.thingsIAmGreatfulAbout3
                  .validator(value ?? '')
                  ?.toString(),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
          ],
        ),
      ),
      _CreateMoodStepperPage(
        key: const Key(
          'Create mood stepper page 3',
        ),
        child: Column(
          children: <Widget>[
            const VerticalSpacing.large(),
            Text(
              translations.whatIsOnYourMind,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const VerticalSpacing.medium(),
            Text(
              translations.whatIsOnYourMindDescription,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const VerticalSpacing.large(),
            TextFormField(
              key: const Key('Create mood form diary input'),
              controller: _diaryController,
              validator: (value) => createMoodBloc.state.moodFormState.diary
                  .validator(value ?? '')
                  ?.toString(),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              minLines: 5,
              maxLines: null,
            ),
          ],
        ),
      ),
      _CreateMoodStepperPage(
        key: const Key(
          'Create mood stepper page 4',
        ),
        child: Column(
          children: <Widget>[
            const VerticalSpacing.large(),
            Text(
              translations.howMuchDidYouEarn,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const VerticalSpacing.medium(),
            Text(
              translations.howMuchDidYouEarnDescription,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const VerticalSpacing.large(),
            BlocBuilder<AppSettingsBloc, AppSettingsState>(
              buildWhen: (previous, current) =>
                  previous.appSettingsData.currency !=
                  current.appSettingsData.currency,
              builder: (context, state) {
                final currency = state.appSettingsData.currency;

                return TextFormField(
                  key: const Key('Create mood form revenue input'),
                  controller: _revenueController,
                  validator: (value) => createMoodBloc
                      .state.moodFormState.revenue
                      .validator(
                        value != null && value != '' ? double.parse(value) : 0,
                      )
                      ?.toString(),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                  ],
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: '0.0',
                    helperText: translations.revenueHelper(currency),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      _CreateMoodStepperPage(
        key: const Key(
          'Create mood stepper page 5',
        ),
        child: Column(
          children: <Widget>[
            const VerticalSpacing.large(),
            Text(
              translations.howLongDidYouWork,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const VerticalSpacing.large(),
            BlocBuilder<CreateMoodBloc, CreateMoodState>(
              buildWhen: (previousState, currentState) =>
                  previousState.moodFormState.workTime !=
                  currentState.moodFormState.workTime,
              builder: (context, state) {
                return DurationPicker(
                  key: const Key('Create mood form workTime input'),
                  duration: state.moodFormState.workTime.value,
                  upperBound: const Duration(hours: 24),
                  onChange: _onWorkTimeChanged,
                );
              },
            ),
          ],
        ),
      ),
    ];
  }
}

class _MoodEmoji extends StatelessWidget {
  const _MoodEmoji({
    required this.moodValue,
  });

  final int moodValue;

  static const double emojiSize = 128;
  static const int animatedOpacityDurationInMs = 500;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: animatedOpacityDurationInMs),
          opacity: moodValue < 4 ? 1 : 0,
          child: const AnimatedEmoji(
            AnimatedEmojis.sad,
            size: emojiSize,
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: animatedOpacityDurationInMs),
          opacity: moodValue >= 4 && moodValue < 6 ? 1 : 0,
          child: const AnimatedEmoji(
            AnimatedEmojis.neutralFace,
            size: emojiSize,
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: animatedOpacityDurationInMs),
          opacity: moodValue >= 6 && moodValue < 9 ? 1 : 0,
          child: const AnimatedEmoji(
            AnimatedEmojis.warmSmile,
            size: emojiSize,
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: animatedOpacityDurationInMs),
          opacity: moodValue >= 9 ? 1 : 0,
          child: const AnimatedEmoji(
            AnimatedEmojis.sunglassesFace,
            size: emojiSize,
          ),
        ),
      ],
    );
  }
}
