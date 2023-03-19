// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meditation _$MeditationFromJson(Map<String, dynamic> json) => Meditation(
      json['id'] as int?,
      json['title'] as String?,
      json['length'] as int?,
      json['video'] == null
          ? null
          : Media.fromJson(json['video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeditationToJson(Meditation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'length': instance.length,
      'video': instance.video,
    };
