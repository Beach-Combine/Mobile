import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'trashcan_location.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class TrashcanLocation {
  TrashcanLocation({
    required this.lat,
    required this.lng,
    required this.id,
  });

  String lat;
  String lng;
  int id;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory TrashcanLocation.fromJson(Map<String, dynamic> json) =>
      _$TrashcanLocationFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$TrashcanLocationToJson(this);

  static List<TrashcanLocation> fromJsonList(List list) {
    return list.map((item) => TrashcanLocation.fromJson(item)).toList();
  }
}
