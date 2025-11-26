import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/categoryItem/cubit/catogry_item_state.dart';
import 'package:e_commerce/features/categoryItem/data/category_item_repo.dart';
import 'package:meta/meta.dart';


class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final CategoryProductsRepo repo;

  CategoryProductsCubit({required this.repo}) : super(CategoryProductsInitial());

  Future<void> fetchProducts(String url) async {
    emit(CategoryProductsLoading());

    try {
      final products = await repo.getProducts(url);
      emit(CategoryProductsLoaded(products));

    } catch (e) {
      emit(CategoryProductsError(e.toString()));
    }
  }
}
