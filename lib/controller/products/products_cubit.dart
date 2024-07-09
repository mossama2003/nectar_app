import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data_source/remote/dio_helper.dart';
import '../../model/fav_model.dart';
import '../../model/products_model.dart';
import '../../core/data_source/end_points.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInitialState());

  static ProductsCubit get(BuildContext context) => BlocProvider.of(context);

  ProductsModel? productsData;
  FavModel? favDate;

  Future<void> getAllProducts() async {
    try {
      emit(ProductsLoadingState());
      final Response response = await DioHelper.get(endPoint: PRODUCTS);

      if (response.statusCode == 200) {
        productsData = ProductsModel.fromJson(response.data);
        emit(ProductsSuccessState());
      } else {
        emit(ProductsErrorState(errorMsg: 'Something went wrong!'));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(ProductsErrorState(errorMsg: e.toString()));
    }
  }

  Future<void> addToFav(int productId) async {
    try {
      emit(LoadingState());
      final Response response = await DioHelper.post(
        endPoint: FAV,
        data: {
          "product_id": productId,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        productsData!.data.firstWhere((item) => item.id == productId).isFav =
            true;

        emit(SuccessState());
      } else {
        emit(ErrorState(errorMsg: 'Something went wrong!'));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorState(errorMsg: e.toString()));
    }
  }

  Future<void> removeFromFav(int productId) async {
    try {
      emit(LoadingState());
      final Response response = await DioHelper.delete(
        endPoint: '$FAV/$productId',
      );

      if (response.statusCode == 200) {
        productsData!.data.firstWhere((item) => item.id == productId).isFav =
            false;
        emit(SuccessState());
      } else {
        emit(ErrorState(errorMsg: 'Something went wrong!'));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorState(errorMsg: e.toString()));
    }
  }

  Future<void> getAllFav() async {
    try {
      emit(LoadingState());
      final Response response = await DioHelper.get(
        endPoint: FAV,
      );

      if (response.statusCode == 200) {
        favDate = FavModel.fromJson(response.data);

        emit(SuccessState());
      } else {
        emit(ErrorState(errorMsg: 'Something went wrong!'));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorState(errorMsg: e.toString()));
    }
  }

  void favHandler(int productId) {
    if (productsData!.data.firstWhere((item) => item.id == productId).isFav) {
      removeFromFav(productId);
    } else {
      addToFav(productId);
    }
  }
}
