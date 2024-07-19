/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:tracking_client/src/protocol/mood_entry.dart' as _i3;
import 'protocol.dart' as _i4;

/// {@category Endpoint}
class EndpointMoodEntries extends _i1.EndpointRef {
  EndpointMoodEntries(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'moodEntries';

  _i2.Future<List<_i3.MoodEntry>> getMoodEntries({
    required int page,
    required String userId,
  }) =>
      caller.callServerEndpoint<List<_i3.MoodEntry>>(
        'moodEntries',
        'getMoodEntries',
        {
          'page': page,
          'userId': userId,
        },
      );

  _i2.Future<List<_i3.MoodEntry>> getMoodEntriesInTimeRange({
    required String userId,
    required DateTime from,
    required DateTime to,
  }) =>
      caller.callServerEndpoint<List<_i3.MoodEntry>>(
        'moodEntries',
        'getMoodEntriesInTimeRange',
        {
          'userId': userId,
          'from': from,
          'to': to,
        },
      );

  _i2.Future<_i3.MoodEntry> createMoodEntry(_i3.MoodEntry moodEntry) =>
      caller.callServerEndpoint<_i3.MoodEntry>(
        'moodEntries',
        'createMoodEntry',
        {'moodEntry': moodEntry},
      );

  _i2.Future<_i3.MoodEntry> updateMoodEntry({
    required int id,
    int? value,
    String? diary,
    List<String>? thingsIAmGratefulFor,
    double? revenue,
    Duration? workTime,
  }) =>
      caller.callServerEndpoint<_i3.MoodEntry>(
        'moodEntries',
        'updateMoodEntry',
        {
          'id': id,
          'value': value,
          'diary': diary,
          'thingsIAmGratefulFor': thingsIAmGratefulFor,
          'revenue': revenue,
          'workTime': workTime,
        },
      );

  _i2.Future<void> deleteMoodEntry({required int id}) =>
      caller.callServerEndpoint<void>(
        'moodEntries',
        'deleteMoodEntry',
        {'id': id},
      );

  _i2.Future<void> deleteMoodEntries({required String userId}) =>
      caller.callServerEndpoint<void>(
        'moodEntries',
        'deleteMoodEntries',
        {'userId': userId},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i4.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    moodEntries = EndpointMoodEntries(this);
  }

  late final EndpointMoodEntries moodEntries;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup =>
      {'moodEntries': moodEntries};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
