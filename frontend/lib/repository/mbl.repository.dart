import 'package:mbl/repository/models/api_response.model.dart';
import 'package:mbl/repository/service/mbl.service.dart';

class MblRepository {
  const MblRepository({
    required this.service,
  });
  final MblService service;

  Future<ApiResponse> getPilatesExercises(int page) async =>
      service.getPilatesExercises(page);
  Future<ApiResponse> getMeditations(int page) async =>
      service.getMeditations(page);
}
