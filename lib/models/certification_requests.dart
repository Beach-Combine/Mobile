import 'package:json_annotation/json_annotation.dart';

part 'certification_requests.g.dart';

@JsonSerializable()
class CertificationRequests {
  CertificationRequests({
    required this.lat,
    required this.lng,
    required this.id,
    required this.address,
    required this.date,
    required this.trashcanImage,
    required this.memberImage,
    required this.isCertified,
    required this.nickname,
  });

  // ”lat”: “35”,
//   ”lng”: “85”
//    “id” :1,
//    “address”: null
  String lat;
  String lng;
  int id;
  String nickname;
  String date;
  @JsonKey(name: 'is_certified')
  bool isCertified;
  String trashcanImage;
  String memberImage;
  String? address;

  factory CertificationRequests.fromJson(Map<String, dynamic> json) =>
      _$CertificationRequestsFromJson(json);

  Map<String, dynamic> toJson() => _$CertificationRequestsToJson(this);

  static List<CertificationRequests> fromJsonList(List list) {
    return list.map((item) => CertificationRequests.fromJson(item)).toList();
  }
}
