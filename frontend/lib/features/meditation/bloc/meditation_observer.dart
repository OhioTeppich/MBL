import 'package:flutter_bloc/flutter_bloc.dart';

class MeditationObserver extends BlocObserver {
  const MeditationObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
  }
}
