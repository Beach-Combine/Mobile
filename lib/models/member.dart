import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'member.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Member {
  Member(
      {required this.email,
      required this.monthPoint,
      required this.nickname,
      required this.purchasePoint,
      required this.id,
      required this.image,
      required this.profilePublic,
      required this.role,
      required this.totalPoint});

  int id;
  String nickname;
  String email;
  String image;
  int totalPoint;
  int monthPoint;
  int purchasePoint;
  bool profilePublic;
  String role;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
