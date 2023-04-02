import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mbl/features/shared/collection/collection_item.model.dart';
import 'package:mbl/themes/themes.dart';

class ImageCard extends StatelessWidget {
  ImageCard({
    super.key,
    required this.item,
  });

  final CollectionItemModel item;
  final host = dotenv.get('HOST');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (item.image != null) ...{
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage('http://$host${item.image?.url}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        },
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.transparent,
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
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
        ),
      ],
    );
  }
}
