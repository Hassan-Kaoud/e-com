import 'package:e_commerce/features/categoryItem/model/categroy_item_model.dart';
import 'package:meta/meta.dart';

@immutable
sealed class CategoryProductsState {}

class CategoryProductsInitial extends CategoryProductsState {}

class CategoryProductsLoading extends CategoryProductsState {}

class CategoryProductsLoaded extends CategoryProductsState {
  final List<ProductModel> products;

  CategoryProductsLoaded(this.products);
}

class CategoryProductsError extends CategoryProductsState {
  final String message;

  CategoryProductsError(this.message);
}
