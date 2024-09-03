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

  void onPageChanged(int index) {
    FocusManager.instance.primaryFocus?.unfocus();

    toastification.dismissAll();

    setState(() {
      currentStep = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final content = Expanded(
      child: PageView(
        controller: _controller,
        onPageChanged: onPageChanged,
        children: widget.pages,
      ),
    );

    final dotsIndicator = AppDotsIndicator(
      dotsCount: widget.pages.length,
      position: currentStep.toDouble(),
    );

    return Column(
      children: [
        content,
        BlocBuilder<CreateMoodBloc, CreateMoodState>(
          buildWhen: (previousState, currentState) =>
              previousState.formStatus != currentState.formStatus,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: viewPaddingHorizontal,
                vertical: horizontalPaddingSmall,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed:
                        _isFirst(currentStep) || state.formStatus.isInProgress
                            ? null
                            : onStepBack,
                    icon: Icon(
                      Iconsax.arrow_left_outline,
                      color:
                          _isFirst(currentStep) || state.formStatus.isInProgress
                              ? AppColors.lightGrey
                              : AppColors.primarySwatch,
                    ),
                  ),
                  dotsIndicator,
                  IconButton(
                    onPressed:
                        state.formStatus.isInProgress ? null : onStepNext,
                    icon: state.formStatus.isInProgress
                        ? const TinyLoadingIndicator()
                        : Icon(
                            _isLast(currentStep)
                                ? Icons.check
                                : Iconsax.arrow_right_1_outline,
                            color: AppColors.primarySwatch,
                          ),
                  ),
                ],
              ),
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
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: maxViewWidth,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: viewPaddingHorizontal,
          ),
          child: child,
        ),
      ),
    ).animate().fadeIn(duration: animationDuration);
  }
}
