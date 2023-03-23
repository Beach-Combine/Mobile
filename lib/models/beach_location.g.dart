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
      memberImage: json['memberImage'] as String,
    );

Map<String, dynamic> _$BeachLocationToJson(BeachLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'memberImage': instance.memberImage,
      'id': instance.id,
    };
