// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cover _$CoverFromJson(Map<String, dynamic> json) => Cover(
      json['id'] as int?,
      json['url'] as String?,
    );

Map<String, dynamic> _$CoverToJson(Cover instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('url', instance.url);
  return val;
}
