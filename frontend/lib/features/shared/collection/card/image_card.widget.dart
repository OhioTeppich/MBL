import 'package:flutter/material.dart';
import 'package:mbl/features/shared/collection/collection_item.model.dart';
import 'package:mbl/themes/themes.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.item,
  });

  final CollectionItemModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => item.onClickCallback(),
      child: Stack(
        children: [
          item.image != null && item.image?.url != null
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(item.image?.url ?? ''),
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              : Container(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
              right: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    item.title ?? '',
                    style: StandardText.body1.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
