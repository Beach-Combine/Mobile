// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordBody _$RecordBodyFromJson(Map<String, dynamic> json) => RecordBody(
      range: json['range'] as int,
      time: json['time'] as int,
      beforeImage: json['beforeImage'],
      afterImage: json['afterImage'],
    );

Map<String, dynamic> _$RecordBodyToJson(RecordBody instance) =>
    <String, dynamic>{
      'range': instance.range,
      'time': instance.time,
      'beforeImage': instance.beforeImage,
      'afterImage': instance.afterImage,
    };
