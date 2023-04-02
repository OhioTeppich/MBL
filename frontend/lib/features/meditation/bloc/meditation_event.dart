part of 'meditation_bloc.dart';

class MeditationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetMeditation extends MeditationEvent {}

class GetMoreMeditation extends MeditationEvent {}

class ToggleViewMode extends MeditationEvent {
  ToggleViewMode(this.viewMode);

  final bool viewMode;

  @override
  List<Object?> get props => [viewMode];
}
