import 'package:dio/dio.dart';
import 'package:e_commerce/features/categoryItem/view/categroy_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/categrorys_cubit.dart';
import '../data/categroy_repo.dart';
import '../data/categroy_web_service.dart';

class CategroyView extends StatelessWidget {
  const CategroyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategrorysCubit(
            repo: CategroyRepo(
              categroyWebService: CategroyWebService(
                dio: Dio(),
              ),
            ),
          )..fetchAllCategories(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Categories",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),

        body: BlocBuilder<CategrorysCubit, CategrorysState>(
          builder: (context, state) {

            if (state is CategrorysLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CategrorysLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final item = state.categories[index];
              
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      
                      contentPadding: const EdgeInsets.all(18),
                      
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CategoryProductsView(
                              categoryName: item.name,
                              url: item.url,
                            ),
                          ),
                        );
                      },

                      leading: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.blue.shade100,
                        child: const Icon(
                          Icons.category,
                          color: Colors.black87,
                        ),
                      ),

                      title: Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      subtitle: Text(
                        item.slug,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),

                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    ),
                  );
                },
              );
            }

            if (state is CategrorysError) {
              return Center(
                child: Text(
                  "Error: ${state.message}",
                  style: const TextStyle(fontSize: 18, color: Colors.red),
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
