import 'package:dio/dio.dart';
import 'package:e_commerce/features/categoryItem/cubit/catogry_item_cubit.dart';
import 'package:e_commerce/features/categoryItem/cubit/catogry_item_state.dart';
import 'package:e_commerce/features/categoryItem/data/category_item_repo.dart';
import 'package:e_commerce/features/categoryItem/data/categroy_web_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoryProductsView extends StatelessWidget {
  final String categoryName;
  final String url;

  const CategoryProductsView({
    super.key,
    required this.categoryName,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryProductsCubit(
        repo: CategoryProductsRepo(
          webService: CategoryProductsWebService(
            dio: Dio(),
          ),
        ),
      )..fetchProducts(url),
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryName),
          centerTitle: true,
        ),

        body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
          builder: (context, state) {
            
            if (state is CategoryProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CategoryProductsLoaded) {
              final products = state.products;

              return GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final p = products[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 6,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: Image.network(
                            p.thumbnail,
                            height: 130,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            p.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),

                        const Spacer(),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Text(
                            "\$${p.price}",
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      ],
                    ),
                  );
                },
              );
            }

            if (state is CategoryProductsError) {
              return Center(
                child: Text(
                  "Error: ${state.message}",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
