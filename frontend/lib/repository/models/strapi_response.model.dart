class StrapiResponse {
  StrapiResponse({
    required this.data,
    required this.meta,
  });

  final List<Map<String, dynamic>> data;
  final Map<String, dynamic> meta;
}
