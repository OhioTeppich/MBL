import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/repository/mbl.repository.dart';
import 'package:equatable/equatable.dart';
import 'package:mbl/repository/models/api_response.model.dart';
import 'package:mbl/repository/models/meditation.model.dart';
import 'package:mbl/repository/models/meta_data.model.dart' as meta;
import 'package:stream_transform/stream_transform.dart';

part 'meditation_event.dart';
part 'meditation_state.dart';

const throttleDuration = Duration(seconds: 1);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MeditationBloc extends Bloc<MeditationEvent, MeditationState> {
  MeditationBloc({
    required this.mblRepository,
  }) : super(MeditationState()) {
    on<GetMeditation>(
      _mapGetMeditationEventToState,
      transformer: throttleDroppable(throttleDuration),
    );
    on<ToggleViewMode>(_mapToogleViewModeEventToState);
  }
  final MblRepository mblRepository;

  void _mapGetMeditationEventToState(
      GetMeditation event, Emitter<MeditationState> emit) async {
    if (state.reachedMaxPages) return;

    try {
      if (state.status == MeditationStatus.initial) {
        emit(state.copyWith(status: MeditationStatus.loading));
        final ApiResponse apiResponse =
            await mblRepository.getMeditations(state.page);
        return emit(
          state.copyWith(
            status: MeditationStatus.success,
            meditations: apiResponse.data,
            metaData: apiResponse.metaData,
          ),
        );
      }

      final ApiResponse apiResponse =
          await mblRepository.getMeditations(state.page + 1);

      emit(
        state.copyWith(
          status: MeditationStatus.success,
          meditations: List.of(state.meditations)..addAll(apiResponse.data),
          metaData: apiResponse.metaData,
          reachedMaxPages: apiResponse.metaData.pagination.page ==
              state.metaData.pagination.pageCount,
          page: state.page + 1,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: MeditationStatus.error));
    }
  }

  void _mapToogleViewModeEventToState(
      ToggleViewMode event, Emitter<MeditationState> emit) async {
    emit(state.copyWith(
        viewMode: event.viewMode, status: MeditationStatus.success));
  }
}
