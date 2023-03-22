import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/audio-player/audio_player_screen.widget.dart';
import 'package:mbl/features/meditation/bloc/meditation_bloc.dart';
import 'package:mbl/features/widget/list_item.widget.dart';
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
              child: CircularProgressIndicator(color: StandardColor.accentPrimaryButton,),
            );
          case MeditationStatus.success:
            return Scaffold(
            backgroundColor: StandardColor.primary,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text('Meditation', style: StandardText.headline3.copyWith(color: StandardColor.headlineAccent),),
              actions: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.grid_view_rounded, color: StandardColor.accent,),
                        SizedBox(width: 5,),
                        Icon(Icons.list, color: StandardColor.textColor, size: 30,),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 1,
                    indent: 15,
                    endIndent: 15,
                    color: StandardColor.strokeColor,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.filter_alt, color: StandardColor.accent,),
                  ),
              ],
            ),
            body: ListView.builder(
              itemCount: state.meditations.length,
              itemBuilder: (BuildContext context, int index ) {
                return Center(
                  child: ListItem(
                    itemName: state.meditations[index].title ?? 'Error',
                    icon: Icons.mic,
                    onTaped: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AudioPlayerScreen(
                          title: state.meditations[index].title ?? 'Error', 
                          speaker: state.meditations[index].speaker ?? 'Error',
                          audioUrl: state.meditations[index].audio.url ?? 'Error',
                          coverUrl: state.meditations[index].cover.url ?? 'Error',
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            ),
          );
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
