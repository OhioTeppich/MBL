// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pilates.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PilatesExercise _$PilatesExerciseFromJson(Map<String, dynamic> json) =>
    PilatesExercise(
      json['id'] as int?,
      json['title'] as String?,
      json['length'] as int?,
      json['video'] == null
          ? null
          : Media.fromJson(json['video'] as Map<String, dynamic>),
      json['cover'] == null
          ? null
          : Cover.fromJson(json['cover'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PilatesExerciseToJson(PilatesExercise instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('length', instance.length);
  writeNotNull('video', instance.video);
  writeNotNull('cover', instance.cover);
  return val;
}
