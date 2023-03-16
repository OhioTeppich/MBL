import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mbl/mocks/pilates-exercise.mock.dart';
import 'package:mbl/repository/models/pilates.model.dart';
import 'package:mbl/repository/models/result_error.dart';
import 'package:mbl/utils/strapi-response-converter.dart';

class MblService {
  MblService({http.Client? httpClient, String? baseUrl})
      : _httpClient = httpClient ?? http.Client(),
        baseUrl = "http://${dotenv.get('HOST')}/api";

  final String baseUrl;
  final Client _httpClient;

  Uri getUrl({
    required String url,
    Map<String, String>? extraParameters,
  }) {

    print(Uri.parse('$baseUrl/$url').replace(
        queryParameters: extraParameters,
      ));

    return Uri.parse('$baseUrl/$url').replace(
        queryParameters: extraParameters,
      );
  }
      

  Future<List<PilatesExercise>> getPilatesExercises() async {
    final response = await _httpClient.get(
      getUrl(url: 'pilates-exercises'),
    );

    print(response.body);

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        
        StrapiResponse convertedRepsonse = StrapiResponseConverter.convert(response.body);

        print(convertedRepsonse);

        return List<PilatesExercise>.from(
          convertedRepsonse.data.map(
                (data) => PilatesExercise.fromJson(data),
              ),
        );
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingGames('Error getting pilates exercises');
    }
  }

  dynamic getMeditations() {
    // implement api call
  }
}
