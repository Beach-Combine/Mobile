// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Purchase _$PurchaseFromJson(Map<String, dynamic> json) => Purchase(
      id: json['id'] as int,
      name: json['name'] as String,
      location: json['location'] as String,
      image: json['image'] as String,
      cost: json['cost'] as int,
    );

Map<String, dynamic> _$PurchaseToJson(Purchase instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'image': instance.image,
      'cost': instance.cost,
    };
