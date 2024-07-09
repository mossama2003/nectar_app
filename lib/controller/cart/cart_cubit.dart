import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_helper/app_toast.dart';
import '../../core/data_source/end_points.dart';
import '../../core/data_source/remote/dio_helper.dart';
import '../../model/cart_model.dart';
import '../../params/add_to_cart_params.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  static CartCubit get(BuildContext context) => BlocProvider.of(context);

  CartModel? cartData;

  Future<void> addToCart(int productId) async {
    try {
      final Response response = await DioHelper.post(
        endPoint: ADD_CART,
        data: AddToCartParams(
          productId: productId,
          quantity: 1,
        ).toJson(),
      );

      if (response.statusCode == 200) {
        showSuccessToast('The product Added Successfully');
      } else {
        showErrorToast('Something went wrong!');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getCart() async {
    try {
      emit(CartLoadingState());
      final Response response = await DioHelper.get(
        endPoint: CART,
      );

      if (response.statusCode == 200) {
        cartData = CartModel.fromJson(response.data);
        emit(CartSuccessState());
      } else {
        emit(CartErrorState(errorMsg: 'Something went wrong!'));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(CartErrorState(errorMsg: e.toString()));
    }
  }

  // Future<void> placeOrder() async {
  //   try {
  //     if (cartData!.data.items.isNotEmpty) {
  //       final Response response = await DioHelper.post(
  //         endPoint: PLACE_ORDER,
  //         data: {},
  //       );
  //
  //       if (response.statusCode == 201) {
  //         showSuccessToast('The product Added Successfully');
  //         cartData!.data.items = [];
  //       } else {
  //         showErrorToast('Something went wrong!');
  //       }
  //     } else {
  //       showErrorToast('The Cart Is Empty Try To Add Products!');
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  Future<void> removeCartItem(int productId) async {
    try {
      final Response response = await DioHelper.delete(
        endPoint: '$CART_REMOVE/$productId',
      );

      if (response.statusCode == 200) {
        getCart();
        showSuccessToast('The product removed Successfully');
      } else {
        showErrorToast('Something went wrong!');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void increaseQuantity(int productId) {
    cartData!
        .data.items
        .firstWhere((item) => item.product.id == productId)
        .quantity += 1;
    emit(CartSuccessState());
  }

  void decreaseQuantity(int productId) {
    if (cartData!
        .data.items
        .firstWhere((item) => item.product.id == productId)
        .quantity >
        1) {
      cartData!
          .data.items
          .firstWhere((item) => item.product.id == productId)
          .quantity -= 1;
      emit(CartSuccessState());
    }
  }
}
