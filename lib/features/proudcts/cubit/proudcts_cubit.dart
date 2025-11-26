import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/features/proudcts/data/proudct_repo.dart';
import 'package:e_commerce/features/proudcts/data/proudcts_web_sevice.dart';
import 'package:e_commerce/features/proudcts/models/proudct_model.dart';
import 'package:meta/meta.dart';

part 'proudcts_state.dart';

class ProudctsCubit extends Cubit<ProudctsState> {

ProudctRepo proudctRepo = ProudctRepo(proudctsWebSevice: ProudctsWebSevice(dio: Dio()));


  ProudctsCubit() : super(ProudctsInitial());


   fetchallproudcts() async {
   emit(ProudctsLoading());
   
   try {
    List<ProudctModel> proudctList = await  proudctRepo.getallproudcts();
    
  emit(ProudctsSuccess(proudcts : proudctList));

} on Exception catch (e) {


  emit(ProudctsFailure(errorMessage: e.toString()));
 
}
   
  }
}
