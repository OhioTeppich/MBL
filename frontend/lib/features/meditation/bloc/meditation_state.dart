part of 'meditation_bloc.dart';

enum MeditationStatus { initial, success, error, loading, selected, fubar }

extension MeditationX on MeditationStatus {
  bool get isInitial => this == MeditationStatus.initial;
  bool get isSuccess => this == MeditationStatus.success;
  bool get isError => this == MeditationStatus.error;
  bool get isLoading => this == MeditationStatus.loading;
}

class MeditationState extends Equatable {
  MeditationState({
    this.status = MeditationStatus.initial,
    List<Media>? medias,
  })  : medias = medias ?? [];

  final List<Media> medias;
  final MeditationStatus status;

  @override
  List<Object?> get props => [status, medias];

  MeditationState copyWith({
    List<Media>? medias,
    MeditationStatus? status,
  }) {
    return MeditationState(
      status: status ?? this.status,
      medias: medias ?? this.medias,
    );
  }
}
