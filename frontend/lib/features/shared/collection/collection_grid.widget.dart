import 'package:flutter/material.dart';
import 'package:mbl/features/shared/collection/card/card.dart';
import 'package:mbl/features/shared/collection/collection.widget.dart';
import 'package:mbl/themes/themes.dart';

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
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];
          if (index == widget.items.length - 1) {
            return FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 1500)),
              builder: (context, snapshot) {
                if (contentType == ContentType.audio &&
                    snapshot.connectionState == ConnectionState.done) {
                  return BackgroundCard(item: item);
                } else if (contentType == ContentType.video &&
                    snapshot.connectionState == ConnectionState.done) {
                  return ImageCard(item: item);
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 73, vertical: 50),
                    child: CircularProgressIndicator(
                      color: StandardColor.accent,
                    ),
                  );
                }
              },
            );
          }
          if (contentType == ContentType.audio) {
            return BackgroundCard(item: item);
          }
          if (contentType == ContentType.video) {
            return ImageCard(item: item);
          }
          return Container();
        },
        controller: _scrollController,
        itemCount: widget.items.length,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
