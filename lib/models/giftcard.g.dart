// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giftcard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Giftcard _$GiftcardFromJson(Map<String, dynamic> json) => Giftcard(
      id: json['id'] as int,
      name: json['name'] as String,
      location: json['location'] as String,
      image: json['image'] as String,
      cost: json['cost'] as int,
    );

Map<String, dynamic> _$GiftcardToJson(Giftcard instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'image': instance.image,
      'cost': instance.cost,
    };
