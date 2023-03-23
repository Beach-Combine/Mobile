// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkerRecord _$MarkerRecordFromJson(Map<String, dynamic> json) => MarkerRecord(
      id: json['id'] as int,
      name: json['name'] as String,
      lat: json['lat'] as String,
      lng: json['lng'] as String,
    );

Map<String, dynamic> _$MarkerRecordToJson(MarkerRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
    };
