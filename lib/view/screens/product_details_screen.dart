import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar_app_test/core/custom_widgets/custom_text_button.dart';
import 'package:nectar_app_test/core/style/app_colors.dart';

import '../../controller/cart/cart_cubit.dart';
import '../../controller/products/products_cubit.dart';
import '../../core/constants/app_images.dart';
import '../../model/products_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.data,});

  final ProductData data;

  @override
  Widget build(BuildContext context) {
    final CartCubit cubit = CartCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 350,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffF2F3F2),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new),
                            onPressed: () => Navigator.pop(context),
                          ),
                          SvgPicture.asset(AppImages.share)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Image.network(
                          data.image,
                          errorBuilder: (context, error, _) {
                            return SvgPicture.asset(
                              AppImages.carrotLogo,
                              width: 120,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Text(
                      data.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const Spacer(),
                    BlocBuilder<ProductsCubit, ProductsStates>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () =>
                              ProductsCubit.get(context).favHandler(data.id),
                          child: Icon(
                            data.isFav
                                ? Icons.favorite_outlined
                                : Icons.favorite_border_sharp,
                            color: data.isFav ? Colors.red : Colors.black,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Text(
                      '\$${data.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Divider(
                  color: AppColors.darkGrey.withOpacity(0.2),
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    const Text(
                      'Product Detail',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 9.45),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
                  style: TextStyle(
                    color: AppColors.mediumGrey,
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 19),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Divider(
                  color: AppColors.darkGrey.withOpacity(0.2),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    const Text(
                      'Nutritions',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 33,
                      height: 18,
                    decoration: const BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text('100gr',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w900
                        ),),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(AppImages.rightArrow),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Divider(
                  color: AppColors.darkGrey.withOpacity(0.2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    const Text(
                      'Review',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.star,
                        size: 20,
                        color: Color(0xffF3603F),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.star,
                        size: 20,
                        color: Color(0xffF3603F),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.star,
                        size: 20,
                        color: Color(0xffF3603F),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.star,
                        size: 20,
                        color: Color(0xffF3603F),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.star,
                        size: 20,
                        color: Color(0xffF3603F),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(AppImages.rightArrow),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomTextButton(
                  onTap: () => CartCubit.get(context).addToCart(data.id),
                  text: 'Add To Basket',
                  ),
                ),
              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }
}
