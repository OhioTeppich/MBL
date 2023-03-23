import 'package:flutter_bloc/flutter_bloc.dart';

class PilatesCubit extends Cubit<bool> {
  PilatesCubit() : super(false);

  void switchState() => emit(!state);
}
