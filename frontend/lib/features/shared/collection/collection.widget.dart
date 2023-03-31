import 'package:flutter/material.dart';
import 'package:mbl/features/shared/collection/collection_item.settings.model.dart';

class Collection extends StatelessWidget {
  const Collection(
      {super.key, required this.items, required this.loadMoreCallback});

  final List<CollectionItemModel> items;
  final Function loadMoreCallback;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.from(
        items.map(
          (item) => Card(
            child: ListTile(
              leading: Icon(item.icon),
              title: Text(item.title ?? ''),
              onTap: () => item.onClickCallback,
              // trailing: Icon(Icon.favorite),
            ),
          ),
        ),
      ),
    );
  }
}
