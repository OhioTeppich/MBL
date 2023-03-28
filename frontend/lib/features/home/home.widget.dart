import 'package:flutter/material.dart';
import 'package:mbl/l10n/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Text(l10n.home),
    );
  }
}
