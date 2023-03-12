import 'package:flutter/material.dart';
import 'package:frontends/themes/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColor.primary,
      body: Center(
        child: Text('Test', style: StandardText.headline,)

      ),
    );
  }
}