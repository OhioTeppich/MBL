import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/navigation/app_screens.service.dart';
import 'package:mbl/features/navigation/bottom_navigation_bar.widget.dart';
import 'package:mbl/features/navigation/cubit/navigation_cubit.dart';

class Navigation extends StatelessWidget {
  Navigation({super.key});

  final _pageController = PageController(initialPage: 0);

  void changePage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppScreensService appScreensService = AppScreensService(context);
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) =>
                BlocProvider.of<NavigationCubit>(context).setActiveIndex(index),
            children: appScreensService.getWidgets(),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            onTapCallback: (int index) {
              BlocProvider.of<NavigationCubit>(context).setActiveIndex(index);
              changePage(index);
            },
            screens: appScreensService.screens,
          ),
        );
      },
    );
  }
}
