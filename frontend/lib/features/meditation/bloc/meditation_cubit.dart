import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/meditation/bloc/meditation_bloc.dart';

class MeditationCubit extends Cubit<MeditationState> {
  MeditationCubit() : super(MeditationState());

  void switchState() => emit(state.copyWith(view: !state.view));
}
