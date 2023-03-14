import 'package:flutter/material.dart';
import 'package:mbl/features/app/app_screens.service.dart';
import 'package:mbl/features/app/bottom_navigation_bar.widget.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  // todo: move logic to navigation state. this should be a stateless widget
  int _currentIndex = 0;

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
    AppScreensService appScreensService = AppScreensService(context);

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: appScreensService.getWidgets(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTapCallback: changePage,
      ),
    );
  }
}
