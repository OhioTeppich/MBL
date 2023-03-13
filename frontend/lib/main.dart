import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/app/app.widget.dart';
import 'package:mbl/utils/app-bloc.observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: App());
  }
}

