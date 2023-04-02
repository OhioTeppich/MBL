import 'package:json_annotation/json_annotation.dart';

part 'image.model.g.dart';

@JsonSerializable(includeIfNull: false)
class Image {
  Image(
    this.id,
    this.url,
  );

  final int? id;
  final String? url;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
