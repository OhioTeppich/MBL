import 'package:mbl/repository/models/media.model.dart';
import 'package:mbl/repository/models/pilates.model.dart';
import 'package:mbl/repository/service/mbl.service.dart';

class MblRepository {
  const MblRepository({
    required this.service,
  });
  final MblService service;

  Future<List<PilatesExercise>> getPilatesExercises() async => service.getPilatesExercises();
  Future<List<Media>> getMeditations() async => service.getMeditations();

}
