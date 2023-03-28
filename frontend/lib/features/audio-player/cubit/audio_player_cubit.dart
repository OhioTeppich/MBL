import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

part 'audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  AudioPlayerCubit(this._player) : super(const AudioPlayerState());

  final AudioPlayer _player;

  Future<void> playAudio() async {
    await _player.play();
    emit(state.copyWith(status: AudioPlayerStatus.play));
  }

  void pause() {
    _player.pause();
    emit(state.copyWith(status: AudioPlayerStatus.pause));
  }

  void stop() {
    _player.seek(Duration.zero);
    emit(state.copyWith(status: AudioPlayerStatus.seek));
  }

  @override
  Future<void> close() {
    _player.dispose();
    return super.close();
  }
}
