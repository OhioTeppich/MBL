import 'package:flutter_bloc/flutter_bloc.dart';

class MeditationCubit extends Cubit<bool> {
  MeditationCubit() : super(false);

  void switchState() => emit(!state);
}
