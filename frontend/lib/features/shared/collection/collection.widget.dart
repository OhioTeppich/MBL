import 'package:flutter/material.dart';
import 'package:mbl/features/shared/collection/collection_grid.widget.dart';
import 'package:mbl/features/shared/collection/collection_list.widget.dart';
import 'package:mbl/features/shared/collection/collection_item.model.dart';
import 'package:mbl/themes/themes.dart';

enum ContentType { audio, video }

class Collection extends StatefulWidget {
  const Collection({
    super.key,
    required this.items,
    required this.viewMode,
    required this.contentType,
    required this.loadMoreCallback,
  });

  final List<CollectionItemModel> items;
  final Function loadMoreCallback;
  final bool viewMode;
  final ContentType contentType;

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          widget.viewMode
              ? CollectionGrid(
                  widget: widget,
                  scrollController: _scrollController,
                  contentType: widget.contentType,
                )
              : CollectionList(
                  widget: widget, scrollController: _scrollController),
          Text(
            'Drag up to Load more',
            style: StandardText.captionNormal
                .copyWith(color: StandardColor.secondaryTextColor),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) widget.loadMoreCallback();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
