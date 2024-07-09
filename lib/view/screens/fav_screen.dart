import 'package:flutter/material.dart';

import '../../controller/products/products_cubit.dart';
import '../../core/custom_widgets/custom_text_button.dart';
import '../../core/style/app_colors.dart';
import '../widgets/fave_items_widget.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {

  @override
  void initState() {
    super.initState();
    ProductsCubit.get(context).getAllFav();
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
              'Favorite',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ),
        ),
        Divider(
          color: AppColors.lightGrey.withOpacity(0.2),
        ),
        const SizedBox(height: 10),
        const Expanded(
          child: FaveItemsWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: CustomTextButton(
            text: 'Add All To Cart',
            onTap: () {},
          ),
        )
      ],
    );
  }
}
