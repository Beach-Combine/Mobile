// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyRecord _$MyRecordFromJson(Map<String, dynamic> json) => MyRecord(
      beach: Beach.fromJson(json['beach'] as Map<String, dynamic>),
      recordList: (json['recordList'] as List<dynamic>)
          .map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyRecordToJson(MyRecord instance) => <String, dynamic>{
      'beach': instance.beach,
      'recordList': instance.recordList,
    };
