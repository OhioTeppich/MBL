import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mbl/repository/models/api_response.model.dart';
import 'package:mbl/repository/models/meditation.model.dart';
import 'package:mbl/repository/models/meta_data.model.dart';
import 'package:mbl/repository/models/pilates.model.dart';
import 'package:mbl/repository/models/result_error.model.dart';
import 'package:mbl/repository/models/strapi_response.model.dart';
import 'package:mbl/utils/strapi_response_converter.dart';

class MblService {
  MblService({http.Client? httpClient, String? baseUrl})
      : _httpClient = httpClient ?? http.Client(),
        baseUrl = baseUrl ?? "http://${dotenv.get('HOST')}/api";

  final String baseUrl;
  final Client _httpClient;

  Uri getUrl({
    required String url,
    Map<String, String>? extraParameters,
  }) {
    return Uri.parse('$baseUrl/$url').replace(
      queryParameters: extraParameters,
    );
  }

  Future<ApiResponse> getPilatesExercises(int page) async {
    // todo: implement pages parameter to api call

    final response = await _httpClient.get(
      getUrl(url: 'pilates-exercises'),
    );

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        StrapiResponse convertedRepsonse =
            StrapiResponseConverter.convert(response.body);

        final List<PilatesExercise> data = List<PilatesExercise>.from(
          convertedRepsonse.data.map(
            (data) => PilatesExercise.fromJson(data),
          ),
        );
        final MetaData metaData = MetaData.fromJson(convertedRepsonse.meta);
        final ApiResponse apiResponse =
            ApiResponse<List<PilatesExercise>>(data: data, metaData: metaData);

        return apiResponse;
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingPilatesExercises('Error getting pilates exercises');
    }
  }

  Future<ApiResponse> getMeditations() async {
    final response = await _httpClient.get(
      getUrl(
          url:
              'meditations?fields[0]=title&fields[1]=speaker&fields[2]=length&populate[audio][fields][0]=url&populate[audio][fields][1]=alternativeText&populate[cover][fields][0]=url'),
    );

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        StrapiResponse convertedRepsonse =
            StrapiResponseConverter.convert(response.body);

        final List<Meditation> data = List<Meditation>.from(
          convertedRepsonse.data.map(
            (data) => Meditation.fromJson(data),
          ),
        );
        final MetaData metaData = MetaData.fromJson(convertedRepsonse.meta);
        final ApiResponse apiResponse =
            ApiResponse<List<Meditation>>(data: data, metaData: metaData);

        return apiResponse;
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingPilatesExercises('Error getting Meditation');
    }
  }
}
