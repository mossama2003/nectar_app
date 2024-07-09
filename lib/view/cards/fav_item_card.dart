import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar_app_test/core/constants/app_images.dart';

import '../../core/app_helper/app_navigator.dart';
import '../../core/style/app_colors.dart';
import '../../model/cart_model.dart';
import '../screens/product_details_screen.dart';

class FavItemCard extends StatelessWidget {
  const FavItemCard({
    super.key,
    required this.data,
  });

  final Item data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: GestureDetector(
        onTap: () => AppNavigator.push(
          context,
          ProductDetailsScreen(
            data: data.product,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              data.product.image,
              width: 30,
            ),
            const SizedBox(width: 42),
            Column(
              children: [
                Text(
                  data.product.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5.83,
                ),
                const Text(
                  '355ml, Price',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGrey),
                ),
              ],
            ),
            const Spacer(),
            Text(
              '\$${data.product.price}',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black),
            ),
            const SizedBox(width: 16),
            SvgPicture.asset(
              AppImages.rightArrow,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );

    //   GestureDetector(
    //   onTap: () => AppNavigator.push(
    //       context,
    //       ProductDetailsScreen(
    //         data: data.product,
    //       )
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.all(12.0),
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Image.network(
    //           data.product.image,
    //           width: 40,
    //         ),
    //         const SizedBox(width: 12),
    //         Expanded(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 data.product.name,
    //                 style: const TextStyle(
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.w600,
    //                 ),
    //               ),
    //               const SizedBox(
    //                 height: 5,
    //               ),
    //               Text(
    //                 '\$${data.product.price}',
    //                 style: const TextStyle(
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.w500,
    //                     color: AppColors.lightGrey),
    //               ),
    //             ],
    //           ),
    //         ),
    //         const Icon(
    //           Icons.arrow_forward_ios,
    //           size: 18,
    //           color: AppColors.lightGrey,
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
