// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ranking _$RankingFromJson(Map<String, dynamic> json) => Ranking(
      nickname: json['nickname'] as String,
      id: json['id'] as int,
      image: json['image'] as String?,
      point: json['point'] as int,
    );

Map<String, dynamic> _$RankingToJson(Ranking instance) => <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'image': instance.image,
      'point': instance.point,
    };
