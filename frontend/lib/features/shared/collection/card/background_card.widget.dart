import 'package:flutter/material.dart';
import 'package:mbl/features/shared/collection/collection_item.model.dart';
import 'package:mbl/themes/themes.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    super.key,
    required this.item,
  });

  final CollectionItemModel item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (item.image != null) ...{
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
        },
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
              right: 10,
              bottom: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        item.title ?? '',
                        style: StandardText.body1,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.mic),
                    Text(
                      item.speaker ?? '',
                      style: StandardText.body1,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
