import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/audio-player/audio_player_screen.widget.dart';
import 'package:mbl/features/meditation/bloc/meditation_bloc.dart';
import 'package:mbl/features/shared/collection/collection.widget.dart';
import 'package:mbl/features/shared/collection/collection_header.widget.dart';
import 'package:mbl/features/shared/collection/collection_item.model.dart';
import 'package:mbl/features/shared/list_grid_switch/list_grid_switch.settings.dart';
import 'package:mbl/l10n/l10n.dart';
import 'package:mbl/themes/themes.dart';

class MeditationSuccess extends StatelessWidget {
  const MeditationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<MeditationBloc, MeditationState>(
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
              appBar: CollectionHeader(
                title: l10n.meditation,
                listGridSwitchSettings: ListGridSwitchSettings(
                  (viewMode) {
                    context
                        .read<MeditationBloc>()
                        .add(ToggleViewMode(viewMode));
                  },
                  state.viewMode,
                ),
              ),
              body: Collection(
                viewMode: state.viewMode,
                totalItems: state.metaData.pagination.total,
                items: List.from(
                  state.meditations.map(
                    (item) => CollectionItemModel(
                      item.title,
                      Icons.mic,
                      item.image,
                      item.speaker,
                      () {
                        //context.read<MeditationBloc>().add();
                      },
                    ),
                  ),
                ),
                contentType: ContentType.audio,
                loadMoreCallback: () {
                  context.read<MeditationBloc>().add(GetMeditation());
                },
              ),
            );
          case MeditationStatus.error:
            return ErrorWidget(l10n.errorWidgetLabel);
          case MeditationStatus.initial:
            return const Text('');
          default:
            return const Text('');
        }
      },
    );
  }
}
