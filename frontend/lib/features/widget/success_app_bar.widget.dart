 import 'package:flutter/material.dart';
import 'package:mbl/themes/themes.dart';

class SuccessAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SuccessAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text('Meditation', style: StandardText.headline3.copyWith(color: StandardColor.headlineAccent),),
      actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: const Row(
              children: [
                Icon(Icons.grid_view_rounded, color: StandardColor.accent,),
                SizedBox(width: 5,),
                Icon(Icons.list, color: StandardColor.textColor, size: 30,),
              ],
            ),
          ),
          const VerticalDivider(
            thickness: 1,
            indent: 15,
            endIndent: 15,
            color: StandardColor.strokeColor,
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.filter_alt, color: StandardColor.accent,),
          ),
      ],
    );
  }
}
