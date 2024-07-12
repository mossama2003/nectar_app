import 'package:flutter/material.dart';
import 'package:nectar_app_test/core/constants/app_images.dart';

import '../../core/style/app_colors.dart';
import '../widgets/custom_input_field.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Find Products',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 21),
              child: CustomInputField(
                hint: 'Search Store',
                prefix: Icon(Icons.search_rounded),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 170,
                  height: 180,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.2),
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(18))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                      right: 31,
                      left: 31,
                    ),
                    child: Column(
                      children: [
                        Image.asset(AppImages.fruits),
                        const SizedBox(height: 20),
                        const Text(
                          'Fresh Fruits\n& Vegetable',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 170,
                  height: 180,
                  decoration: BoxDecoration(
                      color: AppColors.softOrange.withOpacity(0.2),
                      border: Border.all(
                        color: AppColors.softOrange,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(18))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 5,
                      right: 31,
                      left: 31,
                    ),
                    child: Column(
                      children: [
                        Image.asset(AppImages.oil),
                        const SizedBox(height: 20),
                        const Text(
                          'Cooking Oil\n&Ghee',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 170,
                  height: 180,
                  decoration: BoxDecoration(
                      color: AppColors.darkSalmon.withOpacity(0.2),
                      border: Border.all(
                        color: AppColors.darkSalmon,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(18))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                      right: 31,
                      left: 31,
                    ),
                    child: Column(
                      children: [
                        Image.asset(AppImages.meat),
                        const SizedBox(height: 20),
                        const Text(
                          'Meat & Fish',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 170,
                    height: 180,
                    decoration: BoxDecoration(
                        color: AppColors.plum.withOpacity(0.2),
                        border: Border.all(
                          color: AppColors.plum,
                          width: 2,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(18))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 10,
                        right: 20,
                        left: 20,
                      ),
                      child: Column(
                        children: [
                          Image.asset(AppImages.bakery),
                          const SizedBox(height: 20),
                          const Text(
                            'Bakery & Snacks',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 170,
                  height: 180,
                  decoration: BoxDecoration(
                      color: AppColors.khaki.withOpacity(0.2),
                      border: Border.all(
                        color: AppColors.khaki,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(18))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                      right: 31,
                      left: 31,
                    ),
                    child: Column(
                      children: [
                        Image.asset(AppImages.dairy),
                        const SizedBox(height: 20),
                        const Text(
                          'Dairy & Eggs',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 170,
                  height: 180,
                  decoration: BoxDecoration(
                      color: AppColors.lightBlue.withOpacity(0.2),
                      border: Border.all(
                        color: AppColors.lightBlue,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(18))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                      right: 31,
                      left: 31,
                    ),
                    child: Column(
                      children: [
                        Image.asset(AppImages.beverages),
                        const SizedBox(height: 20),
                        const Text(
                          'Beverages',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
