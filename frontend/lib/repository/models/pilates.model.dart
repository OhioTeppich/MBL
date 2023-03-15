import 'package:mbl/repository/models/media.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pilates.model.g.dart';

@JsonSerializable()
class PilatesExercise {
  PilatesExercise(
    this.id,
    this.title,
    this.length,
    this.video
  );

  final String? id;
  final String? title;
  final int? length;
  final Media? video;

  factory PilatesExercise.fromJson(Map<String, dynamic> json) =>
      _$PilatesExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$PilatesExerciseToJson(this);
}
