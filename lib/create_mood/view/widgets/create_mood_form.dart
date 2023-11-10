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

  late MoodFormzState _formState;

  late final TextEditingController _thingIAmGreatfulAbout1Controller;
  late final TextEditingController _thingIAmGreatfulAbout2Controller;
  late final TextEditingController _thingIAmGreatfulAbout3Controller;
  late final TextEditingController _diaryController;

  void _onMoodValueChanged(double value) {
    setState(() {
      _formState = _formState.copyWith(
        moodValue: MoodValueInput.dirty(
          value: value.toInt(),
        ),
      );
    });
  }

  void _onThingIAmGreatfulAbout1Changed() {
    setState(() {
      _formState = _formState.copyWith(
        thingsIAmGreatfulAbout1: ThingsIAmGreatfulAboutInput.dirty(
          value: _thingIAmGreatfulAbout1Controller.text,
        ),
      );
    });
  }

  void _onThingIAmGreatfulAbout2Changed() {
    setState(() {
      _formState = _formState.copyWith(
        thingsIAmGreatfulAbout2: ThingsIAmGreatfulAboutInput.dirty(
          value: _thingIAmGreatfulAbout2Controller.text,
        ),
      );
    });
  }

  void _onThingIAmGreatfulAbout3Changed() {
    setState(() {
      _formState = _formState.copyWith(
        thingsIAmGreatfulAbout3: ThingsIAmGreatfulAboutInput.dirty(
          value: _thingIAmGreatfulAbout3Controller.text,
        ),
      );
    });
  }

  void _onDiaryChanged() {
    setState(() {
      _formState = _formState.copyWith(
        diary: DiaryInput.dirty(
          value: _diaryController.text,
        ),
      );
    });
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    await context.read<CreateMoodCubit>().createMood(
      value: _formState.moodValue.value,
      diary: _formState.diary.value,
      thingsIAmGratefulAbout: [
        if (_formState.thingsIAmGreatfulAbout1.value.isNotEmpty)
          _formState.thingsIAmGreatfulAbout1.value,
        if (_formState.thingsIAmGreatfulAbout2.value.isNotEmpty)
          _formState.thingsIAmGreatfulAbout2.value,
        if (_formState.thingsIAmGreatfulAbout3.value.isNotEmpty)
          _formState.thingsIAmGreatfulAbout3.value,
      ],
    );

    if (!mounted) return;

    setState(() {});

    FocusScope.of(context)
      ..nextFocus()
      ..unfocus();
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _thingIAmGreatfulAbout1Controller.clear();
    _thingIAmGreatfulAbout2Controller.clear();
    _thingIAmGreatfulAbout3Controller.clear();
    _diaryController.clear();
    setState(() => _formState = MoodFormzState());
  }

  @override
  void initState() {
    super.initState();

    _formState = MoodFormzState();

    _thingIAmGreatfulAbout1Controller = TextEditingController(
      text: _formState.thingsIAmGreatfulAbout1.value,
    )..addListener(_onThingIAmGreatfulAbout1Changed);

    _thingIAmGreatfulAbout2Controller = TextEditingController(
      text: _formState.thingsIAmGreatfulAbout2.value,
    )..addListener(_onThingIAmGreatfulAbout2Changed);

    _thingIAmGreatfulAbout3Controller = TextEditingController(
      text: _formState.thingsIAmGreatfulAbout3.value,
    )..addListener(_onThingIAmGreatfulAbout3Changed);

    _diaryController = TextEditingController(
      text: _formState.diary.value,
    )..addListener(_onDiaryChanged);
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            '${AppLocalizations.of(context)!.moodTrackedSuccessfully} 🎉',
          ),
          duration: const Duration(seconds: 6),
        ),
      );
  }

  void _showErrorMessage() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            '${AppLocalizations.of(context)!.somethingWentWrong} 🚨',
          ),
        ),
      );
  }

  @override
  void dispose() {
    _thingIAmGreatfulAbout1Controller.dispose();
    _thingIAmGreatfulAbout2Controller.dispose();
    _thingIAmGreatfulAbout3Controller.dispose();
    _diaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateMoodCubit, FormzSubmissionStatus>(
      listenWhen: (previousState, currentState) =>
          previousState != currentState,
      listener: (context, state) {
        if (state.isSuccess) {
          _showSuccessMessage();

          _resetForm();

          context.go('/home');
        } else if (state.isFailure) {
          _showErrorMessage();
        }
      },
      buildWhen: (previousState, currentState) => previousState != currentState,
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: state.isInProgress
              ? const LoadingIndicator()
              : _CreateMoodStepper(
                  onCompleted: _onSubmit,
                  pages: _getStepperPages(),
                ),
        );
      },
    );
  }

  List<Widget> _getStepperPages() {
    final translations = AppLocalizations.of(context)!;

    return [
      _CreateMoodStepperPage(
        key: const Key(
          'Create mood stepper page 1',
        ),
        child: Column(
          children: [
            const SizedBox(
              height: verticalPaddingLarge,
            ),
            Text(
              translations.howAreYouFeeling,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: verticalPaddingMedium,
            ),
            Text(
              translations.estimateYourMood,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: verticalPaddingLarge,
            ),
            Slider(
              autofocus: true,
              value: _formState.moodValue.value.toDouble(),
              min: MoodValueInput.minValue.toDouble(),
              max: MoodValueInput.maxValue.toDouble(),
              divisions: MoodValueInput.maxValue - 1,
              label: _formState.moodValue.value.toString(),
              onChanged: _onMoodValueChanged,
            ),
            const SizedBox(
              height: verticalPaddingLarge,
            ),
            _MoodEmoji(
              moodValue: _formState.moodValue.value,
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
            const SizedBox(
              height: verticalPaddingLarge,
            ),
            Text(
              translations.whatAreYouGreatfulFor,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: verticalPaddingMedium,
            ),
            Text(
              translations.writeDownThingsYouAreGreatfulFor,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: verticalPaddingLarge,
            ),
            TextFormField(
              key: const Key('Create mood form thingIAmGreatfulAbout1 input'),
              controller: _thingIAmGreatfulAbout1Controller,
              decoration: InputDecoration(
                icon: const Icon(Icons.favorite_rounded),
                iconColor: Theme.of(context).primaryColor,
              ),
              validator: (value) => _formState.thingsIAmGreatfulAbout1
                  .validator(value ?? '')
                  ?.toString(),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              key: const Key('Create mood form thingIAmGreatfulAbout2 input'),
              controller: _thingIAmGreatfulAbout2Controller,
              decoration: InputDecoration(
                icon: const Icon(Icons.favorite_rounded),
                iconColor: Theme.of(context).primaryColor,
              ),
              validator: (value) => _formState.thingsIAmGreatfulAbout2
                  .validator(value ?? '')
                  ?.toString(),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              key: const Key('Create mood form thingIAmGreatfulAbout3 input'),
              controller: _thingIAmGreatfulAbout3Controller,
              decoration: InputDecoration(
                icon: const Icon(Icons.favorite_rounded),
                iconColor: Theme.of(context).primaryColor,
              ),
              validator: (value) => _formState.thingsIAmGreatfulAbout3
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
            const SizedBox(
              height: verticalPaddingLarge,
            ),
            Text(
              translations.whatIsOnYourMind,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: verticalPaddingMedium,
            ),
            Text(
              translations.whatIsOnYourMindDescription,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: verticalPaddingLarge,
            ),
            TextFormField(
              key: const Key('Create mood form diary input'),
              controller: _diaryController,
              validator: (value) =>
                  _formState.diary.validator(value ?? '')?.toString(),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              minLines: 5,
              maxLines: null,
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
