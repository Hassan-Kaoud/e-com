import 'package:dio/dio.dart';
import '../model/categroy_model.dart';
import 'categroy_web_service.dart';

class CategroyRepo {
  final CategroyWebService categroyWebService;

  CategroyRepo({required this.categroyWebService});

  Future<List<CategroyModel>> getAllCategories() async {
    try {
      final response = await categroyWebService.getallcategoryresponse();
      List data = response.data;

      return data.map((e) => CategroyModel.fromdata(e)).toList();

    } catch (e) {
     
      rethrow;
    }
  }
}
