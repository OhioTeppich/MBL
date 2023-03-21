import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/pilates/bloc/pilates_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mbl/features/video-player/video_player_screen.widget.dart';
import 'package:mbl/features/widget/list_item.widget.dart';
import 'package:mbl/themes/themes.dart';

class PilatesSuccess extends StatelessWidget {
  const PilatesSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PilatesBloc, PilatesState>(
      builder: (context, state) {
        switch (state.status) {
          case PilatesStatus.loading:
            return const Center(
              child: Text('loading'),
            );
          case PilatesStatus.success:
            return Scaffold(
              backgroundColor: StandardColor.primary,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text('Meditation', style: StandardText.headline3.copyWith(color: StandardColor.headlineAccent),
                ),
                actions: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.grid_view_rounded, color: StandardColor.accent,),
                  ),
                  const SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.list, color: StandardColor.textColor, size: 30,),
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
              body:ListView.builder(
              itemCount: state.pilatesExercises.length,
              itemBuilder: (BuildContext context, int index ) {
                return Center(
                  child: ListItem(
                    itemName: state.pilatesExercises[index].title ?? 'Error',
                    icon: Icons.videocam,
                    nextScreen: MaterialPageRoute(builder: (context) => const VideoPlayerScreen()),
                    //url: state.meditations[index].video?.url ?? 'Error',
                    ),
                  );
                }
              ),
                );
          case PilatesStatus.error:
            return ErrorWidget(AppLocalizations.of(context)!.errorWidgetLabel);
          case PilatesStatus.initial:
            return const Text('');
          default:
            return const Text('');
        }
      },
    );
  }
}
