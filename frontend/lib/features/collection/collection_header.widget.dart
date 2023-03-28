import 'package:flutter/material.dart';
import 'package:mbl/features/collection/list_grid_switch/list_grid_switch.settings.dart';
import 'package:mbl/features/collection/list_grid_switch/list_grid_switch.widget.dart';
import 'package:mbl/themes/themes.dart';

class CollectionHeader extends StatelessWidget implements PreferredSizeWidget {
  const CollectionHeader({
    super.key,
    required this.title,
    required this.listGridSwitchSettings,
  });

  final String title;
  final ListGridSwitchSettings listGridSwitchSettings;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: StandardText.headline3
            .copyWith(color: StandardColor.headlineAccent),
      ),
      actions: <Widget>[
        ListGridSwitch(listGridSwitchSettings: listGridSwitchSettings),
        const VerticalDivider(
          thickness: 1,
          indent: 15,
          endIndent: 15,
          color: StandardColor.strokeColor,
        ),
        GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.filter_alt,
            color: StandardColor.accent,
          ),
        ),
      ],
    );
  }
}
