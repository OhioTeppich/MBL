import 'dart:convert';
import 'package:mbl/repository/models/strapi_response.model.dart';

class StrapiResponseConverter {
  static Map<String, dynamic> _removeObjectKey(
      Map<String, dynamic> object, String key) {
    return {
      'id': object['id'],
      ...object[key],
    };
  }

  static Map<String, dynamic> _traverse(Map<String, dynamic> data) {
    if (data.containsKey('attributes')) {
      return _traverse(_removeObjectKey(data, 'attributes'));
    }
    if (data.containsKey('data')) {
      return _traverse(_removeObjectKey(data, 'data'));
    }

    data.forEach((key, value) {
      if (value == null) return;

      if (value is Map<String, dynamic>) {
        data[key] = _traverse(value);
      }
    });
    return data;
  }

  static StrapiResponse convert(String jsonString) {
    final decodedJson = json.decode(jsonString);
    final data = decodedJson['data'] as List<dynamic>;
    final List<Map<String, dynamic>> result = [];

    for (final item in data) {
      result.add(_traverse(item));
    }

    final meta = decodedJson['meta'] as Map<String, dynamic>;

    return StrapiResponse(data: result, meta: meta);
  }
}
