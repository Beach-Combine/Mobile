// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      notificationId: json['notificationId'] as int,
      memberId: json['memberId'] as int,
      title: json['title'] as String,
      message: json['message'] as String,
      details: json['details'] as String,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'memberId': instance.memberId,
      'title': instance.title,
      'message': instance.message,
      'details': instance.details,
    };
