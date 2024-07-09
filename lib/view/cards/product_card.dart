import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../controller/cart/cart_cubit.dart';
import '../../core/app_helper/app_navigator.dart';
import '../../core/constants/app_images.dart';
import '../../core/style/app_colors.dart';
import '../../model/products_model.dart';
import '../screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.data});

  final ProductData data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigator.push(
          context,
          ProductDetailsScreen(
            data: data,
          )),
      child: Container(
        width: 173,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
          border: Border.all(color: AppColors.lightGrey.withOpacity(0.8)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  data.image,
                  width: 70,
                  height: 70,
                  errorBuilder: (context, error, _) {
                    return SvgPicture.asset(
                      AppImages.carrotLogo,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                data.name,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              ),
              const SizedBox(height: 5),
              Text(
                '1kg, Priceg',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.mediumGrey.withOpacity(0.8)),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    '\$${data.price}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => CartCubit.get(context).addToCart(data.id),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                      ),
                      child: const Icon(
                        Icons.add_rounded,
                        color: AppColors.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
