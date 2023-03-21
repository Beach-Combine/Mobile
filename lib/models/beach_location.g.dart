// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beach_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeachLocation _$BeachLocationFromJson(Map<String, dynamic> json) =>
    BeachLocation(
      lat: json['lat'] as String,
      lng: json['lng'] as String,
      id: json['id'] as int,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$BeachLocationToJson(BeachLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'image': instance.image,
      'id': instance.id,
    };
