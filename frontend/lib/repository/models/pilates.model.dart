import 'package:json_annotation/json_annotation.dart';
import 'package:mbl/repository/models/media.model.dart';

part 'pilates.model.g.dart';

@JsonSerializable()
class PilatesExercise {
  PilatesExercise(this.id, this.title, this.length, this.video);

  final int? id;
  final String? title;
  final int? length;
  final Media? video;

  factory PilatesExercise.fromJson(Map<String, dynamic> json) =>
      _$PilatesExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$PilatesExerciseToJson(this);
}
