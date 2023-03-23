import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/audio-player/audio_player_screen.widget.dart';
import 'package:mbl/features/meditation/bloc/meditation_bloc.dart';
import 'package:mbl/themes/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MeditationSuccess extends StatelessWidget {
  const MeditationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeditationBloc, MeditationState>(
      buildWhen: (previous, current) => current.status.isSuccess,
      builder: (context, state) {
        switch (state.status) {
          case MeditationStatus.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: StandardColor.accentPrimaryButton,
              ),
            );
          case MeditationStatus.success:
            return Scaffold(
                backgroundColor: StandardColor.primary,
                body: Center(
                  child: IconButton(
                    icon: const Icon(Icons.navigate_next),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioPlayerScreen(
                            title: state.meditations.first.title ?? 'Error',
                            speaker: state.meditations.first.speaker ?? 'Error',
                            audioUrl:
                                state.meditations.first.audio.url ?? 'Error',
                            coverUrl:
                                state.meditations.first.cover.url ?? 'Error',
                          ),
                        ),
                      );
                    },
                  ),
                ));
          case MeditationStatus.error:
            return ErrorWidget(AppLocalizations.of(context)!.errorWidgetLabel);
          case MeditationStatus.initial:
            return const Text('');
          default:
            return const Text('');
        }
      },
    );
  }
}
