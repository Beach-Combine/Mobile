// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Record _$RecordFromJson(Map<String, dynamic> json) => Record(
      beachId: json['beachId'] as int,
      isWritten: json['isWritten'] as bool,
      time: json['time'] as String,
      recordId: json['recordId'] as int,
      date: DateTime.parse(json['date'] as String),
      afterImage: json['afterImage'] as String,
      range: json['range'] as int,
      beforeImage: json['beforeImage'] as String,
      beachName: json['beachName'] as String,
    );

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'recordId': instance.recordId,
      'beachId': instance.beachId,
      'time': instance.time,
      'date': instance.date.toIso8601String(),
      'range': instance.range,
      'beforeImage': instance.beforeImage,
      'afterImage': instance.afterImage,
      'isWritten': instance.isWritten,
      'beachName': instance.beachName,
    };
