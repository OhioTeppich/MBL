part of 'meditation_bloc.dart';

class MeditationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetMeditationExercises extends MeditationEvent{}

class SelectMeditationExercises extends MeditationEvent {
  SelectMeditationExercises({
    required this.selected,
  });
  final Media selected;

  @override
  List<Object?> get props => [selected];
}