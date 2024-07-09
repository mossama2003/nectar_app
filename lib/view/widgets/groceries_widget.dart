import 'package:flutter/material.dart';

import '../cards/groceries_card.dart';


class GroceriesWidget extends StatelessWidget {
  const GroceriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const GroceriesCard();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(width: 14.95);
      },
      itemCount: 2,
    );
  }
}
