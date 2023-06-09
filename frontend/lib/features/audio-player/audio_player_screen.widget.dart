import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mbl/features/audio-player/blur_image.widget.dart';
import 'package:mbl/features/audio-player/control_area.widget.dart';
import 'package:mbl/features/audio-player/position_data.model.dart';
import 'package:mbl/features/shared/media_app_bar.widget.dart';
import 'package:mbl/themes/themes.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({
    super.key,
    required this.title,
    required this.speaker,
    required this.audioUrl,
    required this.imageUrl,
  });

  final String title;
  final String speaker;
  final String audioUrl;
  final String imageUrl;

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer _player;
  late String _host;
  late PaletteColor colors;
  late String image;

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
    colors = PaletteColor(Colors.transparent, 2);
    _host = dotenv.get('HOST');
    image = 'http://$_host${widget.imageUrl}';
    _updatePaletts();
    init();
  }

  void _updatePaletts() async {
    final PaletteGenerator generator =
        await PaletteGenerator.fromImageProvider(NetworkImage(image));
    colors = generator.lightMutedColor ?? PaletteColor(Colors.transparent, 2);

    setState(() {});
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appBarHeight = screenHeight / 10;
    final controlAreaHeight = screenHeight / 3;
    final centerImage = screenHeight / 15;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return StreamBuilder<PlayerState>(
        stream: _player.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          if (playerState?.processingState == ProcessingState.loading ||
              playerState?.processingState == ProcessingState.buffering) {
            return const Scaffold(
              backgroundColor: StandardColor.primary,
              body: Center(
                child: CircularProgressIndicator(
                  color: StandardColor.accentPrimaryButton,
                ),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: StandardColor.primary,
              appBar: MediaAppBar(getPreferredSize: appBarHeight),
              body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: centerImage),
                    child: BlurImage(
                      colors: colors,
                      image: image,
                      screenWidth: screenWidth,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ControlArea(
                        widget: widget,
                        positionDataStream: _positionDataStream,
                        player: _player,
                        playerState: playerState,
                        controlAreaHeight: controlAreaHeight,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
