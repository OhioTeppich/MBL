import 'package:flutter/material.dart';

class StandardColor {
  static const Color primary =  BlushColors.blush3;
  static const Color secondary = BlushColors.blush5;
  
  static const Color accentPrimaryButton = CyanColors.cyan3;
  static const Color accent = CyanColors.cyan5;
  static const Color accentOnSeconday = CyanColors.cyan6;
  

  static const Color secondaryStrokeColor = OliveColors.olive4;
  static const Color strokeColor = OliveColors.olive5;
  static const Color headlineAccent = OliveColors.olive5;

  static const Color secondaryTextColor = GreyColors.grey3;
  static const Color infoIconColor = GreyColors.grey6;
  static const Color textColor = GreyColors.grey6;
  static const Color textContrastColor = Color(0xFFEEEDEB);
  

}

class GreyColors {
    static const Color grey0 = Color(0xFFDEDEDE);
    static const Color grey3 = Color(0xFF858585);
    static const Color grey6 = Color(0xFF3B3B3B);
}

class OliveColors {
  static const Color olive4 = Color(0xFF918E82);
  static const Color olive5 = Color(0xFF757263);
}

class CyanColors {
  static const Color cyan3 = Color(0xFFADC6C9);
  static const Color cyan5 = Color(0xFF77A0A5);
  static const Color cyan6 = Color(0xFF5F8084);
}

class BlushColors {
  static const Color blush3 = Color(0xFFEDE0D8);
  static const Color blush5 = Color(0xFFE1CCBE);
}

class StandardText {
  static TextStyle headline = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold,
    fontSize: 46,
    color: StandardColor.textColor,
    height: 0.95,
    letterSpacing: 0,
  );

  static TextStyle headline2 = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold,
    fontSize: 38,
    color: StandardColor.textColor,
    height: 0.97,
    letterSpacing: 0,
  );

  static TextStyle headline3 = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: StandardColor.textColor,
    height: 1.03,
    letterSpacing: 0,
  );

  static TextStyle headline4 = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: StandardColor.textColor,
    height: 1.04,
    letterSpacing: 0,
  );

  static TextStyle headline5 = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: StandardColor.textColor,
    height: 1.04,
    letterSpacing: 0,
  );

  static TextStyle headline6 = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: StandardColor.textColor,
    height: 1.05,
    letterSpacing: 0,
  );

  static TextStyle subtitle1 = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: StandardColor.textColor,
    height: 1,
    letterSpacing: 0,
  );

  static TextStyle subtitle2 = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: StandardColor.textColor,
    height: 1,
    letterSpacing: 0,
  );

  static TextStyle body1 = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: StandardColor.textColor,
    height: 1.25,
    letterSpacing: 0,
  );

  static TextStyle body2 = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: StandardColor.textColor,
    height: 1.14,
    letterSpacing: 0,
  );

  static TextStyle body1Italic = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    fontSize: 16,
    color: StandardColor.textColor,
    height: 1.25,
    letterSpacing: 0,
  );

  static TextStyle body2Italic = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    fontSize: 14,
    color: StandardColor.textColor,
    height:1.14,
    letterSpacing: 0,
  );

  static TextStyle body1Bold = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: StandardColor.textColor,
    height: 1.25,
    letterSpacing: 0,
  );

  static TextStyle body2Bold = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: StandardColor.textColor,
    height: 1.14,
    letterSpacing: 0,
  );

  static TextStyle button = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: StandardColor.textColor,
    height: 1.25,
    letterSpacing: 0,
  );

  static TextStyle captionNormal = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: StandardColor.textColor,
    height: 1.33,
    letterSpacing: 0.2,
  );

  static TextStyle captionBold = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold,
    fontSize: 12,
    color: StandardColor.textColor,
    height: 1.33,
    letterSpacing: 0.2,
  );

  static TextStyle overline = const TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    fontSize: 12,
    color: StandardColor.textColor,
    height: 1.33,
    letterSpacing: 0.2,
  );
}
