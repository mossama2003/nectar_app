import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_app_test/core/constants/app_size.dart';

import '../../core/constants/app_images.dart';
import '../../core/style/app_colors.dart';


class GroceriesCard extends StatelessWidget {
  const GroceriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 248,
        decoration: BoxDecoration(
          color: AppColors.softOrange.withOpacity(0.3),
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Image.asset(AppImages.pulses),
              const SizedBox(width: 15),
              const Text(
                'Pulses',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
