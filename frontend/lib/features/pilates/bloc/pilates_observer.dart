import 'package:flutter_bloc/flutter_bloc.dart';

class PilatesObserver extends BlocObserver {
  const PilatesObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
  }
}
