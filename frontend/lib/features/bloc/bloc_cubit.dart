import 'package:bloc/bloc.dart';

class CubitBloc extends Cubit<bool> {
  CubitBloc() : super(false);

  void switchState() => emit(!state);
}
