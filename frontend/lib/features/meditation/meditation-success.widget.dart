import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/collection/collection_header.widget.dart';
import 'package:mbl/features/collection/list_grid_switch/list_grid_switch.settings.dart';
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
              appBar: CollectionHeader(
                title: 'Meditation',
                listGridSwitchSettings: ListGridSwitchSettings(
                  (viewMode) {
                    context
                        .read<MeditationBloc>()
                        .add(ToggleViewMode(viewMode));
                  },
                  state.viewMode,
                ),
              ),
              body: const Column(),
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
