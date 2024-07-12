import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controller/auth/auth_cubit.dart';
import '../../core/constants/app_images.dart';
import '../../core/constants/app_size.dart';
import '../../core/style/app_colors.dart';
import '../widgets/custom_icon_with_text.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/groceries_widget.dart';
import '../widgets/product_widget.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: SvgPicture.asset(AppImages.carrotLogo),
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 7),
              CustomIconWithText(
                icon: Icon(
                  Icons.waving_hand_outlined,
                  color: AppColors.darkGrey.withOpacity(0.8),
                ),
                text:
                    'Welcome ${AuthCubit.get(context).userName!}'.toUpperCase(),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkGrey.withOpacity(0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomInputField(
              hint: 'Search Store',
              prefix: Icon(Icons.search_rounded),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                      Text(
                        'Exclusive Offer',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 248,
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: ProductWidget(),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Best Selling',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 248,
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: ProductWidget(),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Groceries',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: AppSize.heightScale(context, 80),
                child: const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: GroceriesWidget(),
                ),
              ),
              SizedBox(height: AppSize.heightScale(context, 20)),
              const SizedBox(
                height: 248,
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: ProductWidget(),
                ),
              ),
              const SizedBox(height: 30),
            ],
          )
        ],
      ),
    );
  }
}
