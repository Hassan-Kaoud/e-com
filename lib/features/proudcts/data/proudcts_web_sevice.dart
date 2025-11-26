import 'package:dio/dio.dart';

class ProudctsWebSevice {
 final Dio dio;

  ProudctsWebSevice({required this.dio});

  Future<Response> getallproudctsresponse( ) async {


    return await dio.get('https://dummyjson.com/products');
  }
}
