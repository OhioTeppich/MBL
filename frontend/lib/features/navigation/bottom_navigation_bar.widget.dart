import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/navigation/app_screen.model.dart';
import 'package:mbl/features/navigation/cubit/navigation_cubit.dart';
import 'package:mbl/themes/themes.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.onTapCallback, required this.screens});

  final Function onTapCallback;
  final List<ScreenMetaData> screens;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
      return BottomNavigationBar(
        currentIndex: state.activeIndex,
        onTap: (newIndex) => onTapCallback(newIndex),
        backgroundColor: StandardColor.secondary,
        selectedItemColor: StandardColor.accent,
        unselectedItemColor: StandardColor.textColor,
        items: List<BottomNavigationBarItem>.from(
          screens.map(
            (screen) => BottomNavigationBarItem(
              icon: Icon(screen.icon),
              label: screen.title,
            ),
          ),
        ),
      );
    });
  }
}
