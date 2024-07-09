import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../controller/products/products_cubit.dart';
import '../../core/style/app_colors.dart';
import '../cards/product_card.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsCubit cubit = ProductsCubit.get(context);
    return BlocBuilder<ProductsCubit, ProductsStates>(
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.green),
          );
        } else if (state is ProductsErrorState) {
          return Center(
            child: Text(
              state.errorMsg,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          );
        }
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductCard(
              data: cubit.productsData!.data[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 15);
          },
          itemCount: cubit.productsData!.data.length,
        );
      },
    );
  }
}
