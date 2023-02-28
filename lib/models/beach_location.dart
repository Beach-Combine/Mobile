import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'beach_location.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class BeachLocation {
  BeachLocation(
      {required this.lat,
      required this.lng,
      required this.id,
      required this.image});

  String lat;
  String lng;
  String image;
  int id;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory BeachLocation.fromJson(Map<String, dynamic> json) =>
      _$BeachLocationFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$BeachLocationToJson(this);

  static List<BeachLocation> fromJsonList(List list) {
    return list.map((item) => BeachLocation.fromJson(item)).toList();
  }
}
