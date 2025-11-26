import 'package:dio/dio.dart';
import 'package:e_commerce/features/proudcts/data/proudcts_web_sevice.dart';
import 'package:e_commerce/features/proudcts/models/proudct_model.dart';

class ProudctRepo {
  final ProudctsWebSevice proudctsWebSevice;
  List<ProudctModel> proudctList = [];
  ProudctRepo({required this.proudctsWebSevice});

  Future<List<ProudctModel>> getallproudcts() async {
    Response response = await proudctsWebSevice.getallproudctsresponse();
        List products = response.data['products']; 

    for (var product in products ) {
      
      proudctList.add(ProudctModel.fromdata(product));
    
    }
    
    return proudctList;
  }
}
