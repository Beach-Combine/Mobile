import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'purchase.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Purchase {
  Purchase({
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

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Purchase.fromJson(Map<String, dynamic> json) =>
      _$PurchaseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$PurchaseToJson(this);

  static List<Purchase> fromJsonList(List list) {
    return list.map((item) => Purchase.fromJson(item)).toList();
  }
}
