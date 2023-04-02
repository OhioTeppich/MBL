import 'package:json_annotation/json_annotation.dart';
import 'package:mbl/repository/models/cover.model.dart';
import 'package:mbl/repository/models/media.model.dart';

part 'pilates.model.g.dart';

@JsonSerializable(includeIfNull: false)
class PilatesExercise {
  PilatesExercise(this.id, this.title, this.length, this.video, this.cover);

  final int? id;
  final String? title;
  final int? length;
  final Media? video;
  final Cover? cover;

  factory PilatesExercise.fromJson(Map<String, dynamic> json) =>
      _$PilatesExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$PilatesExerciseToJson(this);
}
