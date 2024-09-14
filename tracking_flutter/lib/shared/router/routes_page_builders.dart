part of 'router.dart';

Page<dynamic> createMoodRoutePageBuilder(
  BuildContext context,
  GoRouterState state,
) {
  final parameters = CreateMoodRouteParameters.fromState(state);

  context.read<CreateMoodBloc>().add(
        CreateMoodEvent.dateChanged(parameters.date),
      );

  return const NoTransitionPage(
    child: CreateMoodScreen(),
  );
}

Page<dynamic> updateMoodRoutePageBuilder(
  BuildContext context,
  GoRouterState state,
) {
  final parameters = UpdateMoodRouteParameters.fromState(state);
  final mood = parameters.mood;

  context.read<UpdateMoodBloc>().add(
        UpdateMoodEvent.moodSelected(mood),
      );

  return NoTransitionPage(
    child: UpdateMoodScreen(
      moodDate: mood.createdOn,
    ),
  );
}
