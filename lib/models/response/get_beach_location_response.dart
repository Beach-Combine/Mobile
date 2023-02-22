import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'get_beach_location_response.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class GetBeachLocationResponse {
  GetBeachLocationResponse(
      {required this.lat,
      required this.lng,
      required this.id,
      required this.image});

  String lat;
  String lng;
  String id;
  String image;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory GetBeachLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBeachLocationResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$GetBeachLocationResponseToJson(this);
}
