
import 'package:mbl/repository/models/pilates.model.dart';
import 'package:mbl/repository/models/video.model.dart';

class PilatesExerciseMock {
    static PilatesExercise pilatesExerciseA = 
      PilatesExercise('1', 'Morning Pilates', 10, Media('2', 'https://192.168.1.98:1337/someaudio.mp4', 'alternativeText'));
    static PilatesExercise pilatesExerciseB = 
      PilatesExercise('2', 'Good Night', 10, Media('3', 'https://192.168.1.98:1337/someaudio.mp4', 'alternativeText'));
    static PilatesExercise pilatesExerciseC = 
      PilatesExercise('2', 'Ja hallo?', 10, Media('3', 'https://192.168.1.98:1337/someaudio.mp4', 'alternativeText'));
}