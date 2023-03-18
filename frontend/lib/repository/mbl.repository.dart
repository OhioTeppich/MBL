import 'package:mbl/repository/models/api_response.model.dart';
import 'package:mbl/repository/service/mbl.service.dart';

class MblRepository {
  const MblRepository({
    required this.service,
  });
  final MblService service;

  Future<ApiResponse> getPilatesExercises() async =>
      service.getPilatesExercises();
  Future<List<dynamic>> getMeditations() async => service.getMeditations();
}
