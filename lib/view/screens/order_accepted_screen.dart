import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_app_test/core/app_helper/app_navigator.dart';
import 'package:nectar_app_test/core/constants/app_images.dart';
import 'package:nectar_app_test/core/custom_widgets/custom_text_button.dart';
import 'package:nectar_app_test/core/style/app_colors.dart';

import '../widgets/blurred_colored_widget.dart';

class OrderAcceptedScreen extends StatelessWidget {
  const OrderAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const BlurredColoredWidget(withLogo: false),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SvgPicture.asset(AppImages.orderDone),
                    const SizedBox(height: 60),
                    const Text(
                      'Your Order has been\naccepted',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Your items has been placed and is on\nit’s way to being processed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.mediumGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomTextButton(text: 'Track Order', onTap: () {}),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () => AppNavigator.pop(context),
                      child: const Text(
                        'Back to home',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
