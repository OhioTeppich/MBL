import 'package:flutter/material.dart';
import 'package:mbl/themes/themes.dart';

class MediaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MediaAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 90.0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 16.0,
              ),
              const SizedBox(
                width: 3.0,
              ),
              Text(
                'Back',
                style: StandardText.button,
              )
            ],
          ),
        ),
      ),
    );
  }
}
