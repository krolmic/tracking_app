part of '../create_mood_screen.dart';

/// [_CreateMoodFormState] builds a form including the fields that follow.
///
/// - today's mood estimation
///   (awaits integer value in the range 1-10, input for [Mood.value])
///
/// - 3 fields for things I am greatful about
///   (await string values, input for [Mood.thingsIAmGratefulAbout])
///
/// - diary
///   (awaits string value, input for [Mood.diary])
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

  Color _sliderColor = moodValueColor3;

  void _onMoodValueChanged(double value) {
    setState(() {
      _formState = _formState.copyWith(
        moodValue: MoodValueInput.dirty(
          value: value.toInt(),
        ),
      );
      _sliderColor = moodValueColor(value.toInt());
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
        const SnackBar(
          content: Text('Mood tracked successfully! 🎉'),
          duration: Duration(seconds: 6),
        ),
      );
  }

  void _showErrorMessage() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('Something went wrong... 🚨'),
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
      listener: (context, state) {
        if (state.isSuccess) {
          _showSuccessMessage();

          _resetForm();

          context.go('/home');
        } else if (state.isFailure) {
          _showErrorMessage();
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How are you feeling today?',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: verticalPaddingSmall,
              ),
              Text(
                'Estimate your mood on a scale from 1 to 10.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: verticalPaddingMedium,
              ),
              Slider(
                autofocus: true,
                value: _formState.moodValue.value.toDouble(),
                min: MoodValueInput.minValue.toDouble(),
                max: MoodValueInput.maxValue.toDouble(),
                divisions: MoodValueInput.maxValue - 1,
                label: _formState.moodValue.value.toString(),
                onChanged: _onMoodValueChanged,
                thumbColor: _sliderColor,
                activeColor: _sliderColor,
              ),
              const SizedBox(
                height: verticalPaddingLarge,
              ),
              Text(
                'What are you greatful for today?',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: verticalPaddingSmall,
              ),
              Text(
                'Write down 3 things you are most greatful for today.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: verticalPaddingMedium,
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
              const SizedBox(
                height: verticalPaddingLarge,
              ),
              const SizedBox(
                height: verticalPaddingLarge,
              ),
              Text(
                'What is on your mind?',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: verticalPaddingSmall,
              ),
              Text(
                'Here is a space for writing down your thoughts.',
                style: Theme.of(context).textTheme.bodySmall,
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
              const SizedBox(height: 24),
              if (state.isInProgress)
                const LoadingIndicator()
              else
                Hero(
                  tag: 'track-button',
                  child: ElevatedButton.icon(
                    key: const Key('Create mood entry form submit'),
                    onPressed: _onSubmit,
                    icon: const Icon(Icons.add),
                    label: const Text("Track today's mood"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
