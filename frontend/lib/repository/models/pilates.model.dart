import 'package:mbl/repository/models/media.model.dart';

class PilatesExercise {
  PilatesExercise(this.id, this.title, this.length, this.video);

  final String? id;
  final String? title;
  final int? length;
  final Media? video;
}
