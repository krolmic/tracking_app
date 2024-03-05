/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the MoodEntry type in your schema. */
class MoodEntry extends amplify_core.Model {
  static const classType = const _MoodEntryModelType();
  final String id;
  final String? _userId;
  final int? _value;
  final List<String>? _thingsIamGratefulAbout;
  final String? _diary;
  final amplify_core.TemporalDateTime? _createdOn;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  MoodEntryModelIdentifier get modelIdentifier {
      return MoodEntryModelIdentifier(
        id: id
      );
  }
  
  String get userId {
    try {
      return _userId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get value {
    try {
      return _value!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String>? get thingsIamGratefulAbout {
    return _thingsIamGratefulAbout;
  }
  
  String? get diary {
    return _diary;
  }
  
  amplify_core.TemporalDateTime get createdOn {
    try {
      return _createdOn!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const MoodEntry._internal({required this.id, required userId, required value, thingsIamGratefulAbout, diary, required createdOn, createdAt, updatedAt}): _userId = userId, _value = value, _thingsIamGratefulAbout = thingsIamGratefulAbout, _diary = diary, _createdOn = createdOn, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory MoodEntry({String? id, required String userId, required int value, List<String>? thingsIamGratefulAbout, String? diary, required amplify_core.TemporalDateTime createdOn}) {
    return MoodEntry._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      userId: userId,
      value: value,
      thingsIamGratefulAbout: thingsIamGratefulAbout != null ? List<String>.unmodifiable(thingsIamGratefulAbout) : thingsIamGratefulAbout,
      diary: diary,
      createdOn: createdOn);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MoodEntry &&
      id == other.id &&
      _userId == other._userId &&
      _value == other._value &&
      DeepCollectionEquality().equals(_thingsIamGratefulAbout, other._thingsIamGratefulAbout) &&
      _diary == other._diary &&
      _createdOn == other._createdOn;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MoodEntry {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("value=" + (_value != null ? _value!.toString() : "null") + ", ");
    buffer.write("thingsIamGratefulAbout=" + (_thingsIamGratefulAbout != null ? _thingsIamGratefulAbout!.toString() : "null") + ", ");
    buffer.write("diary=" + "$_diary" + ", ");
    buffer.write("createdOn=" + (_createdOn != null ? _createdOn!.format() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MoodEntry copyWith({String? userId, int? value, List<String>? thingsIamGratefulAbout, String? diary, amplify_core.TemporalDateTime? createdOn}) {
    return MoodEntry._internal(
      id: id,
      userId: userId ?? this.userId,
      value: value ?? this.value,
      thingsIamGratefulAbout: thingsIamGratefulAbout ?? this.thingsIamGratefulAbout,
      diary: diary ?? this.diary,
      createdOn: createdOn ?? this.createdOn);
  }
  
  MoodEntry copyWithModelFieldValues({
    ModelFieldValue<String>? userId,
    ModelFieldValue<int>? value,
    ModelFieldValue<List<String>?>? thingsIamGratefulAbout,
    ModelFieldValue<String?>? diary,
    ModelFieldValue<amplify_core.TemporalDateTime>? createdOn
  }) {
    return MoodEntry._internal(
      id: id,
      userId: userId == null ? this.userId : userId.value,
      value: value == null ? this.value : value.value,
      thingsIamGratefulAbout: thingsIamGratefulAbout == null ? this.thingsIamGratefulAbout : thingsIamGratefulAbout.value,
      diary: diary == null ? this.diary : diary.value,
      createdOn: createdOn == null ? this.createdOn : createdOn.value
    );
  }
  
  MoodEntry.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userId = json['userId'],
      _value = (json['value'] as num?)?.toInt(),
      _thingsIamGratefulAbout = json['thingsIamGratefulAbout']?.cast<String>(),
      _diary = json['diary'],
      _createdOn = json['createdOn'] != null ? amplify_core.TemporalDateTime.fromString(json['createdOn']) : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userId': _userId, 'value': _value, 'thingsIamGratefulAbout': _thingsIamGratefulAbout, 'diary': _diary, 'createdOn': _createdOn?.format(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'userId': _userId,
    'value': _value,
    'thingsIamGratefulAbout': _thingsIamGratefulAbout,
    'diary': _diary,
    'createdOn': _createdOn,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<MoodEntryModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<MoodEntryModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USERID = amplify_core.QueryField(fieldName: "userId");
  static final VALUE = amplify_core.QueryField(fieldName: "value");
  static final THINGSIAMGRATEFULABOUT = amplify_core.QueryField(fieldName: "thingsIamGratefulAbout");
  static final DIARY = amplify_core.QueryField(fieldName: "diary");
  static final CREATEDON = amplify_core.QueryField(fieldName: "createdOn");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MoodEntry";
    modelSchemaDefinition.pluralName = "MoodEntries";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MoodEntry.USERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MoodEntry.VALUE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MoodEntry.THINGSIAMGRATEFULABOUT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MoodEntry.DIARY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MoodEntry.CREATEDON,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _MoodEntryModelType extends amplify_core.ModelType<MoodEntry> {
  const _MoodEntryModelType();
  
  @override
  MoodEntry fromJson(Map<String, dynamic> jsonData) {
    return MoodEntry.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'MoodEntry';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [MoodEntry] in your schema.
 */
class MoodEntryModelIdentifier implements amplify_core.ModelIdentifier<MoodEntry> {
  final String id;

  /** Create an instance of MoodEntryModelIdentifier using [id] the primary key. */
  const MoodEntryModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'MoodEntryModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is MoodEntryModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}