import 'package:mbl/repository/models/media.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meditation.model.g.dart';

@JsonSerializable()
class Meditation {
  Meditation(this.id, this.title, this.length, this.video);

  final int? id;
  final String? title;
  final int? length;
  final Media? video;

  factory Meditation.fromJson(Map<String, dynamic> json) =>
      _$MeditationFromJson(json);
  Map<String, dynamic> toJson() => _$MeditationToJson(this);
}
