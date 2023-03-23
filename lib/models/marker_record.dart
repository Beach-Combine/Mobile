import 'package:json_annotation/json_annotation.dart';

part 'marker_record.g.dart';

@JsonSerializable()
class MarkerRecord {
  MarkerRecord({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
  });

  int id;
  String name;
  String lat;
  String lng;

  factory MarkerRecord.fromJson(Map<String, dynamic> json) =>
      _$MarkerRecordFromJson(json);

  Map<String, dynamic> toJson() => _$MarkerRecordToJson(this);

  static List<MarkerRecord> fromJsonList(List list) {
    return list.map((item) => MarkerRecord.fromJson(item)).toList();
  }
}
