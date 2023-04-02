import 'package:json_annotation/json_annotation.dart';
import 'package:mbl/repository/models/image.model.dart';
import 'package:mbl/repository/models/media.model.dart';

part 'pilates.model.g.dart';

@JsonSerializable(includeIfNull: false)
class PilatesExercise {
  PilatesExercise(this.id, this.title, this.length, this.video, this.image);

  final int? id;
  final String? title;
  final int? length;
  final Media? video;
  final Image? image;

  factory PilatesExercise.fromJson(Map<String, dynamic> json) =>
      _$PilatesExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$PilatesExerciseToJson(this);
}
