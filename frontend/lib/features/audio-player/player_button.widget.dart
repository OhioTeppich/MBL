import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mbl/themes/themes.dart';

Widget playerButton(PlayerState? playerState, AudioPlayer player) {
  final processingState = playerState?.processingState;
  if  (processingState == ProcessingState.loading ||
       processingState == ProcessingState.buffering) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          width: 60.0,
          height: 60.0,
          child: const CircularProgressIndicator(color: StandardColor.accentPrimaryButton,),
        );
       } else if (player.playing != true) {
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
          onPressed: () => player.seek(Duration.zero,
          index: player.effectiveIndices!.first), 
          icon: const Icon(Icons.replay),
          iconSize: 60.0,
          );
       }
}
