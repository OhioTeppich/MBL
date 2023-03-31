import 'package:flutter/material.dart';

class CollectionItemModel {
  CollectionItemModel(this.title, this.icon, this.onClickCallback);

  final String? title;
  final IconData icon;
  final Function onClickCallback;
}
