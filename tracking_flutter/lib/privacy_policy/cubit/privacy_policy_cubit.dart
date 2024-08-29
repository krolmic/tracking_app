import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_repository/legal_repository.dart';

part 'privacy_policy_cubit.freezed.dart';
part 'privacy_policy_state.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  PrivacyPolicyCubit({
    required LegalRepository legalRepository,
  })  : _legalRepository = legalRepository,
        super(const PrivacyPolicyState.initial());

  final LegalRepository _legalRepository;

  Future<void> init(String languageCode) async {
    emit(const PrivacyPolicyState.loading());
    try {
      final content = await _legalRepository.getPrivacyPolicy(languageCode);
      emit(PrivacyPolicyState.success(content));
    } catch (e, stackTrace) {
      Fimber.e(
        'Failed to load privacy policy',
        ex: e,
        stacktrace: stackTrace,
      );
      emit(const PrivacyPolicyState.error());
    }
  }
}
