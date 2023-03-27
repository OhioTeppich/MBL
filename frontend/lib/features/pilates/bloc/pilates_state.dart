part of 'pilates_bloc.dart';

enum PilatesStatus { initial, success, error, loading, selected, fubar }

extension PilatesX on PilatesStatus {
  bool get isInitial => this == PilatesStatus.initial;
  bool get isSuccess => this == PilatesStatus.success;
  bool get isError => this == PilatesStatus.error;
  bool get isLoading => this == PilatesStatus.loading;
}

// PilatesExercise? selectedExercise, is just implemented for presentational purposes to show how the state can be updated and will be deleted soon

class PilatesState extends Equatable {
  PilatesState({
    this.status = PilatesStatus.initial,
    List<PilatesExercise>? pilatesExercises,
    MetaData? metaData,
    this.view = false,
  })  : pilatesExercises = pilatesExercises ?? [],
        metaData = metaData ?? MetaData.empty;

  final List<PilatesExercise> pilatesExercises;
  final MetaData metaData;
  final PilatesStatus status;
  final bool view;

  @override
  List<Object?> get props => [status, pilatesExercises, view];

  PilatesState copyWith({
    List<PilatesExercise>? pilatesExercises,
    PilatesStatus? status,
    MetaData? metaData,
    bool? view,
  }) {
    return PilatesState(
      status: status ?? this.status,
      pilatesExercises: pilatesExercises ?? this.pilatesExercises,
      metaData: metaData ?? this.metaData,
      view: view ?? this.view,
    );
  }
}
