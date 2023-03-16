import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/mocks/pilates-exercise.mock.dart';
import 'package:mbl/repository/mbl.repository.dart';
import 'package:equatable/equatable.dart';
import 'package:mbl/repository/models/pilates.model.dart';

part 'pilates_event.dart';
part 'pilates_state.dart';

class PilatesBloc extends Bloc<PilatesEvent, PilatesState> {
  PilatesBloc({
    required this.mblRepository,
  }) : super(PilatesState()) {
    on<GetPilatesExercises>(_mapGetPilatesExercisesEventToState);
    on<SelectPilatesExercises>(_mapSelectPilatesExerciseEventToState);
  }
  final MblRepository mblRepository;

  void _mapGetPilatesExercisesEventToState(
      GetPilatesExercises event, Emitter<PilatesState> emit) async {
    emit(state.copyWith(status: PilatesStatus.loading));
    try {
      final List<PilatesExercise> pilatesExercises = await mblRepository.getPilatesExercises();
      print(pilatesExercises);
      emit(
        state.copyWith(
          status: PilatesStatus.success,
          pilatesExercises: pilatesExercises,
        ),
      );
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      emit(state.copyWith(status: PilatesStatus.error));
    }
  }

  void _mapSelectPilatesExerciseEventToState(
      SelectPilatesExercises event, Emitter<PilatesState> emit) async {
    emit(
      state.copyWith(
        selectedExercise: event.selected,
      ),
    );
  }
}
