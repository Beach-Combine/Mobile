import 'package:json_annotation/json_annotation.dart';

part 'record.g.dart';

@JsonSerializable()
class Record {
  Record({
    required this.beachId,
    required this.isWritten,
    required this.time,
    required this.recordId,
    required this.date,
    required this.afterImage,
    required this.range,
    required this.beforeImage,
    required this.beachName,
  });

  int recordId;
  int beachId;
  String time;
  DateTime date;
  int range;
  String beforeImage;
  String afterImage;
  bool isWritten;
  String beachName;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);

  Map<String, dynamic> toJson() => _$RecordToJson(this);

  static List<Record> fromJsonList(List list) {
    return list.map((item) => Record.fromJson(item)).toList();
  }
}
