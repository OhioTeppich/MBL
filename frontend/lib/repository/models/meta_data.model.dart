import 'package:json_annotation/json_annotation.dart';
import 'package:mbl/repository/models/pagination.model.dart';

part 'meta_data.model.g.dart';

@JsonSerializable(includeIfNull: false)
class MetaData {
  const MetaData({required this.pagination});
  final Pagination pagination;

  static const empty = MetaData(pagination: Pagination.empty);

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);
  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}
