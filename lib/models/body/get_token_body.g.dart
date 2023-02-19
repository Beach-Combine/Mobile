// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_token_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTokenBody _$GetTokenBodyFromJson(Map<String, dynamic> json) => GetTokenBody(
      json['name'] as String,
      json['email'] as String,
      json['id'] as String,
    );

Map<String, dynamic> _$GetTokenBodyToJson(GetTokenBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
    };
