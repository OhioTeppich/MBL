import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/collection/collection_header.widget.dart';
import 'package:mbl/features/collection/list_grid_switch/list_grid_switch.settings.dart';
import 'package:mbl/features/pilates/bloc/pilates_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
              appBar: CollectionHeader(
                title: 'Pilates',
                listGridSwitchSettings: ListGridSwitchSettings(
                  (viewMode) {
                    context.read<PilatesBloc>().add(ToggleViewMode(viewMode));
                  },
                  state.viewMode,
                ),
              ),
              body: const Column(),
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
