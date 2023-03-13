part of 'pilates_bloc.dart';

enum PilatesStatus { initial, success, error, loading, selected }

extension PilatesX on PilatesStatus {
  bool get isInitial => this == PilatesStatus.initial;
  bool get isSuccess => this == PilatesStatus.success;
  bool get isError => this == PilatesStatus.error;
  bool get isLoading => this == PilatesStatus.loading;
  bool get isSelected => this == PilatesStatus.selected;
}

class PilatesState extends Equatable {
  PilatesState({
    this.status = PilatesStatus.initial,
    List<PilatesExercise>? pilatesExercises,
  }) : pilatesExercises = pilatesExercises ?? [];

  final List<PilatesExercise> pilatesExercises;
  final PilatesStatus status;
  
  @override
  List<Object?> get props => [status, pilatesExercises];

  PilatesState copyWith({
    List<PilatesExercise>? pilatesExercises,
    PilatesStatus? status,
  }) {
    return PilatesState(
      status: status ?? this.status,
      pilatesExercises: pilatesExercises ?? this.pilatesExercises,
    );
  }
}
