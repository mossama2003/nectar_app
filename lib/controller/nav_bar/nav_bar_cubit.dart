import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_app_test/view/screens/explore_screen.dart';

import '../../view/screens/cart_screen.dart';
import '../../view/screens/fav_screen.dart';
import '../../view/screens/home_screen_content.dart';
import '../../view/screens/account_screen.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitState());

  static NavBarCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreenContent(),
    const ExploreScreen(),
    const CartScreen(),
    const FavScreen(),
    const AccountScreen(),
  ];

  void changeNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }
}
