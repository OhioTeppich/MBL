import 'package:flutter/material.dart';
import 'package:mbl/features/shared/collection/collection.widget.dart';
import 'package:mbl/themes/themes.dart';

class CollectionList extends StatelessWidget {
  const CollectionList({
    super.key,
    required this.widget,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final Collection widget;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final item = widget.items[index];
        if (index >= widget.items.length - widget.pageSize) {
          return FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 1500)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    ListTile(
                      tileColor: Colors.transparent,
                      splashColor: StandardColor.accent,
                      minLeadingWidth: 20,
                      leading: Icon(
                        item.icon,
                        color: StandardColor.infoIconColor,
                        size: 32,
                      ),
                      title:
                          Text(item.title ?? '', style: StandardText.body1Bold),
                      onTap: () => item.onClickCallback(),
                      // trailing: Icon(Icon.favorite),
                    ),
                    if (index == widget.items.length - 1) ...[
                      const SizedBox(height: 20),
                      widget.totalItems == widget.items.length
                          ? Text('No more enteries',
                              style: StandardText.captionNormal
                                  .copyWith(color: StandardColor.textColor))
                          : Text('Drag to Load more',
                              style: StandardText.captionNormal
                                  .copyWith(color: StandardColor.textColor))
                    ],
                  ],
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 195, vertical: 40),
                  child: CircularProgressIndicator(
                    color: StandardColor.accent,
                  ),
                );
              }
            },
          );
        }
        return ListTile(
          tileColor: Colors.transparent,
          splashColor: StandardColor.accent,
          minLeadingWidth: 20,
          leading: Icon(
            item.icon,
            color: StandardColor.infoIconColor,
            size: 32,
          ),
          title: Text(item.title ?? '', style: StandardText.body1Bold),
          onTap: () => item.onClickCallback,
          // trailing: Icon(Icon.favorite),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        color: StandardColor.strokeColor,
        thickness: 2,
        indent: 15,
        endIndent: 15,
        height: 5,
      ),
      itemCount: widget.items.length,
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
    );
  }
}
