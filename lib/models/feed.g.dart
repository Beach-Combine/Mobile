// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) => Feed(
      nickname: json['nickname'] as String,
      id: json['id'] as int,
      review: json['review'] as String?,
      recordId: json['recordId'] as int,
      memberId: json['memberId'] as int,
      afterImage: json['afterImage'] as String,
      beachName: json['beachName'] as String,
      beforeImage: json['beforeImage'] as String,
    );

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'id': instance.id,
      'review': instance.review,
      'recordId': instance.recordId,
      'memberId': instance.memberId,
      'nickname': instance.nickname,
      'beforeImage': instance.beforeImage,
      'afterImage': instance.afterImage,
      'beachName': instance.beachName,
    };
