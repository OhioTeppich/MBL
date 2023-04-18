import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:mbl/repository/mbl.repository.dart';
import 'package:mbl/repository/models/api_response.model.dart';
import 'package:mbl/repository/models/meta_data.model.dart';
import 'package:mbl/repository/models/pilates.model.dart';
import 'package:stream_transform/stream_transform.dart';

part 'pilates_event.dart';
part 'pilates_state.dart';

const throttleDuration = Duration(seconds: 1);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PilatesBloc extends Bloc<PilatesEvent, PilatesState> {
  PilatesBloc({
    required this.mblRepository,
  }) : super(PilatesState()) {
    on<GetPilatesExercises>(
      _mapGetPilatesExercisesEventToState,
      transformer: throttleDroppable(throttleDuration),
    );
    on<ToggleViewMode>(_mapToggleViewModeEventToState);
  }
  final MblRepository mblRepository;

  void _mapGetPilatesExercisesEventToState(
      GetPilatesExercises event, Emitter<PilatesState> emit) async {
    if (state.reachedMaxPages) return;

    try {
      if (state.status == PilatesStatus.initial) {
        emit(state.copyWith(status: PilatesStatus.loading));
        final ApiResponse apiResponse =
            await mblRepository.getPilatesExercises(state.page);

        return emit(
          state.copyWith(
            status: PilatesStatus.success,
            pilatesExercises: apiResponse.data,
            metaData: apiResponse.metaData,
          ),
        );
      }

      final ApiResponse apiResponse =
          await mblRepository.getPilatesExercises(state.page + 1);

      emit(
        state.copyWith(
          status: PilatesStatus.success,
          pilatesExercises: List.of(state.pilatesExercises)
            ..addAll(apiResponse.data),
          metaData: apiResponse.metaData,
          reachedMaxPages: apiResponse.metaData.pagination.page ==
              state.metaData.pagination.pageCount,
          page: state.page + 1,
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
