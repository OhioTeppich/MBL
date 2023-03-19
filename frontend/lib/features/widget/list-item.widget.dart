import 'package:flutter/material.dart';
import 'package:mbl/features/audio-player/audio-player-screen.widget.dart';
import 'package:mbl/themes/themes.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.itemName,
  });

  final String itemName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AudioPlayerScreen()),
      );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          height: 27,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFF7F7F7F), // abstand Border anpassen
              ),
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.mic),
              Container(width: 10.0),
              Text(itemName ,style: StandardText.body1Bold,),
            ],
          ),
        ),
      ),
    );
  }
}