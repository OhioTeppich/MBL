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
    meta.MetaData? metaData,
    this.viewMode = false,
    this.page = 1,
    this.reachedMaxPages = false,
  })  : meditations = meditations ?? [],
        metaData = metaData ?? meta.MetaData.empty;

  final List<Meditation> meditations;
  final meta.MetaData metaData;
  final MeditationStatus status;
  final bool viewMode;
  final int page;
  final bool reachedMaxPages;

  @override
  List<Object?> get props => [status, meditations, viewMode, reachedMaxPages];

  MeditationState copyWith({
    List<Meditation>? meditations,
    MeditationStatus? status,
    meta.MetaData? metaData,
    bool? viewMode,
    int? page,
    bool? reachedMaxPages,
  }) {
    return MeditationState(
      status: status ?? this.status,
      meditations: meditations ?? this.meditations,
      metaData: metaData ?? this.metaData,
      viewMode: viewMode ?? this.viewMode,
      page: page ?? this.page,
      reachedMaxPages: reachedMaxPages ?? this.reachedMaxPages,
    );
  }
}
