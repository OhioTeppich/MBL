import 'package:flutter/material.dart';
import 'package:mbl/features/shared/collection/card/card.dart';
import 'package:mbl/features/shared/collection/collection.widget.dart';

class CollectionGrid extends StatelessWidget {
  const CollectionGrid({
    super.key,
    required this.widget,
    required ScrollController scrollController,
    required this.contentType,
  }) : _scrollController = scrollController;

  final Collection widget;
  final ScrollController _scrollController;
  final ContentType contentType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];
          if (contentType == ContentType.audio) {
            return BackgroundCard(item: item);
          }
          if (contentType == ContentType.video) {
            return ImageCard(item: item);
          }
        },
        itemCount: widget.items.length,
        controller: _scrollController,
      ),
    );
  }
}
