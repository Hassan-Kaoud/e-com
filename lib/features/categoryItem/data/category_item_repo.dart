import 'package:e_commerce/features/categoryItem/data/categroy_web_service.dart';
import 'package:e_commerce/features/categoryItem/model/categroy_item_model.dart';

class CategoryProductsRepo {
  final CategoryProductsWebService webService;

  CategoryProductsRepo({required this.webService});

  Future<List<ProductModel>> getProducts(String url) async {
    try {
      final response = await webService.fetchCategoryProducts(url);

 
      List products = response.data["products"];

      return products.map((e) => ProductModel.fromJson(e)).toList();

    } catch (e) {
      
      rethrow;
    }
  }
}
