import 'package:flutter/material.dart';
import 'package:mbl/features/video-player/video_player_screen.widget.dart';
import 'package:mbl/themes/themes.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({
    super.key,
    required this.itemName,
    //required this.url,
  });

  final String itemName;
  //final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VideoPlayerScreen()),
      );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 27,
                  child: Row(
                    children: [
                      const Icon(Icons.videocam),
                      Container(width: 8.0),
                      Text(itemName ,style: StandardText.body1Bold,),
                    ],
                  ),
                ),
              const Icon(Icons.favorite_outline) // Nur zum Test
              ],
            ),
            const Divider(
              color: StandardColor.strokeColor,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
