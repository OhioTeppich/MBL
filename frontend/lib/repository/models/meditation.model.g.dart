// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meditation _$MeditationFromJson(Map<String, dynamic> json) => Meditation(
      json['id'] as int?,
      json['title'] as String?,
      json['length'] as int?,
      Media.fromJson(json['audio'] as Map<String, dynamic>),
      json['speaker'] as String?,
      Cover.fromJson(json['cover'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeditationToJson(Meditation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'speaker': instance.speaker,
      'length': instance.length,
      'audio': instance.audio,
      'cover': instance.cover,
    };
