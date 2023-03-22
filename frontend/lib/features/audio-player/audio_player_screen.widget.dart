import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mbl/features/audio-player/custom_progress_bar.widget.dart';
import 'package:mbl/features/audio-player/player_button.widget.dart';
import 'package:mbl/features/widget/media_app_bar.widget.dart';
import 'package:mbl/repository/models/position_data.model.dart';
import 'package:mbl/themes/themes.dart';
import 'package:rxdart/rxdart.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({
    super.key,
    required this.title,
    required this.speaker,
    required this.audioUrl,
    required this.coverUrl,
    });

  final String title;
  final String speaker;
  final String audioUrl;
  final String coverUrl;

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
 late AudioPlayer _player;
 late String _host;
  
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
    _host = dotenv.get('HOST');
    init();    
  }

  void init() async {
    _player = AudioPlayer();
    await _player.setUrl('http://$_host${widget.audioUrl}');
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
      appBar: const MediaAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.network('http://$_host${widget.coverUrl}'),
          const SizedBox(height: 30), // Hmmmm weg finden das Bild mittig zu machen
          Container(
            alignment: Alignment.bottomCenter,
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
                            Text(widget.title, style: StandardText.headline6,),
                            const SizedBox(height: 5,),
                            Text(widget.speaker, style: StandardText.subtitle2,),
                          ],
                        ),
                        const Icon(Icons.favorite_border_outlined)
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0,),
                  CustomProgressBar(positionDataStream: _positionDataStream, player: _player),
                  const SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          if(_player.position < const Duration(seconds: 10)){
                            _player.seek(Duration.zero);
                          } else {
                            _player.seek(_player.position - const Duration(seconds: 10));
                          } 
                        },
                        icon: const Icon(Icons.replay_10_rounded),
                        iconSize: 60,
                      ),
                      const SizedBox(width: 27),
                      StreamBuilder<PlayerState>(
                        stream: _player.playerStateStream,
                        builder: (context, snapshot) {
                          final playerState = snapshot.data;
                          return playerButton(playerState, _player);
                        }
                      ),
                      const SizedBox(width: 27),
                      IconButton(
                        onPressed: () {
                         if(_player.position > _player.duration! - const Duration(seconds: 10)){
                            _player.seek(_player.duration);
                          } else {
                            _player.seek(_player.position + const Duration(seconds: 10));
                          } 
                        },
                        icon: const Icon(Icons.forward_10_rounded),
                        iconSize: 60,
                      ),
                    ],
                  ),
                  const SizedBox(height: 80,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
