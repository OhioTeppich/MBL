import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/pilates/bloc/pilates_bloc.dart';

class PilatesSuccess extends StatelessWidget {
  const PilatesSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PilatesBloc, PilatesState>(
      buildWhen: (previous, current) => current.status.isSuccess,
      builder: (context, state) {
        return Center(
          child: Text(state.pilatesExercises.last.title ?? 'Pilates but no state :('),
        );
      },
    );
  }
}
