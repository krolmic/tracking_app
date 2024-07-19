/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class MoodEntry extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  MoodEntry._({
    int? id,
    required this.userId,
    required this.value,
    this.thingsIAmGratefulFor,
    this.diary,
    this.revenue,
    this.workTime,
    required this.createdOn,
  }) : super(id);

  factory MoodEntry({
    int? id,
    required String userId,
    required int value,
    List<String>? thingsIAmGratefulFor,
    String? diary,
    double? revenue,
    Duration? workTime,
    required DateTime createdOn,
  }) = _MoodEntryImpl;

  factory MoodEntry.fromJson(Map<String, dynamic> jsonSerialization) {
    return MoodEntry(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      value: jsonSerialization['value'] as int,
      thingsIAmGratefulFor: (jsonSerialization['thingsIAmGratefulFor'] as List?)
          ?.map((e) => e as String)
          .toList(),
      diary: jsonSerialization['diary'] as String?,
      revenue: (jsonSerialization['revenue'] as num?)?.toDouble(),
      workTime: jsonSerialization['workTime'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(jsonSerialization['workTime']),
      createdOn:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdOn']),
    );
  }

  static final t = MoodEntryTable();

  static const db = MoodEntryRepository._();

  String userId;

  int value;

  List<String>? thingsIAmGratefulFor;

  String? diary;

  double? revenue;

  Duration? workTime;

  DateTime createdOn;

  @override
  _i1.Table get table => t;

  MoodEntry copyWith({
    int? id,
    String? userId,
    int? value,
    List<String>? thingsIAmGratefulFor,
    String? diary,
    double? revenue,
    Duration? workTime,
    DateTime? createdOn,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'value': value,
      if (thingsIAmGratefulFor != null)
        'thingsIAmGratefulFor': thingsIAmGratefulFor?.toJson(),
      if (diary != null) 'diary': diary,
      if (revenue != null) 'revenue': revenue,
      if (workTime != null) 'workTime': workTime?.toJson(),
      'createdOn': createdOn.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'value': value,
      if (thingsIAmGratefulFor != null)
        'thingsIAmGratefulFor': thingsIAmGratefulFor?.toJson(),
      if (diary != null) 'diary': diary,
      if (revenue != null) 'revenue': revenue,
      if (workTime != null) 'workTime': workTime?.toJson(),
      'createdOn': createdOn.toJson(),
    };
  }

  static MoodEntryInclude include() {
    return MoodEntryInclude._();
  }

  static MoodEntryIncludeList includeList({
    _i1.WhereExpressionBuilder<MoodEntryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MoodEntryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MoodEntryTable>? orderByList,
    MoodEntryInclude? include,
  }) {
    return MoodEntryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MoodEntry.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MoodEntry.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MoodEntryImpl extends MoodEntry {
  _MoodEntryImpl({
    int? id,
    required String userId,
    required int value,
    List<String>? thingsIAmGratefulFor,
    String? diary,
    double? revenue,
    Duration? workTime,
    required DateTime createdOn,
  }) : super._(
          id: id,
          userId: userId,
          value: value,
          thingsIAmGratefulFor: thingsIAmGratefulFor,
          diary: diary,
          revenue: revenue,
          workTime: workTime,
          createdOn: createdOn,
        );

  @override
  MoodEntry copyWith({
    Object? id = _Undefined,
    String? userId,
    int? value,
    Object? thingsIAmGratefulFor = _Undefined,
    Object? diary = _Undefined,
    Object? revenue = _Undefined,
    Object? workTime = _Undefined,
    DateTime? createdOn,
  }) {
    return MoodEntry(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      value: value ?? this.value,
      thingsIAmGratefulFor: thingsIAmGratefulFor is List<String>?
          ? thingsIAmGratefulFor
          : this.thingsIAmGratefulFor?.clone(),
      diary: diary is String? ? diary : this.diary,
      revenue: revenue is double? ? revenue : this.revenue,
      workTime: workTime is Duration? ? workTime : this.workTime,
      createdOn: createdOn ?? this.createdOn,
    );
  }
}

class MoodEntryTable extends _i1.Table {
  MoodEntryTable({super.tableRelation}) : super(tableName: 'mood_entry') {
    userId = _i1.ColumnString(
      'userId',
      this,
    );
    value = _i1.ColumnInt(
      'value',
      this,
    );
    thingsIAmGratefulFor = _i1.ColumnSerializable(
      'thingsIAmGratefulFor',
      this,
    );
    diary = _i1.ColumnString(
      'diary',
      this,
    );
    revenue = _i1.ColumnDouble(
      'revenue',
      this,
    );
    workTime = _i1.ColumnDuration(
      'workTime',
      this,
    );
    createdOn = _i1.ColumnDateTime(
      'createdOn',
      this,
    );
  }

  late final _i1.ColumnString userId;

  late final _i1.ColumnInt value;

  late final _i1.ColumnSerializable thingsIAmGratefulFor;

  late final _i1.ColumnString diary;

  late final _i1.ColumnDouble revenue;

  late final _i1.ColumnDuration workTime;

  late final _i1.ColumnDateTime createdOn;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        value,
        thingsIAmGratefulFor,
        diary,
        revenue,
        workTime,
        createdOn,
      ];
}

class MoodEntryInclude extends _i1.IncludeObject {
  MoodEntryInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => MoodEntry.t;
}

class MoodEntryIncludeList extends _i1.IncludeList {
  MoodEntryIncludeList._({
    _i1.WhereExpressionBuilder<MoodEntryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MoodEntry.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => MoodEntry.t;
}

class MoodEntryRepository {
  const MoodEntryRepository._();

  Future<List<MoodEntry>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MoodEntryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MoodEntryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MoodEntryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MoodEntry>(
      where: where?.call(MoodEntry.t),
      orderBy: orderBy?.call(MoodEntry.t),
      orderByList: orderByList?.call(MoodEntry.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<MoodEntry?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MoodEntryTable>? where,
    int? offset,
    _i1.OrderByBuilder<MoodEntryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MoodEntryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<MoodEntry>(
      where: where?.call(MoodEntry.t),
      orderBy: orderBy?.call(MoodEntry.t),
      orderByList: orderByList?.call(MoodEntry.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<MoodEntry?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<MoodEntry>(
      id,
      transaction: transaction,
    );
  }

  Future<List<MoodEntry>> insert(
    _i1.Session session,
    List<MoodEntry> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MoodEntry>(
      rows,
      transaction: transaction,
    );
  }

  Future<MoodEntry> insertRow(
    _i1.Session session,
    MoodEntry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MoodEntry>(
      row,
      transaction: transaction,
    );
  }

  Future<List<MoodEntry>> update(
    _i1.Session session,
    List<MoodEntry> rows, {
    _i1.ColumnSelections<MoodEntryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MoodEntry>(
      rows,
      columns: columns?.call(MoodEntry.t),
      transaction: transaction,
    );
  }

  Future<MoodEntry> updateRow(
    _i1.Session session,
    MoodEntry row, {
    _i1.ColumnSelections<MoodEntryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MoodEntry>(
      row,
      columns: columns?.call(MoodEntry.t),
      transaction: transaction,
    );
  }

  Future<List<MoodEntry>> delete(
    _i1.Session session,
    List<MoodEntry> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MoodEntry>(
      rows,
      transaction: transaction,
    );
  }

  Future<MoodEntry> deleteRow(
    _i1.Session session,
    MoodEntry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MoodEntry>(
      row,
      transaction: transaction,
    );
  }

  Future<List<MoodEntry>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MoodEntryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MoodEntry>(
      where: where(MoodEntry.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MoodEntryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MoodEntry>(
      where: where?.call(MoodEntry.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
