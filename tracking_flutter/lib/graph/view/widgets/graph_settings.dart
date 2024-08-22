part of '../graph_screen.dart';

class _GraphSettings extends StatelessWidget {
  const _GraphSettings();

  void _onTimeRangeModeChanged(
    BuildContext context,
    GraphTimeRangeMode? value,
  ) {
    if (value != null) {
      context
          .read<GraphBloc>()
          .add(GraphEvent.timeRangeModeChanged(mode: value));
    }
  }

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpacing.small(),
        Text(
          translations.mode,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const VerticalSpacing.small(),
        BlocBuilder<GraphBloc, GraphState>(
          buildWhen: (previous, current) =>
              previous.settings.timeRangeMode != current.settings.timeRangeMode,
          builder: (context, state) {
            return DropDown<GraphTimeRangeMode>(
              value: state.settings.timeRangeMode,
              items: [
                DropdownMenuItem(
                  value: GraphTimeRangeMode.monthly,
                  alignment: Alignment.center,
                  child: Text(translations.monthly),
                ),
                DropdownMenuItem(
                  value: GraphTimeRangeMode.weekly,
                  alignment: Alignment.center,
                  child: Text(translations.weekly),
                ),
              ],
              onChanged: (value) => _onTimeRangeModeChanged(context, value),
            );
          },
        ),
        const VerticalSpacing.large(),
        Text(
          translations.lines,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const VerticalSpacing.small(),
        Row(
          children: [
            BlocBuilder<GraphBloc, GraphState>(
              buildWhen: (previous, current) =>
                  previous.settings.showRevenue != current.settings.showRevenue,
              builder: (context, state) {
                return SizedBox(
                  height: 24,
                  child: Checkbox(
                    value: state.settings.showRevenue,
                    onChanged: (value) {
                      context
                          .read<GraphBloc>()
                          .add(const GraphEvent.showRevenueTriggered());
                    },
                  ),
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
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.blue,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
          ],
        ),
        const VerticalSpacing.small(),
        Row(
          children: [
            BlocBuilder<GraphBloc, GraphState>(
              buildWhen: (previous, current) =>
                  previous.settings.showWorkTime !=
                  current.settings.showWorkTime,
              builder: (context, state) {
                return SizedBox(
                  height: 24,
                  child: Checkbox(
                    value: state.settings.showWorkTime,
                    onChanged: (value) {
                      context
                          .read<GraphBloc>()
                          .add(const GraphEvent.showWorkTimeTriggered());
                    },
                  ),
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
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.blue,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
