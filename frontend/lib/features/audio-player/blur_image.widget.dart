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
    final filterStrength = screenWidth * 0.1;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: screenWidth,
          height: screenWidth,
          decoration: BoxDecoration(
            color: colors.color.withOpacity(0.75),
            shape: BoxShape.circle,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: filterStrength,
            sigmaY: filterStrength,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: colors.color.withOpacity(0.75),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Image.network(
          image,
          width: screenWidth,
          height: screenWidth,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
