part of 'audio_player_cubit.dart';

enum AudioPlayerStatus { play, pause, seek }

class AudioPlayerState extends Equatable {
  const AudioPlayerState({
    this.status = AudioPlayerStatus.pause,
  });

  final AudioPlayerStatus status;

  @override
  List<Object> get props => [status];

  AudioPlayerState copyWith({
    AudioPlayerStatus? status,
  }) {
    return AudioPlayerState(
      status: status ?? this.status,
    );
  }
}
