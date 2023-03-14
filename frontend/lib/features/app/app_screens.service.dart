import 'package:flutter/material.dart';
import 'package:mbl/features/app/screen.model.dart';
import 'package:mbl/features/home/home.widget.dart';
import 'package:mbl/features/pilates/pilates-screen.widget.dart';

class AppScreensService {
  final BuildContext context;
  late List<ScreenMetaData> screens;

  AppScreensService(this.context)
      : screens = [
          ScreenMetaData('Home', const HomePage()),
          ScreenMetaData('Pilates', const PilatesScreen()),
        ];

  List<Widget> getWidgets() {
    return screens.map((e) => e.widget).toList();
  }

  List<String> getTitles() {
    return screens.map((e) => e.title).toList();
  }

  String getTitle(int index) {
    return getTitles()[index];
  }

  Widget getWidget(int index) {
    return getWidgets()[index];
  }
}
