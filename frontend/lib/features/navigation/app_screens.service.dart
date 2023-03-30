import 'package:flutter/material.dart';
import 'package:mbl/features/home/home.widget.dart';
import 'package:mbl/features/meditation/meditation-screen.widget.dart';
import 'package:mbl/features/navigation/app_screen.model.dart';
import 'package:mbl/features/pilates/pilates_screen.widget.dart';
import 'package:mbl/l10n/l10n.dart';

class AppScreensService {
  final BuildContext context;
  late List<ScreenMetaData> screens;

  AppScreensService(this.context)
      : screens = [
          ScreenMetaData(context.l10n.home, const HomePage(), Icons.home),
          ScreenMetaData(
              context.l10n.pilates, const PilatesScreen(), Icons.sports),
          ScreenMetaData(
              context.l10n.meditation, const MeditationScreen(), Icons.spa),
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
