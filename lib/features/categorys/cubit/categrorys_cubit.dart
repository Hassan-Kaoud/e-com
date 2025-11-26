import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../data/categroy_repo.dart';
import '../model/categroy_model.dart';

part 'categrorys_state.dart';

class CategrorysCubit extends Cubit<CategrorysState> {
  final CategroyRepo repo;

  CategrorysCubit({required this.repo}) : super(CategrorysInitial());

  Future<void> fetchAllCategories() async {
    emit(CategrorysLoading());

    try {
      final data = await repo.getAllCategories();

      emit(CategrorysLoaded(data));

    } catch (e) {
     
      emit(CategrorysError(e.toString()));
    }
  }
}
