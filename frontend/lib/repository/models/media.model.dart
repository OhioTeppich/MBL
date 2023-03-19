import 'package:json_annotation/json_annotation.dart';

part 'media.model.g.dart';

@JsonSerializable()
class Media {
  Media(this.id, this.url, this.alternativeText);

  final int? id;
  final String? url;
  final String? alternativeText;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
