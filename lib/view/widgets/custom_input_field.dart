import 'package:flutter/material.dart';

import '../../core/style/app_colors.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({super.key, required this.hint, this.prefix});

  final String hint;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.mediumGrey.withOpacity(0.8),
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: prefix,
        prefixIconColor: AppColors.black,
        filled: true,
        fillColor: AppColors.antiFlashWhite.withOpacity(0.8),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
