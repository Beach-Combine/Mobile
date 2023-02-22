// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trashcan_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTrashcanLocationResponse _$GetTrashcanLocationResponseFromJson(
        Map<String, dynamic> json) =>
    GetTrashcanLocationResponse(
      lat: json['lat'] as String,
      lng: json['lng'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$GetTrashcanLocationResponseToJson(
        GetTrashcanLocationResponse instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'id': instance.id,
    };
