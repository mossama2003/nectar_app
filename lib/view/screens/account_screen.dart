import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_app_test/core/constants/app_images.dart';
import 'package:nectar_app_test/core/style/app_colors.dart';

import '../../controller/auth/auth_cubit.dart';
import '../../controller/auth/auth_states.dart';
import '../../core/app_helper/app_navigator.dart';
import '../../core/constants/app_size.dart';
import '../widgets/custom_button.dart';
import 'cart_screen.dart';
import 'onboarding_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          AppNavigator.pushRemove(context, const OnBoardingScreen());
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 63,
                    height: 63,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.photo),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(27)),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Mohamed Osama',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 10.15),
                          SvgPicture.asset(AppImages.edit),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'mossama370@gmail.com',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Divider(
                    color: AppColors.lightGrey.withOpacity(0.2),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () => AppNavigator.push(context, const CartScreen()),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppImages.orderIcons),
                        const SizedBox(width: 20),
                        const Text(
                          'Orders',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(AppImages.rightArrow),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Divider(
                    color: AppColors.lightGrey.withOpacity(0.2),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.myDetails),
                      const SizedBox(width: 20),
                      const Text(
                        'My Details',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(AppImages.rightArrow),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Divider(
                    color: AppColors.lightGrey.withOpacity(0.2),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.deliveryAddress),
                      const SizedBox(width: 20),
                      const Text(
                        'Delivery Address',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(AppImages.rightArrow),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Divider(
                    color: AppColors.lightGrey.withOpacity(0.2),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.paymentMethods),
                      const SizedBox(width: 20),
                      const Text(
                        'Payment Methods',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(AppImages.rightArrow),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Divider(
                    color: AppColors.lightGrey.withOpacity(0.2),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.promoCode),
                      const SizedBox(width: 20),
                      const Text(
                        'Promo Code',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(AppImages.rightArrow),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Divider(
                    color: AppColors.lightGrey.withOpacity(0.2),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.notification),
                      const SizedBox(width: 20),
                      const Text(
                        'Notification',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(AppImages.rightArrow),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Divider(
                    color: AppColors.lightGrey.withOpacity(0.2),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.help),
                      const SizedBox(width: 20),
                      const Text(
                        'Help',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(AppImages.rightArrow),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Divider(
                    color: AppColors.lightGrey.withOpacity(0.2),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.about),
                      const SizedBox(width: 20),
                      const Text(
                        'About',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(AppImages.rightArrow),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Divider(
                    color: AppColors.lightGrey.withOpacity(0.2),
                  ),
                  const SizedBox(height: 42),
                  CustomButton(
                    onTap: () => AuthCubit.get(context).logout(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppImages.logOut),
                        const SizedBox(width: 10),
                        Text(
                          'Log Out',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: AppSize.textScale(context, 16),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: AppSize.widthScale(context, 5),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
