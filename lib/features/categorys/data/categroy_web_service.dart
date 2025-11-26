import 'package:dio/dio.dart';

class CategroyWebService {


final Dio _dio = Dio();
CategroyWebService({required Dio dio});


Future<Response> getallcategoryresponse( ) async {
//return await _dio.get('https://dummyjson.com/products/category-list');

    return await _dio.get('https://dummyjson.com/products/categories');
  }

}
