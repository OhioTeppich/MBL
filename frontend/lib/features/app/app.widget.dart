import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/app/app-layout.widget.dart';
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
          ],
          child: const AppLayout(),
        ),
      ),
    );
  }
}
