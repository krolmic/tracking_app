part of '../update_user_profile_screen.dart';

class _UpdateUserProfileForm extends StatefulWidget {
  const _UpdateUserProfileForm({
    required this.email,
    required this.firstName,
  });

  final String email;
  final String firstName;

  @override
  State<_UpdateUserProfileForm> createState() => _UpdateUserProfileFormState();
}

class _UpdateUserProfileFormState extends State<_UpdateUserProfileForm> {
  final _formKey = GlobalKey<FormState>();

  late UpdateProfileFormzState _formState;

  late final TextEditingController _emailController;
  late final TextEditingController _firstNameController;

  void _onFirstNameChanged() {
    setState(() {
      _formState = _formState.copyWith(
        firstName: FirstNameInput.dirty(
          value: _firstNameController.text,
        ),
      );
    });
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    await context.read<UpdateUserProfileCubit>().updateUserProfile(
          firstName: _formState.firstName.value,
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

    _formState = UpdateProfileFormzState(
      email: EmailInput.dirty(
        value: widget.email,
      ),
      firstName: FirstNameInput.dirty(
        value: widget.firstName,
      ),
    );

    _emailController = TextEditingController(
      text: _formState.email.value,
    );

    _firstNameController = TextEditingController(
      text: _formState.firstName.value,
    )..addListener(_onFirstNameChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return BlocBuilder<UpdateUserProfileCubit, FormzSubmissionStatus>(
      buildWhen: (previousState, currentState) => previousState != currentState,
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translations.email,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const VerticalSpacing.small(),
              TextFormField(
                key: const Key('Update user profile form email input'),
                controller: _emailController,
                validator: (value) =>
                    _formState.email.validator(value ?? '')?.toString(),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                enabled: false,
              ),
              const VerticalSpacing.large(),
              Text(
                translations.givenName,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const VerticalSpacing.small(),
              TextFormField(
                key: const Key('Update user profile form first name input'),
                controller: _firstNameController,
                decoration: InputDecoration(
                  label: Text(translations.givenName),
                ),
                validator: (value) => _formState.firstName
                    .validator(value ?? '')
                    ?.text(translations),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                enabled: !state.isInProgress,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              const VerticalSpacing.extraLarge(),
              AppElevatedButton(
                isLoading: state.isInProgress,
                icon: Iconsax.edit_2_bold,
                onPressed: _onSubmit,
                label: AppLocalizations.of(context)!.update,
              ),
            ],
          ),
        );
      },
    );
  }
}

enum EmailInputError { empty, invalid }

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');

  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty) return EmailInputError.empty;

    return _emailRegExp.hasMatch(value) ? null : EmailInputError.invalid;
  }
}

enum FirstNameInputError { empty, invalid }

class FirstNameInput extends FormzInput<String, FirstNameInputError> {
  const FirstNameInput.pure() : super.pure('');

  const FirstNameInput.dirty({String value = ''}) : super.dirty(value);

  @override
  FirstNameInputError? validator(String value) {
    if (value.isEmpty) return FirstNameInputError.empty;

    return null;
  }
}

extension FirstNameInputErrorX on FirstNameInputError {
  String? text(AppLocalizations translations) {
    if (this == FirstNameInputError.empty) {
      return translations.givenNameMustNotBeBlank;
    }

    return null;
  }
}

class UpdateProfileFormzState with FormzMixin {
  UpdateProfileFormzState({
    this.email = const EmailInput.pure(),
    this.firstName = const FirstNameInput.pure(),
  });

  final EmailInput email;
  final FirstNameInput firstName;

  UpdateProfileFormzState copyWith({
    EmailInput? email,
    FirstNameInput? firstName,
  }) {
    return UpdateProfileFormzState(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [
        email,
        firstName,
      ];
}
