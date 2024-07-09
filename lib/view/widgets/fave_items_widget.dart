import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/products/products_cubit.dart';
import '../../core/style/app_colors.dart';
import '../cards/fav_item_card.dart';

class FaveItemsWidget extends StatelessWidget {
  const FaveItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsCubit cubit = ProductsCubit.get(context);
    return BlocBuilder<ProductsCubit, ProductsStates>(
        builder: (context, state) {
      if (state is LoadingState) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.green,
          ),
        );
      } else if (state is ErrorState) {
        return Center(
          child: Text(state.errorMsg),
        );
      }
      return ListView.separated(
        itemBuilder: (context, index) {
          return FavItemCard(
            data: cubit.favDate!.data[index],
          );
        },
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Divider(
            color: AppColors.lightGrey.withOpacity(0.5),
            indent: 12,
            endIndent: 12,
          ),
        ),
        itemCount: cubit.favDate!.data.length,
      );
    });
  }
}
