import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:legal_repository/legal_repository.dart';
import 'package:tracking_app/main.dart';
import 'package:tracking_app/shared/view/base_view.dart';
import 'package:tracking_app/shared/widgets/error_message.dart';
import 'package:tracking_app/shared/widgets/loading_indicator.dart';
import 'package:tracking_app/terms_of_service/cubit/terms_of_service_cubit.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;

    return BlocProvider(
      create: (context) => TermsOfServiceCubit(
        legalRepository: getIt<LegalRepository>(),
      )..init(languageCode),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.termsOfService,
          ),
        ),
        body: BaseView(
          addVerticalPadding: true,
          child: BlocBuilder<TermsOfServiceCubit, TermsOfServiceState>(
            builder: (context, state) {
              return state.maybeWhen(
                success: (content) => SingleChildScrollView(
                  child: HtmlWidget(content),
                ),
                error: () => ErrorMessage(
                  onRefresh: () =>
                      context.read<TermsOfServiceCubit>().init(languageCode),
                ),
                orElse: () => const Center(child: LoadingIndicator()),
              );
            },
          ),
        ),
      ),
    );
  }
}
