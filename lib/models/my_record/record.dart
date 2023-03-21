import 'package:json_annotation/json_annotation.dart';

part 'record.g.dart';

@JsonSerializable()
class Record {
  Record({required this.id, required this.date, required this.time, required this.range, required this.beforeImage, required this.afterImage});

  int id;
  String date;
  String time;
  int range;
  String beforeImage;
  String afterImage;

  factory Record.fromJson(Map<String, dynamic> json) =>
      _$RecordFromJson(json);

  Map<String, dynamic> toJson() => _$RecordToJson(this);
}
