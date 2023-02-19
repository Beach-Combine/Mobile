// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTokenResponse _$GetTokenResponseFromJson(Map<String, dynamic> json) =>
    GetTokenResponse(
      json['accessToken'] as String,
      json['refreshToken'] as String,
    );

Map<String, dynamic> _$GetTokenResponseToJson(GetTokenResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
