import 'package:flutter/material.dart';
import 'package:mbl/features/collection/list_grid_switch/list_grid_switch.settings.dart';
import 'package:mbl/features/collection/list_view_icon.widget.dart';
import 'package:mbl/themes/themes.dart';

class ListGridSwitch extends StatelessWidget {
  const ListGridSwitch({
    super.key,
    required this.listGridSwitchSettings,
  });

  final ListGridSwitchSettings listGridSwitchSettings;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        listGridSwitchSettings
            .onToggleViewMode(!listGridSwitchSettings.viewMode);
      },
      child: Row(
        children: [
          listGridSwitchSettings.viewMode
              ? const ListViewIcons(
                  grid: StandardColor.textColor,
                  list: StandardColor.accent,
                )
              : const ListViewIcons(
                  grid: StandardColor.accent,
                  list: StandardColor.textColor,
                ),
        ],
      ),
    );
  }
}
