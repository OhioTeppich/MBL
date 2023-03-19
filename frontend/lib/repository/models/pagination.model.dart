import 'package:json_annotation/json_annotation.dart';

part 'pagination.model.g.dart';

@JsonSerializable()
class Pagination {
  const Pagination(
      {required this.page,
      required this.pageSize,
      required this.pageCount,
      required this.total});

  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  static const empty = Pagination(page: 0, pageSize: 0, pageCount: 0, total: 0);

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
