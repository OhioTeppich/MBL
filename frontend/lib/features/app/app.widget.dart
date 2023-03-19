import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/app/app_layout.widget.dart';
import 'package:mbl/features/meditation/bloc/meditation_bloc.dart';
import 'package:mbl/features/pilates/bloc/pilates_bloc.dart';
import 'package:mbl/repository/mbl.repository.dart';
import 'package:mbl/repository/service/mbl.service.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: RepositoryProvider(
        create: (context) => MblRepository(service: MblService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<PilatesBloc>(
              create: (context) => PilatesBloc(
                mblRepository: context.read<MblRepository>(),
              )..add(GetPilatesExercises()),
            ),
            BlocProvider<MeditationBloc>(
              create: (context) => MeditationBloc(
                mblRepository: context.read<MblRepository>(),
              )..add(GetMeditationExercises()),
            ),
          ],
          child: const AppLayout(),
        ),
      ),
    );
  }
}
