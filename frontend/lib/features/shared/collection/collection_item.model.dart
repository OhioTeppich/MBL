import 'package:flutter/material.dart';
import 'package:mbl/repository/models/image.model.dart' as model;

class CollectionItemModel {
  CollectionItemModel(
    this.title,
    this.icon,
    this.image,
    this.speaker,
    this.onClickCallback,
  );

  final String? title;
  final IconData icon;
  final model.Image? image;
  final String? speaker;
  final Function onClickCallback;
}
