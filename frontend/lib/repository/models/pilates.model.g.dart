// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pilates.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PilatesExercise _$PilatesExerciseFromJson(Map<String, dynamic> json) =>
    PilatesExercise(
      json['id'] as String?,
      json['title'] as String?,
      json['length'] as int?,
      json['video'] == null
          ? null
          : Media.fromJson(json['video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PilatesExerciseToJson(PilatesExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'length': instance.length,
      'video': instance.video,
    };
