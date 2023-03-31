import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/repository/mbl.repository.dart';
import 'package:equatable/equatable.dart';
import 'package:mbl/repository/models/api_response.model.dart';
import 'package:mbl/repository/models/meditation.model.dart';
import 'package:mbl/repository/models/meta_data.model.dart';
import 'package:stream_transform/stream_transform.dart';

part 'meditation_event.dart';
part 'meditation_state.dart';

const throttleDuration = Duration(seconds: 5);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return events;
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

      //emit(state.copyWith(status: MeditationStatus.loading));
      final ApiResponse apiResponse =
          await mblRepository.getMeditations(state.page + 1);

      apiResponse.data.isEmpty
          ? emit(
              state.copyWith(
                reachedMaxPages: true,
                status: MeditationStatus.success,
              ),
            )
          : emit(
              state.copyWith(
                status: MeditationStatus.success,
                meditations: List.of(state.meditations)
                  ..addAll(apiResponse.data),
                metaData: apiResponse.metaData,
                reachedMaxPages: false,
                page: state.reachedMaxPages ? state.page : state.page + 1,
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
