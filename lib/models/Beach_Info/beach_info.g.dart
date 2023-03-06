// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beach_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeachInfo _$BeachInfoFromJson(Map<String, dynamic> json) => BeachInfo(
      beach: Beach.fromJson(json['beach'] as Map<String, dynamic>),
      record: json['record'] == null
          ? null
          : Record.fromJson(json['record'] as Map<String, dynamic>),
      member: json['member'] == null
          ? null
          : Member.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BeachInfoToJson(BeachInfo instance) => <String, dynamic>{
      'beach': instance.beach,
      'record': instance.record,
      'member': instance.member,
    };
