import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_app_test/controller/auth/auth_cubit.dart';
import 'package:nectar_app_test/controller/nav_bar/nav_bar_cubit.dart';

import 'package:nectar_app_test/core/style/app_theme.dart';
import 'package:nectar_app_test/view/screens/splash_screen.dart';
import 'controller/cart/cart_cubit.dart';
import 'controller/products/products_cubit.dart';
import 'core/data_source/local/cache_manager.dart';
import 'core/data_source/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => NavBarCubit()),
        BlocProvider(create: (context) => ProductsCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
        title: 'Nectar App',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
