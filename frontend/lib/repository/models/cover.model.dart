import 'package:json_annotation/json_annotation.dart';

part 'cover.model.g.dart';

@JsonSerializable()
class Cover {
  Cover(
    this.id,
    this.url,
  );

  final int? id;
  final String? url;

  factory Cover.fromJson(Map<String, dynamic> json) => _$CoverFromJson(json);
  Map<String, dynamic> toJson() => _$CoverToJson(this);
}
