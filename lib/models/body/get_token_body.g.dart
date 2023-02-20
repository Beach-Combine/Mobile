// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_token_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTokenBody _$GetTokenBodyFromJson(Map<String, dynamic> json) => GetTokenBody(
      email: json['email'] as String,
      id: json['id'] as String,
      displayName: json['displayName'] as String,
      photoUrl: json['photoUrl'] as String,
      serverAuthCode: json['serverAuthCode'] as String,
    );

Map<String, dynamic> _$GetTokenBodyToJson(GetTokenBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'serverAuthCode': instance.serverAuthCode,
    };
