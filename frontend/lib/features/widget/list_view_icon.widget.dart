import 'package:flutter/material.dart';

class ListViewIcons extends StatelessWidget {
  const ListViewIcons({
    super.key,
    required this.grid,
    required this.list,
  });

  final Color grid;
  final Color list;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.grid_view_rounded, color: grid),
        const SizedBox(width: 5,),
        Icon(Icons.list, color: list, size: 30,),
      ],
    );
  }
}
