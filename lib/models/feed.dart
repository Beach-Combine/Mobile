import 'package:json_annotation/json_annotation.dart';

part 'feed.g.dart';

@JsonSerializable()
class Feed {
  Feed(
      {required this.nickname,
      required this.id,
      required this.review,
      required this.recordId,
      required this.memberId,
      required this.afterImage,
      required this.beachName,
      required this.beforeImage});

  // "id": 1,
  //   "review": "review1234",
  //   "recordId": 1,
  //   "memberId": 1,
  //   "nickname": "31",
  //   "beforeImage": "t",
  //   "afterImage": "t”,
  //   "beachName": "Hae Beach"
  int id;
  String? review;
  int recordId;
  int memberId;
  String nickname;
  String beforeImage;
  String afterImage;
  String beachName;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);

  static List<Feed> fromJsonList(List list) {
    return list.map((item) => Feed.fromJson(item)).toList();
  }
}
