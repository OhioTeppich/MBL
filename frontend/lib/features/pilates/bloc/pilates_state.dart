part of 'pilates_bloc.dart';

enum PilatesStatus { initial, success, error, loading, selected, fubar }

extension PilatesX on PilatesStatus {
  bool get isInitial => this == PilatesStatus.initial;
  bool get isSuccess => this == PilatesStatus.success;
  bool get isError => this == PilatesStatus.error;
  bool get isLoading => this == PilatesStatus.loading;
}

class PilatesState extends Equatable {
  PilatesState({
    this.status = PilatesStatus.initial,
    List<PilatesExercise>? pilatesExercises,
    MetaData? metaData,
    this.viewMode = false,
    this.page = 0,
    this.reachedMaxPages = true,
  })  : pilatesExercises = pilatesExercises ?? [],
        metaData = metaData ?? MetaData.empty;

  final List<PilatesExercise> pilatesExercises;
  final MetaData metaData;
  final PilatesStatus status;
  final bool viewMode;
  final int page;
  final bool reachedMaxPages;

  @override
  List<Object?> get props => [status, pilatesExercises, viewMode];

  PilatesState copyWith(
      {List<PilatesExercise>? pilatesExercises,
      PilatesStatus? status,
      MetaData? metaData,
      bool? viewMode,
      int? page,
      bool? reachedMaxPages}) {
    return PilatesState(
      status: status ?? this.status,
      pilatesExercises: pilatesExercises ?? this.pilatesExercises,
      metaData: metaData ?? this.metaData,
      viewMode: viewMode ?? this.viewMode,
      page: page ?? this.page,
      reachedMaxPages: reachedMaxPages ?? this.reachedMaxPages,
    );
  }
}
