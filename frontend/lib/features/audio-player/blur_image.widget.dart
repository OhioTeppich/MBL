import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BlurImage extends StatelessWidget {
  const BlurImage({
    super.key,
    required this.colors,
    required this.image,
    required this.screenWidth,
  });

  final PaletteColor colors;
  final String image;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: colors.color,
                    blurRadius: 100,
                    spreadRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: Image.network(
                image,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
