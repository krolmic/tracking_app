part of '../graph_screen.dart';

class _GraphSettings extends StatelessWidget {
  const _GraphSettings();

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BlocBuilder<GraphBloc, GraphState>(
          buildWhen: (previous, current) =>
              previous.settings.showWorkTime != current.settings.showWorkTime,
          builder: (context, state) {
            return Checkbox(
              value: state.settings.showWorkTime,
              onChanged: (value) {
                context
                    .read<GraphBloc>()
                    .add(const GraphEvent.showWorkTimeTriggered());
              },
            );
          },
        ),
        GestureDetector(
          onTap: () {
            context
                .read<GraphBloc>()
                .add(const GraphEvent.showWorkTimeTriggered());
          },
          child: Text(
            translations.showWorkTime,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: blue,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        const HorizontalSpacing.medium(),
        BlocBuilder<GraphBloc, GraphState>(
          buildWhen: (previous, current) =>
              previous.settings.showRevenue != current.settings.showRevenue,
          builder: (context, state) {
            return Checkbox(
              value: state.settings.showRevenue,
              onChanged: (value) {
                context
                    .read<GraphBloc>()
                    .add(const GraphEvent.showRevenueTriggered());
              },
            );
          },
        ),
        GestureDetector(
          onTap: () {
            context
                .read<GraphBloc>()
                .add(const GraphEvent.showRevenueTriggered());
          },
          child: Text(
            translations.showRevenue,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: blue,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
      ],
    );
  }
}
