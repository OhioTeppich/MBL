import 'package:mbl/repository/models/image.model.dart';
import 'package:mbl/repository/models/media.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meditation.model.g.dart';

@JsonSerializable(includeIfNull: false)
class Meditation {
  Meditation(
      this.id, this.title, this.length, this.audio, this.speaker, this.image);

  final int? id;
  final String? title;
  final String? speaker;
  final int? length;
  final Media? audio;
  final Image? image;

  factory Meditation.fromJson(Map<String, dynamic> json) =>
      _$MeditationFromJson(json);
  Map<String, dynamic> toJson() => _$MeditationToJson(this);
}
