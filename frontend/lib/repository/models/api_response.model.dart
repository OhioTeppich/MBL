import 'package:mbl/repository/models/meta_data.model.dart';

class ApiResponse<T> {
  ApiResponse( {
    required this.data, 
    required this.metaData
  });
  
  final T data;
  final MetaData metaData;
}