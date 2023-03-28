import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mbl/features/audio-player/audio_player_screen.widget.dart';
import 'package:mbl/features/audio-player/custom_progress_bar.widget.dart';
import 'package:mbl/features/audio-player/player_button.widget.dart';
import 'package:mbl/features/audio-player/position_data.model.dart';
import 'package:mbl/themes/themes.dart';

class ControlArea extends StatelessWidget {
  const ControlArea({
    super.key,
    required this.widget,
    required Stream<PositionData> positionDataStream,
    required AudioPlayer player,
    required this.playerState,
  })  : _positionDataStream = positionDataStream,
        _player = player;

  final AudioPlayerScreen widget;
  final Stream<PositionData> _positionDataStream;
  final AudioPlayer _player;
  final PlayerState? playerState;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: StandardColor.textContrastColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.73),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: StandardText.headline6,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.speaker,
                        style: StandardText.subtitle2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            CustomProgressBar(
              positionDataStream: _positionDataStream,
              player: _player,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (_player.position < const Duration(seconds: 10)) {
                      _player.seek(Duration.zero);
                    } else {
                      _player
                          .seek(_player.position - const Duration(seconds: 10));
                    }
                  },
                  icon: const Icon(Icons.replay_10_rounded),
                  iconSize: 60,
                ),
                const SizedBox(width: 27),
                PlayerButton(playerState: playerState, player: _player),
                const SizedBox(width: 27),
                IconButton(
                  onPressed: () {
                    if (_player.position >
                        _player.duration! - const Duration(seconds: 10)) {
                      _player.seek(_player.duration);
                    } else {
                      _player
                          .seek(_player.position + const Duration(seconds: 10));
                    }
                  },
                  icon: const Icon(Icons.forward_10_rounded),
                  iconSize: 60,
                ),
              ],
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
