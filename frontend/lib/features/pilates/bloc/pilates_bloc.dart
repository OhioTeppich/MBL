import 'package:flutter_bloc/flutter_bloc.dart';
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
  }
  final MblRepository mblRepository;

  void _mapGetPilatesExercisesEventToState(
      GetPilatesExercises event, Emitter<PilatesState> emit) async {
    emit(state.copyWith(status: PilatesStatus.loading));
    try {
      final pilatesExercises = await mblRepository.getPilatesExercises();
      emit(
        state.copyWith(
          status: PilatesStatus.success,
          pilatesExercises: pilatesExercises,
        ),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: PilatesStatus.error));
    }
  }
}
