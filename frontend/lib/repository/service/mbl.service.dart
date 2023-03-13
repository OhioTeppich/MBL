import 'package:mbl/mocks/pilates-exercise.mock.dart';
import 'package:mbl/repository/models/pilates.model.dart';

class MblService {
  MblService(
    // implement api configuration
  );

  List<PilatesExercise> getPilatesExercises() {
    // implement api call instead of mock
    return <PilatesExercise>[PilatesExerciseMock.pilatesExerciseA, PilatesExerciseMock.pilatesExerciseA, PilatesExerciseMock.pilatesExerciseA];
  }

  dynamic getMeditations() {
    // implement api call
  }
}
