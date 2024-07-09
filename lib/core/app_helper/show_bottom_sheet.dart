import 'package:flutter/material.dart';

import '../style/app_colors.dart';

Future<void> showCustomBottomSheet(BuildContext context, Widget widget) async {
  showModalBottomSheet(
    context: context,
    showDragHandle: false,
    barrierColor: AppColors.darkGrey.withOpacity(0.5),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(30),
    )),
    builder: (context) {
      return widget;
    },
  );
}
