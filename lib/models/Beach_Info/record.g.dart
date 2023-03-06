// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Record _$RecordFromJson(Map<String, dynamic> json) => Record(
      id: json['id'] as int,
      date: json['date'] as String,
      time: json['time'] as int,
      range: json['range'] as int,
      beforeImage: json['beforeImage'] as String,
      afterImage: json['afterImage'] as String,
    );

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'time': instance.time,
      'range': instance.range,
      'beforeImage': instance.beforeImage,
      'afterImage': instance.afterImage,
    };
