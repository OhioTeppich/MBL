import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/navigation/cubit/navigation_cubit.dart';
import 'package:mbl/features/navigation/navigation.widget.dart';
import 'package:mbl/features/pilates/bloc/pilates_bloc.dart';
import 'package:mbl/l10n/l10n.dart';
import 'package:mbl/repository/mbl.repository.dart';
import 'package:mbl/repository/service/mbl.service.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
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
              BlocProvider(create: (context) => NavigationCubit()),
            ],
            child: Navigation(),
          ),
        ),
      ),
    );
  }
}
