// ignore_for_file: prefer_single_quotes
import 'package:flutter_test/flutter_test.dart';
import 'package:mbl/repository/models/strapi_response.model.dart';
import 'package:mbl/utils/strapi_response_converter.dart';

void main() {
  testWidgets('strapi response converter converts json to strapi response',
      (tester) async {
    const String json =
        '{"data":[{"id":1,"attributes":{"title":"Yes to Live Meditation","length":5,"createdAt":"2023-03-12T13:47:44.365Z","updatedAt":"2023-03-12T13:47:46.263Z","publishedAt":"2023-03-12T13:47:46.260Z","speaker":null}}],"meta":{"pagination":{"page":1,"pageSize":25,"pageCount":1,"total":2}}}';
    expect(StrapiResponseConverter.convert(json), isA<StrapiResponse>());
  });
}
