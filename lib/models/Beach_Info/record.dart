import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'record.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Record {
  Record(
      {required this.id,
      required this.date,
      required this.time,
      required this.range,
      required this.beforeImage,
      required this.afterImage});
  int id;
  String date;
  int time;
  int range;
  String beforeImage;
  String afterImage;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$RecordToJson(this);
}
