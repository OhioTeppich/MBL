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
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 370,
          height: 370,
          decoration: BoxDecoration(
            color: colors.color.withOpacity(0.75),
            shape: BoxShape.circle,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 30.0,
            sigmaY: 30.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: colors.color.withOpacity(0.75),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Image.network(image),
      ],
    );
  }
}
