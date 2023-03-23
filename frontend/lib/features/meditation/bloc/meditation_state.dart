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
    List<Meditation>? meditations,
    MetaData? metaData,
  })  : meditations = meditations ?? [],
        metaData = metaData ?? MetaData.empty;

  final List<Meditation> meditations;
  final MetaData metaData;
  final MeditationStatus status;

  @override
  List<Object?> get props => [status, meditations];

  MeditationState copyWith({
    List<Meditation>? meditations,
    MeditationStatus? status,
    MetaData? metaData,
  }) {
    return MeditationState(
      status: status ?? this.status,
      meditations: meditations ?? this.meditations,
      metaData: metaData ?? this.metaData,
    );
  }
}