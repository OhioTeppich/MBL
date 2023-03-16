import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/pilates/bloc/pilates_bloc.dart';
import 'package:mbl/mocks/pilates-exercise.mock.dart';

class PilatesSuccess extends StatelessWidget {
  const PilatesSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PilatesBloc, PilatesState>(
      buildWhen: (previous, current) => current.status.isSuccess,
      builder: (context, state) {
        if (state.status == PilatesStatus.success) {
          return Center(
            child: Column(
              children: [
                Text(state.pilatesExercises.first.title ??
                    'Pilates but no state :('),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('loading'),
          );
        }
      },
    );
  }
}
