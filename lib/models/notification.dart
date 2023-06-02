import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'notification.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Notification {
  //   "notificationId": 3,
  // "memberId": 1,
  // "title": "쓰레기통 인증 완료",
  // "message": "추가적인 70포인트가 지급되었습니다.",
  // "details": "신고한 쓰레기통이 인증 되었습니다."

  Notification(
      {required this.notificationId,
      required this.memberId,
      required this.title,
      required this.message,
      required this.details});

  int notificationId;
  int memberId;
  String title;
  String message;
  String details;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  static List<Notification> fromJsonList(List list) {
    return list.map((item) => Notification.fromJson(item)).toList();
  }
}
