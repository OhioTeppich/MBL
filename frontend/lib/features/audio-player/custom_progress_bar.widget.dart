import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mbl/features/audio-player/position_data.model.dart';
import 'package:mbl/themes/themes.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    super.key,
    required Stream<PositionData> positionDataStream,
    required AudioPlayer player,
  })  : _positionDataStream = positionDataStream,
        _player = player;

  final Stream<PositionData> _positionDataStream;
  final AudioPlayer _player;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PositionData>(
      stream: _positionDataStream,
      builder: (context, snapshot) {
        final positionData = snapshot.data;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ProgressBar(
            barHeight: 4.0,
            timeLabelPadding: 5.0,
            thumbRadius: 6.0,
            baseBarColor: StandardColor.strokeColor,
            bufferedBarColor: StandardColor.secondaryStrokeColor,
            progressBarColor: StandardColor.textColor,
            thumbColor: StandardColor.textColor,
            timeLabelTextStyle: StandardText.captionNormal,
            progress: positionData?.position ?? Duration.zero,
            buffered: positionData?.bufferedPosition ?? Duration.zero,
            total: positionData?.duration ?? Duration.zero,
            onSeek: _player.seek,
          ),
        );
      },
    );
  }
}
