import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_app_test/core/app_helper/app_navigator.dart';
import 'package:nectar_app_test/core/constants/app_images.dart';
import 'package:nectar_app_test/core/constants/app_size.dart';
import 'package:nectar_app_test/core/custom_widgets/custom_text_button.dart';
import 'package:nectar_app_test/core/style/app_colors.dart';
import 'package:nectar_app_test/view/screens/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.5, vertical: 74),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment(0.23, 0),
            fit: BoxFit.cover,
            image: AssetImage(AppImages.onBoarding),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(AppImages.whiteLogo),
            SizedBox(
              height: AppSize.heightScale(context, 15),
            ),
            const Text(
              'Welcome\nto our store',
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  height: 1.2),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: AppSize.heightScale(context, 5),
            ),
            const Text(
              'Ger your groceries in as fast as one hour',
              style: TextStyle(
                color: AppColors.lightGrey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: AppSize.heightScale(context, 25),
            ),
            CustomTextButton(
              text: 'Get Started',
              onTap: () => AppNavigator.push(context, const LoginScreen()),
            )
          ],
        ),
      ),
    );
  }
}
