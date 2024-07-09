import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controller/auth/auth_cubit.dart';
import '../../core/app_helper/app_navigator.dart';
import '../../core/constants/app_images.dart';
import '../../core/data_source/end_points.dart';
import '../../core/data_source/local/cache_manager.dart';
import '../../core/style/app_colors.dart';
import '../../params/auth_params.dart';
import 'home_screen.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    autoLoginHandler();
  }

  void autoLoginHandler() {
    final AuthCubit cubit = AuthCubit.get(context);
    if (CacheManager.getDate(key: TOKEN) != null) {
      cubit
          .login(
        params: AuthParams(
          email: cubit.decode(CacheManager.getDate(key: EMAIL)),
          password: cubit.decode(CacheManager.getDate(key: PASSWORD)),
        ),
      )
          .then((value) {
        AppNavigator.pushRemove(context, const HomeScreen());
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        AppNavigator.pushRemove(context, const OnBoardingScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SvgPicture.asset(
          AppImages.splash,
        ),
      ),
    );
  }
}
