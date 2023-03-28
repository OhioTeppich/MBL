import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BlurImage extends StatelessWidget {
  const BlurImage({
    super.key,
    required this.colors,
    required this.image,
  });

  final PaletteColor colors;
  final String image;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width / 1.2;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: colors.color,
              spreadRadius: 30,
              blurRadius: 40,
            ),
          ]),
          child: Image.network(
            image,
            width: screenWidth,
            height: screenWidth,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
