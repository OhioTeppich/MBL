import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/pilates/bloc/pilates_bloc.dart';
import 'package:mbl/features/shared/collection/collection.widget.dart';
import 'package:mbl/features/shared/collection/collection_header.widget.dart';
import 'package:mbl/features/shared/collection/collection_item.settings.model.dart';
import 'package:mbl/features/shared/list_grid_switch/list_grid_switch.settings.dart';
import 'package:mbl/l10n/l10n.dart';
import 'package:mbl/themes/themes.dart';

class PilatesSuccess extends StatelessWidget {
  const PilatesSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<PilatesBloc, PilatesState>(
      builder: (context, state) {
        switch (state.status) {
          case PilatesStatus.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: StandardColor.accentPrimaryButton,
              ),
            );
          case PilatesStatus.success:
            return Scaffold(
              backgroundColor: StandardColor.primary,
              appBar: CollectionHeader(
                title: l10n.pilates,
                listGridSwitchSettings: ListGridSwitchSettings(
                  (viewMode) {
                    context.read<PilatesBloc>().add(ToggleViewMode(viewMode));
                  },
                  state.viewMode,
                ),
              ),
              body: Collection(
                items: List.from(
                  state.pilatesExercises.map(
                    (item) => CollectionItemModel(
                      item.title,
                      Icons.videocam,
                      () {
                        // context.read<PilatesBloc>().add( navigate to audio or video player );
                      },
                    ),
                  ),
                ),
                loadMoreCallback: () {
                  // context.read<PilatesBloc>().add( call load more event );
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
