import 'dart:math';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mbl/mocks/meditation-exercise.mock.dart';
import 'package:mbl/themes/themes.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

/*class AudioPlayerScreen extends StatelessWidget {
  const AudioPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColor.primary,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          child: const Text('Back')),
      ),
    );
  }
}


      */

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
 late AudioPlayer _player;
  
Stream<PositionData> get _positionDataStream =>
  Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
    _player.positionStream,
    _player.bufferedPositionStream,
    _player.durationStream,
    (position, bufferedPosition, duration) => PositionData(
      position,
      bufferedPosition,
      duration ?? Duration.zero,
    ),
  );

 @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(
            "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3"
          )
        )
      );

    
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColor.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 90.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios, color: Colors.black, size: 16.0,),
                const SizedBox(width: 3.0,),
                Text('Back', style: StandardText.button,)
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 500,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
               color: StandardColor.textContrastColor),
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
                          children:[
                            Text('Yes to Life Meditation', style: StandardText.headline6,), // TODO: Fill with DATA
                            const SizedBox(height: 5,),
                            Text('Danielle', style: StandardText.subtitle2,),
                          ],
                        ),
                        const Icon(Icons.favorite_border_outlined) // Nur zum Testzweck
                      ],
                    ),
                  ),
                  const SizedBox(height: 19.0,),
                  CustomProgressBar(positionDataStream: _positionDataStream, player: _player),
                  const SizedBox(height: 44.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.replay_10_rounded),
                        iconSize: 60,
                      ),
                      const SizedBox(width: 27,),
                      StreamBuilder<PlayerState>(
                        stream: _player.playerStateStream,
                        builder: (context, snapshot) {
                          final playerState = snapshot.data;
                          return _playerButton(playerState);
                        }
                      ),
                      const SizedBox(width: 27,),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.forward_10_rounded),
                        iconSize: 60,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


Widget _playerButton(PlayerState? playerState) {
  final processingState = playerState?.processingState;
  if  (processingState == ProcessingState.loading ||
       processingState == ProcessingState.buffering) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          width: 64.0,
          height: 64.0,
          child: const CircularProgressIndicator(color: StandardColor.accentPrimaryButton,),
        );
       } else if (_player.playing != true) {
        return CircleAvatar(
          radius: 37.0,
          backgroundColor: StandardColor.accent,
          child: IconButton(
            onPressed: _player.play,
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
            onPressed: _player.pause,
            icon: const Icon(Icons.pause),
            iconSize: 60,
            color: StandardColor.textColor,
          ),
        );
       } else {
        return IconButton(
          onPressed: () => _player.seek(Duration.zero,
          index: _player.effectiveIndices!.first), 
          icon: const Icon(Icons.replay),
          iconSize: 64.0,
          );
       }
  }

}

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    super.key,
    required Stream<PositionData> positionDataStream,
    required AudioPlayer player,
  }) : _positionDataStream = positionDataStream, _player = player;

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
            barHeight: 2.0,
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

class PositionData {
  const PositionData(
    this.position,
    this.bufferedPosition,
    this.duration,
  );

  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}