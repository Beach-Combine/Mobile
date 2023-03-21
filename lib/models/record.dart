import 'package:json_annotation/json_annotation.dart';

part 'record.g.dart';

@JsonSerializable()
class Record {
  Record(
      {required this.beachId,
      required this.isWritten,
      required this.time,
      required this.recordId,
      required this.date,
      required this.afterImage,
      required this.range,
      required this.beforeImage});

  // "recordId": 3,
  //   "beachId": 1,
  //   "duration": 200,
  //   "date": "23.02.01”,
  //   "distance": 20,
  //   "beforeImage": ”test”,
  //   "afterImage": “test”,
  //   “isWritten": true
  int recordId;
  int beachId;
  String time;
  DateTime date;
  int range;
  String beforeImage;
  String afterImage;
  bool isWritten;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);

  Map<String, dynamic> toJson() => _$RecordToJson(this);

  static List<Record> fromJsonList(List list) {
    return list.map((item) => Record.fromJson(item)).toList();
  }
}
