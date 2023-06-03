// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certification_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificationRequests _$CertificationRequestsFromJson(
        Map<String, dynamic> json) =>
    CertificationRequests(
      lat: json['lat'] as String,
      lng: json['lng'] as String,
      id: json['id'] as int,
      address: json['address'] as String?,
      date: json['date'] as String,
      trashcanImage: json['trashcanImage'] as String,
      memberImage: json['memberImage'] as String,
      isCertified: json['is_certified'] as bool,
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$CertificationRequestsToJson(
        CertificationRequests instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'id': instance.id,
      'nickname': instance.nickname,
      'date': instance.date,
      'is_certified': instance.isCertified,
      'trashcanImage': instance.trashcanImage,
      'memberImage': instance.memberImage,
      'address': instance.address,
    };
