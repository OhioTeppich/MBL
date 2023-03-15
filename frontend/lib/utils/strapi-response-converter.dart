class StrapiResponseConverter {
  static Map<String, dynamic> _removeObjectKey(Map<String, dynamic> object, String key) {
    return {
      'id': object['id'],
      ...object[key],
    };
  }

  static Map<String, dynamic> traverse(Map<String, dynamic> data) {
    if (data.containsKey('attributes')) {
      return traverse(_removeObjectKey(data, 'attributes'));
    }
    if (data.containsKey('data')) {
      return traverse(_removeObjectKey(data, 'data'));
    }

    data.forEach((key, value) {
      if (value == null) return;

      if (value is Map<String, dynamic>) {
        data[key] = traverse(value);
      }
    });
    return data;
  }
}
