import 'package:flutter/material.dart';
import 'package:mbl/themes/themes.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.itemName,
    required this.icon,
    required this.onTaped,
  });

  final String itemName;
  final IconData icon;
  final VoidCallback onTaped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTaped,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 27,
                  child: Row(
                    children: [
                      Icon(icon),
                      Container(width: 8.0),
                      Text(
                        itemName,
                        style: StandardText.body1Bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              color: StandardColor.strokeColor,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
