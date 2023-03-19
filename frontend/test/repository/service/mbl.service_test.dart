import 'package:flutter_test/flutter_test.dart';
import 'package:mbl/repository/models/api_response.model.dart';
import 'package:mbl/repository/models/pilates.model.dart';
import 'package:mbl/repository/service/mbl.service.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'mbl.service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('get pilates exercises', () {
    test('return pilates axercises and meta data', () async {
      final client = MockClient();
      final mblService =
          MblService(httpClient: client, baseUrl: 'http://localhost:1337/api');

      when(
        client.get(
          Uri.parse('http://localhost:1337/api/pilates-exercises'),
        ),
      ).thenAnswer((realInvocation) async => http.Response(
          '{"data":[{"id":1,"attributes":{"title":"Yes to Live Meditation","length":5,"createdAt":"2023-03-12T13:47:44.365Z","updatedAt":"2023-03-12T13:47:46.263Z","publishedAt":"2023-03-12T13:47:46.260Z","speaker":null}}],"meta":{"pagination":{"page":1,"pageSize":25,"pageCount":1,"total":2}}}',
          200));

      expect(await mblService.getPilatesExercises(),
          isA<ApiResponse<List<PilatesExercise>>>());
    });
  });
}
