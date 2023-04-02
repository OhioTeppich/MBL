// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meditation _$MeditationFromJson(Map<String, dynamic> json) => Meditation(
      json['id'] as int?,
      json['title'] as String?,
      json['length'] as int?,
      json['audio'] == null
          ? null
          : Media.fromJson(json['audio'] as Map<String, dynamic>),
      json['speaker'] as String?,
      json['cover'] == null
          ? null
          : Cover.fromJson(json['cover'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeditationToJson(Meditation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('speaker', instance.speaker);
  writeNotNull('length', instance.length);
  writeNotNull('audio', instance.audio);
  writeNotNull('cover', instance.cover);
  return val;
}
