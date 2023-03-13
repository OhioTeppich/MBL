import 'package:flutter/material.dart';
import 'package:mbl/features/pilates/bloc/pilates_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/pilates/pilates-success.widget.dart';

class PilatesScreen extends StatelessWidget {
  const PilatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PilatesBloc, PilatesState>(
      buildWhen: (previous, current) => current.status.isSuccess,
      builder: (context, state) {
        return const PilatesSuccess();
      },
    );
  }
}