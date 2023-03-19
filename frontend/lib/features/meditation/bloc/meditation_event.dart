part of 'meditation_bloc.dart';

class MeditationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetMeditation extends MeditationEvent{}

class SelectMeditation extends MeditationEvent {
  SelectMeditation({
    required this.selected,
  });
  final Meditation selected;

  @override
  List<Object?> get props => [selected];
}
