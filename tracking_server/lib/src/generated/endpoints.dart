/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/mood_entries_endpoint.dart' as _i2;
import 'package:tracking_server/src/generated/mood_entry.dart' as _i3;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'moodEntries': _i2.MoodEntriesEndpoint()
        ..initialize(
          server,
          'moodEntries',
          null,
        )
    };
    connectors['moodEntries'] = _i1.EndpointConnector(
      name: 'moodEntries',
      endpoint: endpoints['moodEntries']!,
      methodConnectors: {
        'getMoodEntries': _i1.MethodConnector(
          name: 'getMoodEntries',
          params: {
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['moodEntries'] as _i2.MoodEntriesEndpoint)
                  .getMoodEntries(
            session,
            page: params['page'],
            userId: params['userId'],
          ),
        ),
        'getMoodEntriesInTimeRange': _i1.MethodConnector(
          name: 'getMoodEntriesInTimeRange',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'from': _i1.ParameterDescription(
              name: 'from',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'to': _i1.ParameterDescription(
              name: 'to',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['moodEntries'] as _i2.MoodEntriesEndpoint)
                  .getMoodEntriesInTimeRange(
            session,
            userId: params['userId'],
            from: params['from'],
            to: params['to'],
          ),
        ),
        'createMoodEntry': _i1.MethodConnector(
          name: 'createMoodEntry',
          params: {
            'moodEntry': _i1.ParameterDescription(
              name: 'moodEntry',
              type: _i1.getType<_i3.MoodEntry>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['moodEntries'] as _i2.MoodEntriesEndpoint)
                  .createMoodEntry(
            session,
            params['moodEntry'],
          ),
        ),
        'updateMoodEntry': _i1.MethodConnector(
          name: 'updateMoodEntry',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'value': _i1.ParameterDescription(
              name: 'value',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'diary': _i1.ParameterDescription(
              name: 'diary',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'thingsIAmGratefulFor': _i1.ParameterDescription(
              name: 'thingsIAmGratefulFor',
              type: _i1.getType<List<String>?>(),
              nullable: true,
            ),
            'revenue': _i1.ParameterDescription(
              name: 'revenue',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'workTime': _i1.ParameterDescription(
              name: 'workTime',
              type: _i1.getType<Duration?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['moodEntries'] as _i2.MoodEntriesEndpoint)
                  .updateMoodEntry(
            session,
            id: params['id'],
            value: params['value'],
            diary: params['diary'],
            thingsIAmGratefulFor: params['thingsIAmGratefulFor'],
            revenue: params['revenue'],
            workTime: params['workTime'],
          ),
        ),
        'deleteMoodEntry': _i1.MethodConnector(
          name: 'deleteMoodEntry',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['moodEntries'] as _i2.MoodEntriesEndpoint)
                  .deleteMoodEntry(
            session,
            id: params['id'],
          ),
        ),
        'deleteMoodEntries': _i1.MethodConnector(
          name: 'deleteMoodEntries',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['moodEntries'] as _i2.MoodEntriesEndpoint)
                  .deleteMoodEntries(
            session,
            userId: params['userId'],
          ),
        ),
      },
    );
  }
}
