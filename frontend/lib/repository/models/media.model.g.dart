// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      json['id'] as int?,
      json['url'] as String?,
      json['alternativeText'] as String?,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'alternativeText': instance.alternativeText,
    };
