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
    final translations = AppLocalizations.of(context)!;

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
          child: state.isInProgress
              ? const LoadingIndicator()
              : CustomCoolStepper(
                  showErrorSnackbar: true,
                  onCompleted: _onSubmit,
                  steps: _getSteps(),
                  config: CoolStepperConfig(
                    iconColor: Colors.blue,
                    isHeaderEnabled: false,
                    backText: translations.previousStep.toUpperCase(),
                    nextText: translations.nextStep.toUpperCase(),
                    stepText: translations.step.toUpperCase(),
                    ofText: translations.ofStep.toUpperCase(),
                    finalText: translations.done.toUpperCase(),
                  ),
                ),
        );
      },
    );
  }

  List<CoolStep> _getSteps() {
    final translations = AppLocalizations.of(context)!;

    return [
      CoolStep(
        title: '',
        subtitle: '',
        content: Column(
          children: [
            const SizedBox(
              height: verticalPaddingLarge,
            ),
            Text(
              translations.howAreYouFeelingToday,
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
            _CreateMoodFormEmoji(
              moodValue: _formState.moodValue.value,
            ),
          ],
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: '',
        subtitle: '',
        content: Column(
          children: <Widget>[
            const SizedBox(
              height: verticalPaddingLarge,
            ),
            Text(
              translations.whatAreYouGreatfulForToday,
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
        validation: () {
          var validationResult = '';
          final validationResult1 = _formState.thingsIAmGreatfulAbout1
              .validator(_formState.thingsIAmGreatfulAbout1.value)
              ?.toString();
          final validationResult2 = _formState.thingsIAmGreatfulAbout1
              .validator(_formState.thingsIAmGreatfulAbout1.value)
              ?.toString();
          final validationResult3 = _formState.thingsIAmGreatfulAbout1
              .validator(_formState.thingsIAmGreatfulAbout1.value)
              ?.toString();

          if (validationResult1 != null) {
            validationResult += '$validationResult1\n';
          }

          if (validationResult2 != null) {
            validationResult += '$validationResult2\n';
          }

          if (validationResult3 != null) {
            validationResult += '$validationResult3\n';
          }

          if (validationResult.isNotEmpty) {
            return validationResult;
          }

          return null;
        },
      ),
      CoolStep(
        title: '',
        subtitle: '',
        content: Column(
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
        validation: () {
          return null;
        },
      ),
    ];
  }
}

class _CreateMoodFormEmoji extends StatelessWidget {
  const _CreateMoodFormEmoji({
    required this.moodValue,
  });

  final int moodValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: moodValue < 4 ? 1 : 0,
          child: const AnimatedEmoji(
            AnimatedEmojis.sad,
            size: 128,
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: moodValue >= 4 && moodValue < 6 ? 1 : 0,
          child: const AnimatedEmoji(
            AnimatedEmojis.neutralFace,
            size: 128,
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: moodValue >= 6 && moodValue < 9 ? 1 : 0,
          child: const AnimatedEmoji(
            AnimatedEmojis.warmSmile,
            size: 128,
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: moodValue >= 9 ? 1 : 0,
          child: const AnimatedEmoji(
            AnimatedEmojis.sunglassesFace,
            size: 128,
          ),
        ),
      ],
    );
  }
}

class CustomCoolStepper extends StatefulWidget {
  const CustomCoolStepper({
    required this.steps,
    required this.onCompleted,
    super.key,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    this.config = const CoolStepperConfig(),
    this.showErrorSnackbar = false,
  });

  final List<CoolStep> steps;

  final VoidCallback onCompleted;

  final EdgeInsetsGeometry contentPadding;

  final CoolStepperConfig config;

  final bool showErrorSnackbar;

  @override
  CustomCoolStepperState createState() => CustomCoolStepperState();
}

class CustomCoolStepperState extends State<CustomCoolStepper> {
  PageController? _controller = PageController();

  int currentStep = 0;

  @override
  void dispose() {
    _controller!.dispose();
    _controller = null;
    super.dispose();
  }

  Future<void>? switchToPage(int page) {
    _controller!.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );

    return null;
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return widget.steps.length - 1 == index;
  }

  void onStepNext() {
    final validation = widget.steps[currentStep].validation!();

    if (validation == null) {
      if (!_isLast(currentStep)) {
        setState(() {
          currentStep++;
        });
        FocusScope.of(context).unfocus();
        switchToPage(currentStep);
      } else {
        widget.onCompleted();
      }
    } else {
      if (widget.showErrorSnackbar) {
        Flushbar<dynamic>(
          message: validation,
          margin: const EdgeInsets.all(8),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          icon: Icon(
            Icons.info_outline,
            size: 28,
            color: Theme.of(context).primaryColor,
          ),
          duration: const Duration(seconds: 2),
          leftBarIndicatorColor: Theme.of(context).primaryColor,
        ).show(context);
      }
    }
  }

  void onStepBack() {
    if (!_isFirst(currentStep)) {
      setState(() {
        currentStep--;
      });
      switchToPage(currentStep);
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = Expanded(
      child: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: widget.steps.map((step) {
          return CoolStepperView(
            step: step,
            contentPadding: widget.contentPadding,
            config: widget.config,
          );
        }).toList(),
      ),
    );

    final counter = Text(
      "${widget.config.stepText ?? 'STEP'} ${currentStep + 1} "
      "${widget.config.ofText ?? 'OF'} ${widget.steps.length}",
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    String getNextLabel() {
      String nextLabel;
      if (_isLast(currentStep)) {
        nextLabel = widget.config.finalText ?? 'FINISH';
      } else {
        if (widget.config.nextTextList != null) {
          nextLabel = widget.config.nextTextList![currentStep];
        } else {
          nextLabel = widget.config.nextText ?? 'NEXT';
        }
      }
      return nextLabel;
    }

    String getPrevLabel() {
      String backLabel;
      if (_isFirst(currentStep)) {
        backLabel = '';
      } else {
        if (widget.config.backTextList != null) {
          backLabel = widget.config.backTextList![currentStep - 1];
        } else {
          backLabel = widget.config.backText ?? 'PREV';
        }
      }
      return backLabel;
    }

    final buttons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: onStepBack,
          child: Text(
            getPrevLabel(),
            style: TextStyle(color: primarySwatch.shade300),
          ),
        ),
        counter,
        TextButton(
          onPressed: onStepNext,
          child: Text(
            getNextLabel(),
            style: const TextStyle(
              color: primarySwatch,
            ),
          ),
        ),
      ],
    );

    return Column(
      children: [content, buttons],
    );
  }
}
