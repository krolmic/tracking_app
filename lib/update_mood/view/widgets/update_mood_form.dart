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

    await context.read<UpdateMoodCubit>().updateMood(
      widget.mood,
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

  @override
  void initState() {
    super.initState();

    final mood = widget.mood;

    final thingsIAmGratefulAbout = mood.thingsIAmGratefulAbout;
    final thingsIAmGreatfulAboutIsSet =
        thingsIAmGratefulAbout != null && thingsIAmGratefulAbout.isNotEmpty;

    _formState = MoodFormzState(
      moodValue: MoodValueInput.dirty(
        value: mood.value,
      ),
      thingsIAmGreatfulAbout1: ThingsIAmGreatfulAboutInput.dirty(
        value:
            thingsIAmGreatfulAboutIsSet ? mood.thingsIAmGratefulAbout![0] : '',
      ),
      thingsIAmGreatfulAbout2: ThingsIAmGreatfulAboutInput.dirty(
        value: thingsIAmGreatfulAboutIsSet && thingsIAmGratefulAbout.length >= 2
            ? mood.thingsIAmGratefulAbout![1]
            : '',
      ),
      thingsIAmGreatfulAbout3: ThingsIAmGreatfulAboutInput.dirty(
        value: thingsIAmGreatfulAboutIsSet && thingsIAmGratefulAbout.length >= 3
            ? mood.thingsIAmGratefulAbout![2]
            : '',
      ),
      diary: DiaryInput.dirty(
        value: mood.diary ?? '',
      ),
    );

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
    final translations = AppLocalizations.of(context)!;

    return BlocBuilder<DeleteMoodCubit, DeleteMoodState>(
      buildWhen: (previousDeleteMoodState, currentDeleteMoodState) =>
          previousDeleteMoodState != currentDeleteMoodState,
      builder: (context, deleteMoodState) {
        return BlocBuilder<UpdateMoodCubit, FormzSubmissionStatus>(
          buildWhen: (previousUpdateMoodState, currentUpdateMoodState) =>
              previousUpdateMoodState != currentUpdateMoodState,
          builder: (context, state) {
            final stateInProgress =
                state.isInProgress || deleteMoodState.isInProgress;

            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
                        Text(
                          translations.howAreYouFeeling,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: verticalPaddingMedium,
                        ),
                        Text(
                          translations.estimateYourMood,
                          style: Theme.of(context).textTheme.bodyMedium,
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
                          onChanged: stateInProgress
                              ? (value) {
                                  // Do nothing while submitting
                                }
                              : _onMoodValueChanged,
                        ),
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
                        Text(
                          translations.whatAreYouGreatfulFor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: verticalPaddingMedium,
                        ),
                        Text(
                          translations.writeDownThingsYouAreGreatfulFor,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
                        TextFormField(
                          key: const Key(
                            'Update mood form thingIAmGreatfulAbout1 input',
                          ),
                          enabled: !stateInProgress,
                          controller: _thingIAmGreatfulAbout1Controller,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.favorite_rounded),
                            iconColor: Theme.of(context).primaryColor,
                          ),
                          validator: (value) => _formState
                              .thingsIAmGreatfulAbout1
                              .validator(value ?? '')
                              ?.toString(),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          key: const Key(
                            'Update mood form thingIAmGreatfulAbout2 input',
                          ),
                          enabled: !stateInProgress,
                          controller: _thingIAmGreatfulAbout2Controller,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.favorite_rounded),
                            iconColor: Theme.of(context).primaryColor,
                          ),
                          validator: (value) => _formState
                              .thingsIAmGreatfulAbout2
                              .validator(value ?? '')
                              ?.toString(),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          key: const Key(
                            'Update mood form thingIAmGreatfulAbout3 input',
                          ),
                          enabled: !stateInProgress,
                          controller: _thingIAmGreatfulAbout3Controller,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.favorite_rounded),
                            iconColor: Theme.of(context).primaryColor,
                          ),
                          validator: (value) => _formState
                              .thingsIAmGreatfulAbout3
                              .validator(value ?? '')
                              ?.toString(),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
                        const SizedBox(
                          height: verticalPaddingLarge,
                        ),
                        Text(
                          translations.whatIsOnYourMind,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: verticalPaddingSmall,
                        ),
                        Text(
                          translations.whatIsOnYourMindDescription,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextFormField(
                          key: const Key('Update mood form diary input'),
                          enabled: !stateInProgress,
                          controller: _diaryController,
                          validator: (value) => _formState.diary
                              .validator(value ?? '')
                              ?.toString(),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          minLines: 5,
                          maxLines: null,
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: AppElevatedButton(
                    isLoading: stateInProgress,
                    icon: Icons.edit,
                    onPressed: _onSubmit,
                    label: translations.updateMood,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
