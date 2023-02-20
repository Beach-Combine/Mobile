import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'get_token_body.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class GetTokenBody {
  GetTokenBody(
      {required this.email,
      required this.id,
      required this.displayName,
      required this.photoUrl,
      required this.serverAuthCode});

  String id;
  String email;
  String displayName;
  String photoUrl;
  String serverAuthCode;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory GetTokenBody.fromJson(Map<String, dynamic> json) =>
      _$GetTokenBodyFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$GetTokenBodyToJson(this);
}
