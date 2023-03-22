import 'package:flutter/material.dart';
import 'package:mbl/features/widget/media_app_bar.widget.dart';
import 'package:mbl/themes/themes.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({
    super.key,
    required this.title,
    });

  final String title;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColor.primary,
      appBar: const MediaAppBar(),
      body: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 50),
              Container(
                decoration: const BoxDecoration(color: StandardColor.secondary),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.title, style: StandardText.headline5.copyWith()),
                      const Icon(Icons.favorite_outline)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('More Exercises', style: StandardText.headline6,),
                    Row(
                      children: [
                        Text('Length', style: StandardText.body2,),
                        const Icon(Icons.keyboard_arrow_up)
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      )
    );
  }
}
