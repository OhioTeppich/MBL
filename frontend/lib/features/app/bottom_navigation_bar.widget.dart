import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function onTapCallback;


  const CustomBottomNavigationBar({super.key, required this.currentIndex, required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.message),
            label: AppLocalizations.of(context)!.meditation,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.message),
            label: AppLocalizations.of(context)!.pilates,
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          onTapCallback(index);
        },
      );
  }
}