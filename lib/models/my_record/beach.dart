import 'package:json_annotation/json_annotation.dart';

part 'beach.g.dart';

@JsonSerializable()
class Beach {
  Beach({required this.name});

  String name;

  factory Beach.fromJson(Map<String, dynamic> json) => _$BeachFromJson(json);

  Map<String, dynamic> toJson() => _$BeachToJson(this);
}
