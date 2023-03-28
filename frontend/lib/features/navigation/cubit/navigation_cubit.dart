import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(activeIndex: 0));

  void setActiveIndex(int index) => emit(NavigationState(activeIndex: index));
}
