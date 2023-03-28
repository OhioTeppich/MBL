import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mbl/themes/themes.dart';

class PlayerButton extends StatelessWidget {
  const PlayerButton({
    super.key,
    required this.player,
    required this.playerState,
  });

  final PlayerState? playerState;
  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    final processingState = playerState?.processingState;
    if (player.playing != true) {
      return CircleAvatar(
        radius: 37.0,
        backgroundColor: StandardColor.accent,
        child: IconButton(
          onPressed: player.play,
          icon: const Icon(Icons.play_arrow_rounded),
          iconSize: 60,
          color: StandardColor.textColor,
        ),
      );
    } else if (processingState != ProcessingState.completed) {
      return CircleAvatar(
        radius: 37.0,
        backgroundColor: StandardColor.accent,
        child: IconButton(
          onPressed: player.pause,
          icon: const Icon(Icons.pause),
          iconSize: 60,
          color: StandardColor.textColor,
        ),
      );
    } else {
      return IconButton(
        onPressed: () =>
            player.seek(Duration.zero, index: player.effectiveIndices!.first),
        icon: const Icon(Icons.replay),
        iconSize: 60.0,
      );
    }
  }
}
