import 'package:beach_combine/models/Beach_Info/beach.dart';
import 'package:beach_combine/models/Beach_Info/member.dart';
import 'package:beach_combine/models/Beach_Info/record.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'beach_info.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class BeachInfo {
  BeachInfo({
    required this.beach,
    required this.record,
    required this.member,
  });

  Beach beach;
  Record? record;
  Member? member;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory BeachInfo.fromJson(Map<String, dynamic> json) =>
      _$BeachInfoFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$BeachInfoToJson(this);
}
