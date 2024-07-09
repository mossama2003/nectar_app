import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_app_test/core/app_helper/app_navigator.dart';
import 'package:nectar_app_test/core/constants/app_images.dart';
import 'package:nectar_app_test/view/screens/order_accepted_screen.dart';

import '../../controller/cart/cart_cubit.dart';
import '../../core/app_helper/show_bottom_sheet.dart';
import '../../core/app_helper/show_dialog.dart';
import '../../core/custom_widgets/custom_text_button.dart';
import '../../core/style/app_colors.dart';
import '../widgets/cart_items_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final CartCubit _cubit = CartCubit.get(context);

  @override
  void initState() {
    super.initState();
    _cubit.getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 60,
          child: const Center(
            child: Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        Divider(
          color: AppColors.lightGrey.withOpacity(0.2),
        ),
        const SizedBox(height: 10),
        const Expanded(
          child: CardItemsWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: CustomTextButton(
            text: 'Go to Checkout',
            onTap: () => showCustomBottomSheet(
              context,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => AppNavigator.pop(context),
                          child: SvgPicture.asset(AppImages.exitBlack),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Divider(
                      color: AppColors.lightGrey.withOpacity(0.2),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Text(
                          'Delivery',
                          style: TextStyle(
                            color: AppColors.mediumGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Select Method',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 15),
                        SvgPicture.asset(AppImages.rightArrow)
                      ],
                    ),
                    const SizedBox(height: 6),
                    Divider(
                      color: AppColors.lightGrey.withOpacity(0.2),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Text(
                          'Payment',
                          style: TextStyle(
                            color: AppColors.mediumGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(AppImages.paymentIcon),
                        const SizedBox(width: 15),
                        SvgPicture.asset(AppImages.rightArrow),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Divider(
                      color: AppColors.lightGrey.withOpacity(0.2),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Text(
                          'Promo Code',
                          style: TextStyle(
                            color: AppColors.mediumGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Pick discount',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 15),
                        SvgPicture.asset(AppImages.rightArrow)
                      ],
                    ),
                    const SizedBox(height: 6),
                    Divider(
                      color: AppColors.lightGrey.withOpacity(0.2),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Text(
                          'Total Cost',
                          style: TextStyle(
                            color: AppColors.mediumGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          '\$13.97',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 15),
                        SvgPicture.asset(AppImages.rightArrow)
                      ],
                    ),
                    const SizedBox(height: 6),
                    Divider(
                      color: AppColors.lightGrey.withOpacity(0.2),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'By placing an order you agree to our\n',
                            style: TextStyle(
                              color: AppColors.mediumGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: ' And ',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.mediumGrey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'Conditions',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    CustomTextButton(
                      text: 'Place Order',
                      onTap: () => AppNavigator.push(
                        context,
                        const OrderAcceptedScreen(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
