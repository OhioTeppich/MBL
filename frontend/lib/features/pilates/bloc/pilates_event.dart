part of 'pilates_bloc.dart';

class PilatesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetPilatesExercises extends PilatesEvent{}

class SelectPilatesExercises extends PilatesEvent {
  SelectPilatesExercises({
    required this.selected,
  });
  final PilatesExercise selected;

  @override
  List<Object?> get props => [selected];
}