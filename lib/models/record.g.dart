// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Record _$RecordFromJson(Map<String, dynamic> json) => Record(
      beachId: json['beachId'] as int,
      isWritten: json['isWritten'] as bool,
      duration: json['duration'] as int,
      recordId: json['recordId'] as int,
      date: json['date'] as String,
      afterImage: json['afterImage'] as String,
      distance: json['distance'] as int,
      beforeImage: json['beforeImage'] as String,
    );

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'recordId': instance.recordId,
      'beachId': instance.beachId,
      'duration': instance.duration,
      'date': instance.date,
      'distance': instance.distance,
      'beforeImage': instance.beforeImage,
      'afterImage': instance.afterImage,
      'isWritten': instance.isWritten,
    };
