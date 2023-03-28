import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            return const Center(
              child: Text('loading'),
            );
          case PilatesStatus.success:
            return Column();
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
