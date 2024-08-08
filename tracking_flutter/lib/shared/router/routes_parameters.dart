import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_repository/mood_repository.dart';

@immutable
class UpdateMoodRouteParameters {
  const UpdateMoodRouteParameters({
    required this.mood,
  });

  factory UpdateMoodRouteParameters.fromState(
    GoRouterState state,
  ) =>
      state.extra! as UpdateMoodRouteParameters;

  final Mood mood;
}

@immutable
class CreateMoodRouteParameters {
  const CreateMoodRouteParameters({
    required this.date,
  });

  factory CreateMoodRouteParameters.fromState(
    GoRouterState state,
  ) =>
      state.extra! as CreateMoodRouteParameters;

  final DateTime date;
}

@immutable
class UpdateUserProfileRouteParameters {
  const UpdateUserProfileRouteParameters({
    required this.email,
    required this.firstName,
  });

  factory UpdateUserProfileRouteParameters.fromState(
    GoRouterState state,
  ) =>
      state.extra! as UpdateUserProfileRouteParameters;

  final String email;
  final String firstName;
}
