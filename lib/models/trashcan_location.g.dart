// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trashcan_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashcanLocation _$TrashcanLocationFromJson(Map<String, dynamic> json) =>
    TrashcanLocation(
      lat: json['lat'] as String,
      lng: json['lng'] as String,
      id: json['id'] as int,
      address: json['address'] as String,
    );

Map<String, dynamic> _$TrashcanLocationToJson(TrashcanLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'id': instance.id,
      'address': instance.address,
    };
