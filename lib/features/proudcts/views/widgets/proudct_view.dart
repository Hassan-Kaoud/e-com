import 'package:e_commerce/features/proudcts/cubit/proudcts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProudctView extends StatelessWidget {
  ProudctView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
        elevation: 0,
      ),

      body: BlocProvider(
        create: (context) => ProudctsCubit()..fetchallproudcts(),

        child: BlocBuilder<ProudctsCubit, ProudctsState>(
          builder: (context, state) {
            if (state is ProudctsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProudctsFailure) {
              return Center(child: Text(state.errorMessage));
            }

            if (state is ProudctsSuccess) {
              return GridView.builder(
                padding: EdgeInsets.all(12.w),
                itemCount: state.proudcts.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.63,
                ),

                itemBuilder: (context, index) {
                  final item = state.proudcts[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ----------- PRODUCT IMAGE -----------
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                          child: Image.network(
                            item.image,
                            height: 150.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        SizedBox(height: 8.h),

                      
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),

                        const Spacer(),

                        // ----------- RATING + PRICE -----------
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                ],
                              ),
                              Text(
                                item.rate.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }

            return const Center(child: Text("Unexpected error"));
          },
        ),
      ),
    );
  }
}
