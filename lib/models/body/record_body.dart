import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'record_body.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class RecordBody {
  RecordBody(
      {required this.id,
      required this.range,
      required this.time,
      required this.beforeImage,
      required this.afterImage});
  int id;
  int range;
  int time;
  dynamic beforeImage;
  dynamic afterImage;

  factory RecordBody.fromJson(Map<String, dynamic> json) =>
      _$RecordBodyFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$RecordBodyToJson(this);
}
