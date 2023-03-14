
import 'package:mbl/repository/models/pilates.model.dart';
import 'package:mbl/repository/models/video.model.dart';

class PilatesExerciseMock {
    static PilatesExercise pilatesExerciseA = 
      PilatesExercise('1', 'Morning Pilates', 10, Media('2', '/uploads/someaudio.mp4', 'alternativeText'));
    static PilatesExercise pilatesExerciseB = 
      PilatesExercise('2', 'Good Night  Pilates', 10, Media('3', '/uploads/someaudio.mp4', 'alternativeText'));
    static PilatesExercise pilatesExerciseC = 
      PilatesExercise('3', 'Good Afternoon Pilates', 10, Media('4', '/uploads/someaudio.mp4', 'alternativeText'));
}