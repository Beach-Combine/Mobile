import 'package:json_annotation/json_annotation.dart';

part 'giftcard.g.dart';

@JsonSerializable()
class Giftcard {
  Giftcard({
    required this.id,
    required this.name,
    required this.location,
    required this.image,
    required this.cost,
  });

  // "id": 1,
  //       ”name”: “Gwanga”,
  //       "location": "seoul",
  //       "image": "t",
  //       "cost": "500"
  int id;
  String name;
  String location;
  String image;
  int cost;

  factory Giftcard.fromJson(Map<String, dynamic> json) =>
      _$GiftcardFromJson(json);

  Map<String, dynamic> toJson() => _$GiftcardToJson(this);

  static List<Giftcard> fromJsonList(List list) {
    return list.map((item) => Giftcard.fromJson(item)).toList();
  }
}
