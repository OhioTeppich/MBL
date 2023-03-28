import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mbl/features/audio-player/blur_image.widget.dart';
import 'package:mbl/features/audio-player/control_area.widget.dart';
import 'package:mbl/features/audio-player/cubit/audio_player_cubit.dart';
import 'package:mbl/features/widget/media_app_bar.widget.dart';
import 'package:mbl/repository/models/position_data.model.dart';
import 'package:mbl/themes/themes.dart';
import 'package:palette_generator/palette_generator.dart';
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
    image = 'http://$_host${widget.coverUrl}';
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
    final centerImage = (MediaQuery.of(context).size.height / 14.0);
    return BlocProvider<AudioPlayerCubit>(
      create: (_) => AudioPlayerCubit(AudioPlayer()),
      child: StreamBuilder<PlayerState>(
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
                appBar: const MediaAppBar(),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: centerImage),
                      child: BlurImage(
                        colors: colors,
                        image: image,
                      ),
                    ),
                    ControlArea(
                        widget: widget,
                        positionDataStream: _positionDataStream,
                        player: _player,
                        playerState: playerState),
                  ],
                ),
              );
            }
          }),
    );
  }
}
