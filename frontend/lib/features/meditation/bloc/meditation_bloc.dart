import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/repository/mbl.repository.dart';
import 'package:equatable/equatable.dart';
import 'package:mbl/repository/models/api_response.model.dart';
import 'package:mbl/repository/models/meditation.model.dart';
import 'package:mbl/repository/models/meta_data.model.dart';


part 'meditation_event.dart';
part 'meditation_state.dart';

class MeditationBloc extends Bloc<MeditationEvent, MeditationState> {
  MeditationBloc({
    required this.mblRepository,
  }) : super(MeditationState()) {
    on<GetMeditation>(_mapGetMeditationEventToState);
    //on<SelectMeditationExercises>(_mapSelectMeditationExerciseEventToState);
  }
  final MblRepository mblRepository;

  void _mapGetMeditationEventToState(
      GetMeditation event, Emitter<MeditationState> emit) async {
    emit(state.copyWith(status: MeditationStatus.loading));
    try {
      final ApiResponse apiResponse = await mblRepository.getMeditations();
      emit(
        state.copyWith(
          status: MeditationStatus.success,
          meditations: apiResponse.data,
          metaData: apiResponse.metaData,
        )
      );
    } catch (error) {
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
