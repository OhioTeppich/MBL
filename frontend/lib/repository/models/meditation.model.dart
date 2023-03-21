import 'package:mbl/repository/models/cover.model.dart';
import 'package:mbl/repository/models/media.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meditation.model.g.dart';

@JsonSerializable()
class Meditation {
  Meditation(this.id, this.title, this.length, this.audio, this.speaker, this.cover);

  final int? id;
  final String? title;
  final String? speaker;
  final int? length;
  final Media audio;
  final Cover cover;

  factory Meditation.fromJson(Map<String, dynamic> json) =>
      _$MeditationFromJson(json);
  Map<String, dynamic> toJson() => _$MeditationToJson(this);
}
