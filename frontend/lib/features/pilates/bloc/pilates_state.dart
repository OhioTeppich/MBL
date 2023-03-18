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
    PilatesExercise? selectedExercise,
  })  : pilatesExercises = pilatesExercises ?? [],
        selectedExercise =
            selectedExercise ?? PilatesExerciseMock.pilatesExerciseC;

  final List<PilatesExercise> pilatesExercises;
  final PilatesStatus status;
  final PilatesExercise selectedExercise;

  @override
  List<Object?> get props => [status, pilatesExercises, selectedExercise];

  PilatesState copyWith({
    List<PilatesExercise>? pilatesExercises,
    PilatesStatus? status,
    PilatesExercise? selectedExercise,
  }) {
    return PilatesState(
      status: status ?? this.status,
      pilatesExercises: pilatesExercises ?? this.pilatesExercises,
      selectedExercise: selectedExercise ?? this.selectedExercise,
    );
  }
}
