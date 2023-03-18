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
        return Center(
          child: Column(
            children: [
              Text(state.selectedExercise.title ?? 'Pilates but no state :('),
              ElevatedButton(
                onPressed: () {
                  context.read<PilatesBloc>().add(
                        SelectPilatesExercises(
                            selected: PilatesExerciseMock.pilatesExerciseB),
                      );
                },
                child: const Text('Load Exercise B'),
              ),
            ],
          ),
        );
      },
    );
  }
}
