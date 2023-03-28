part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  const NavigationState({required this.activeIndex});

  final int activeIndex;

  @override
  List<Object?> get props => [activeIndex];
}
