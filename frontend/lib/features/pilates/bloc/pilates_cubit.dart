import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/pilates/bloc/pilates_bloc.dart';

class PilatesCubit extends Cubit<PilatesState> {
  PilatesCubit() : super(PilatesState());

  void switchState() => emit(state.copyWith(view: !state.view));
}
