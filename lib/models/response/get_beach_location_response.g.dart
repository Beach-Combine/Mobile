// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_beach_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBeachLocationResponse _$GetBeachLocationResponseFromJson(
        Map<String, dynamic> json) =>
    GetBeachLocationResponse(
      lat: json['lat'] as String,
      lng: json['lng'] as String,
      id: json['id'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$GetBeachLocationResponseToJson(
        GetBeachLocationResponse instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'id': instance.id,
      'image': instance.image,
    };
