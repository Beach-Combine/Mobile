// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      email: json['email'] as String,
      monthPoint: json['monthPoint'] as int,
      nickname: json['nickname'] as String,
      pointUsed: json['pointUsed'] as int,
      id: json['id'] as int,
      image: json['image'] as String,
      profilePublic: json['profilePublic'] as bool,
      role: json['role'] as String,
      totalPoint: json['totalPoint'] as int,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'email': instance.email,
      'image': instance.image,
      'totalPoint': instance.totalPoint,
      'monthPoint': instance.monthPoint,
      'pointUsed': instance.pointUsed,
      'profilePublic': instance.profilePublic,
      'role': instance.role,
    };
