import 'package:flutter/material.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function onTapCallback;


  const CustomBottomNavigationBar({super.key, required this.currentIndex, required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Meditation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Pilates',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          onTapCallback(index);
        },
      );
  }
}