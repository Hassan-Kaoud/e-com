import 'package:dio/dio.dart';

class CategoryProductsWebService {
  final Dio dio;

  CategoryProductsWebService({required this.dio});

  Future<Response> fetchCategoryProducts(String url) async {
    return await dio.get(url);
  }
}
