import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/mocks/meditation-exercise.mock.dart';
import 'package:mbl/repository/mbl.repository.dart';
import 'package:equatable/equatable.dart';
import 'package:mbl/repository/models/media.model.dart';


part 'meditation_event.dart';
part 'meditation_state.dart';

class MeditationBloc extends Bloc<MeditationEvent, MeditationState> {
  MeditationBloc({
    required this.mblRepository,
  }) : super(MeditationState()) {
    on<GetMeditationExercises>(_mapGetPilatesExercisesEventToState);
    //on<SelectMeditationExercises>(_mapSelectMeditationExerciseEventToState);
  }
  final MblRepository mblRepository;

  void _mapGetPilatesExercisesEventToState(
      GetMeditationExercises event, Emitter<MeditationState> emit) async {
    emit(state.copyWith(status: MeditationStatus.loading));
    try {
      final meditationExercises = await mblRepository.getMeditations();
      emit(
        state.copyWith(
          status: MeditationStatus.success,
          medias: meditationExercises,
        ),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: MeditationStatus.error));
    }
  }
/*
  void _mapSelectMeditationExerciseEventToState(
      SelectMeditationExercises event, Emitter<MeditationState> emit) async {
    emit(
      state.copyWith(
        : event.selected,
      ),
    );
  }*/
}


