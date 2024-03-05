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

abstract class MoodEntry extends _i1.TableRow {
  MoodEntry._({
    int? id,
    required this.userId,
    required this.value,
    this.thingsIAmGratefulFor,
    this.diary,
    required this.createdOn,
  }) : super(id);

  factory MoodEntry({
    int? id,
    required String userId,
    required int value,
    List<String>? thingsIAmGratefulFor,
    String? diary,
    required DateTime createdOn,
  }) = _MoodEntryImpl;

  factory MoodEntry.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return MoodEntry(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<String>(jsonSerialization['userId']),
      value: serializationManager.deserialize<int>(jsonSerialization['value']),
      thingsIAmGratefulFor: serializationManager.deserialize<List<String>?>(
          jsonSerialization['thingsIAmGratefulFor']),
      diary:
          serializationManager.deserialize<String?>(jsonSerialization['diary']),
      createdOn: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdOn']),
    );
  }

  static final t = MoodEntryTable();

  static const db = MoodEntryRepository._();

  String userId;

  int value;

  List<String>? thingsIAmGratefulFor;

  String? diary;

  DateTime createdOn;

  @override
  _i1.Table get table => t;

  MoodEntry copyWith({
    int? id,
    String? userId,
    int? value,
    List<String>? thingsIAmGratefulFor,
    String? diary,
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
      'createdOn': createdOn.toJson(),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userId': userId,
      'value': value,
      'thingsIAmGratefulFor': thingsIAmGratefulFor,
      'diary': diary,
      'createdOn': createdOn,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'value': value,
      if (thingsIAmGratefulFor != null)
        'thingsIAmGratefulFor': thingsIAmGratefulFor?.toJson(),
      if (diary != null) 'diary': diary,
      'createdOn': createdOn.toJson(),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'userId':
        userId = value;
        return;
      case 'value':
        value = value;
        return;
      case 'thingsIAmGratefulFor':
        thingsIAmGratefulFor = value;
        return;
      case 'diary':
        diary = value;
        return;
      case 'createdOn':
        createdOn = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<MoodEntry>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MoodEntryTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MoodEntry>(
      where: where != null ? where(MoodEntry.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<MoodEntry?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MoodEntryTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<MoodEntry>(
      where: where != null ? where(MoodEntry.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<MoodEntry?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<MoodEntry>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MoodEntryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MoodEntry>(
      where: where(MoodEntry.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    MoodEntry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.update instead.')
  static Future<bool> update(
    _i1.Session session,
    MoodEntry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  @Deprecated(
      'Will be removed in 2.0.0. Use: db.insert instead. Important note: In db.insert, the object you pass in is no longer modified, instead a new copy with the added row is returned which contains the inserted id.')
  static Future<void> insert(
    _i1.Session session,
    MoodEntry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.count instead.')
  static Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MoodEntryTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MoodEntry>(
      where: where != null ? where(MoodEntry.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
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
}

class _Undefined {}

class _MoodEntryImpl extends MoodEntry {
  _MoodEntryImpl({
    int? id,
    required String userId,
    required int value,
    List<String>? thingsIAmGratefulFor,
    String? diary,
    required DateTime createdOn,
  }) : super._(
          id: id,
          userId: userId,
          value: value,
          thingsIAmGratefulFor: thingsIAmGratefulFor,
          diary: diary,
          createdOn: createdOn,
        );

  @override
  MoodEntry copyWith({
    Object? id = _Undefined,
    String? userId,
    int? value,
    Object? thingsIAmGratefulFor = _Undefined,
    Object? diary = _Undefined,
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
    createdOn = _i1.ColumnDateTime(
      'createdOn',
      this,
    );
  }

  late final _i1.ColumnString userId;

  late final _i1.ColumnInt value;

  late final _i1.ColumnSerializable thingsIAmGratefulFor;

  late final _i1.ColumnString diary;

  late final _i1.ColumnDateTime createdOn;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        value,
        thingsIAmGratefulFor,
        diary,
        createdOn,
      ];
}

@Deprecated('Use MoodEntryTable.t instead.')
MoodEntryTable tMoodEntry = MoodEntryTable();

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
    return session.dbNext.find<MoodEntry>(
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
    return session.dbNext.findFirstRow<MoodEntry>(
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
    return session.dbNext.findById<MoodEntry>(
      id,
      transaction: transaction,
    );
  }

  Future<List<MoodEntry>> insert(
    _i1.Session session,
    List<MoodEntry> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<MoodEntry>(
      rows,
      transaction: transaction,
    );
  }

  Future<MoodEntry> insertRow(
    _i1.Session session,
    MoodEntry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<MoodEntry>(
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
    return session.dbNext.update<MoodEntry>(
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
    return session.dbNext.updateRow<MoodEntry>(
      row,
      columns: columns?.call(MoodEntry.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<MoodEntry> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<MoodEntry>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    MoodEntry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<MoodEntry>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MoodEntryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<MoodEntry>(
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
    return session.dbNext.count<MoodEntry>(
      where: where?.call(MoodEntry.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
