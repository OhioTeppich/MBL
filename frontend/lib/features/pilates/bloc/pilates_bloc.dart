import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:mbl/repository/mbl.repository.dart';
import 'package:mbl/repository/models/api_response.model.dart';
import 'package:mbl/repository/models/meta_data.model.dart';
import 'package:mbl/repository/models/pilates.model.dart';

part 'pilates_event.dart';
part 'pilates_state.dart';

class PilatesBloc extends Bloc<PilatesEvent, PilatesState> {
  PilatesBloc({
    required this.mblRepository,
  }) : super(PilatesState()) {
    on<GetPilatesExercises>(_mapGetPilatesExercisesEventToState);
    on<ToggleViewMode>(_mapToggleViewModeEventToState);
  }
  final MblRepository mblRepository;

  void _mapGetPilatesExercisesEventToState(
      GetPilatesExercises event, Emitter<PilatesState> emit) async {
    emit(state.copyWith(status: PilatesStatus.loading));
    try {
      final ApiResponse apiResponse = await mblRepository.getPilatesExercises();
      emit(
        state.copyWith(
          status: PilatesStatus.success,
          pilatesExercises: apiResponse.data,
          metaData: apiResponse.metaData,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: PilatesStatus.error));
    }
  }

  void _mapToggleViewModeEventToState(
      ToggleViewMode event, Emitter<PilatesState> emit) async {
    emit(state.copyWith(
        viewMode: event.viewMode, status: PilatesStatus.success));
  }
}
