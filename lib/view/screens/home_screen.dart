import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar_app_test/core/constants/app_images.dart';
import 'package:nectar_app_test/core/style/app_colors.dart';

import '../../controller/nav_bar/nav_bar_cubit.dart';
import '../../controller/products/products_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    ProductsCubit.get(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final NavBarCubit cubit = NavBarCubit.get(context);
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return BottomNavigationBar(
            selectedItemColor: AppColors.primaryColor,
            currentIndex: cubit.currentIndex,
            unselectedItemColor: AppColors.black,
            onTap: (index) => cubit.changeNavBarIndex(index),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.shop),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.favourite),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.account),
                label: 'Account',
              ),
            ],
          );
        },
      ),
      body: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return SafeArea(
            child: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
