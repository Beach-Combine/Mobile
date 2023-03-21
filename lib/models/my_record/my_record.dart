import 'package:beach_combine/models/my_record/beach.dart';
import 'package:beach_combine/models/my_record/record.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_record.g.dart';

@JsonSerializable()
class MyRecord {
  MyRecord(
      {required this.beach, required this.recordList});

  Beach beach;
  List<Record> recordList;

  factory MyRecord.fromJson(Map<String, dynamic> json) => _$MyRecordFromJson(json);

  Map<String, dynamic> toJson() => _$MyRecordToJson(this);
}
