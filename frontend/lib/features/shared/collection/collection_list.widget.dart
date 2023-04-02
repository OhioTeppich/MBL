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
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final item = widget.items[index];
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
    );
  }
}
