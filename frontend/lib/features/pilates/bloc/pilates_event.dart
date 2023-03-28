part of 'pilates_bloc.dart';

class PilatesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetPilatesExercises extends PilatesEvent {}

class ToggleViewMode extends PilatesEvent {
  ToggleViewMode(this.viewMode);

  final bool viewMode;

  @override
  List<Object?> get props => [viewMode];
}
