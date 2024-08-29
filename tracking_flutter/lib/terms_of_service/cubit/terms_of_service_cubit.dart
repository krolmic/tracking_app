import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_repository/legal_repository.dart';

part 'terms_of_service_cubit.freezed.dart';
part 'terms_of_service_state.dart';

class TermsOfServiceCubit extends Cubit<TermsOfServiceState> {
  TermsOfServiceCubit({
    required LegalRepository legalRepository,
  })  : _legalRepository = legalRepository,
        super(const TermsOfServiceState.initial());

  final LegalRepository _legalRepository;

  Future<void> init(String languageCode) async {
    emit(const TermsOfServiceState.loading());
    try {
      final content = await _legalRepository.getTermsOfService(languageCode);
      emit(TermsOfServiceState.success(content));
    } catch (e, stackTrace) {
      Fimber.e(
        'Failed to load terms of service',
        ex: e,
        stacktrace: stackTrace,
      );
      emit(const TermsOfServiceState.error());
    }
  }
}
