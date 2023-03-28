import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/audio-player/audio_player_screen.widget.dart';
import 'package:mbl/features/pilates/bloc/pilates_bloc.dart';
import 'package:mbl/l10n/l10n.dart';

class PilatesSuccess extends StatelessWidget {
  const PilatesSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<PilatesBloc, PilatesState>(
      builder: (context, state) {
        switch (state.status) {
          case PilatesStatus.loading:
            return ElevatedButton(
              child: const Text('AudioPlayer'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AudioPlayerScreen(
                            title: 'title',
                            speaker: 'speaker',
                            audioUrl:
                                'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3',
                            coverUrl:
                                'http://192.168.178.41:1337/uploads/MBL_circle_only_1_b38693f243.png')));
              },
            );
          case PilatesStatus.success:
            return Center(
              child: ElevatedButton(
                child: const Text('AudioPlayer'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AudioPlayerScreen(
                              title: 'title',
                              speaker: 'speaker',
                              audioUrl:
                                  'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3',
                              coverUrl:
                                  'http://192.168.178.41:1337/uploads/MBL_circle_only_1_b38693f243.png')));
                },
              ),
            );
          case PilatesStatus.error:
            return Text(l10n.errorWidgetLabel);
          case PilatesStatus.initial:
            return const Text('');
          default:
            return const Text('');
        }
      },
    );
  }
}
