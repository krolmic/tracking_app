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

    final buttons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: onStepBack,
          child: Text(
            translations.previousStep.toUpperCase(),
            style: TextStyle(
              color: primarySwatch.shade300,
            ),
          ),
        ),
        counter,
        TextButton(
          onPressed: onStepNext,
          child: Text(
            translations.nextStep.toUpperCase(),
            style: const TextStyle(
              color: primarySwatch,
            ),
          ),
        ),
      ],
    );

    return Column(
      children: [
        content,
        buttons,
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
