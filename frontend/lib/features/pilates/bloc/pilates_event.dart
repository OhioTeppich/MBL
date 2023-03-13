part of 'pilates_bloc.dart';

class PilatesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetPilatesExercises extends PilatesEvent{}

class SelectPilatesExercises extends PilatesEvent {
  SelectPilatesExercises({
    required this.selectedIndex,
  });
  final int selectedIndex;

  @override
  List<Object?> get props => [selectedIndex];
}