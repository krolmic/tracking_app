part of '../create_mood_screen.dart';

class _CreateMoodStepper extends StatefulWidget {
  const _CreateMoodStepper({
    required this.pages,
    required this.onCompleted,
  });

  final List<Widget> pages;

  final VoidCallback onCompleted;

  @override
  _CreateMoodStepperState createState() => _CreateMoodStepperState();
}

class _CreateMoodStepperState extends State<_CreateMoodStepper> {
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
    return widget.pages.length - 1 == index;
  }

  void onStepNext() {
    if (!_isLast(currentStep)) {
      setState(() {
        currentStep++;
      });
      FocusScope.of(context).unfocus();
      switchToPage(currentStep);
    } else {
      widget.onCompleted();
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
    final translations = AppLocalizations.of(context)!;

    final content = Expanded(
      child: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: widget.pages,
      ),
    );

    final counter = Text(
      '${translations.step.toUpperCase()} ${currentStep + 1} '
      '${translations.ofStep.toUpperCase()} ${widget.pages.length}',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    return Column(
      children: [
        content,
        BlocBuilder<CreateMoodBloc, CreateMoodState>(
          buildWhen: (previousState, currentState) =>
              previousState.formStatus != currentState.formStatus,
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed:
                      _isFirst(currentStep) || state.formStatus.isInProgress
                          ? null
                          : onStepBack,
                  child: Text(
                    translations.previousStep.toUpperCase(),
                    style: TextStyle(
                      color:
                          _isFirst(currentStep) || state.formStatus.isInProgress
                              ? lightGrey
                              : blue,
                    ),
                  ),
                ),
                counter,
                TextButton(
                  onPressed: onStepNext,
                  child: state.formStatus.isInProgress
                      ? const TinyLoadingIndicator()
                      : Text(
                          _isLast(currentStep)
                              ? translations.done.toUpperCase()
                              : translations.nextStep.toUpperCase(),
                          style: const TextStyle(
                            color: primarySwatch,
                          ),
                        ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _CreateMoodStepperPage extends StatelessWidget {
  const _CreateMoodStepperPage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: viewPaddingHorizontal,
      ),
      child: child,
    );
  }
}
