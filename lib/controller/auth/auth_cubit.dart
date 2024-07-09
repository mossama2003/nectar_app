import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_helper/app_toast.dart';
import '../../core/data_source/local/cache_manager.dart';
import '../../params/auth_params.dart';
import '../../core/data_source/end_points.dart';
import '../../core/data_source/remote/dio_helper.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  String? userName;

  /// Login Method
  Future<void> login({
    required final AuthParams params,
  }) async {
    try {
      emit(AuthLoadingState());
      final Response response = await DioHelper.post(
        endPoint: LOGIN,
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        userName = response.data['user']['name'];
        showSuccessToast('Login Success!');
        CacheManager.saveData(key: TOKEN, value: response.data[TOKEN]);
        CacheManager.saveData(key: EMAIL, value: encode(params.email));
        CacheManager.saveData(key: PASSWORD, value: encode(params.password));
        emit(AuthSuccessState());
      } else {
        showErrorToast(response.data['message']);
        emit(AuthErrorState(response.data['message']));
      }
    } catch (e) {
      showErrorToast(e.toString());
      emit(AuthErrorState(e.toString()));
    }
  }

  /// Signup Method
  Future<void> signup({
    required final AuthParams params,
  }) async {
    try {
      emit(AuthLoadingState());
      final Response response = await DioHelper.post(
        endPoint: REGISTER,
        data: params.toJson(),
      );
      if (response.statusCode == 201) {
        showSuccessToast('Registered Success!');
        emit(AuthSuccessState());
      } else {
        // showErrorToast(response.data['message']);
        showErrorToast('Something went wrong plz try again!');
        emit(AuthErrorState('Something went wrong plz try again!'));
      }
    } catch (e) {
      showErrorToast(e.toString());
      emit(AuthErrorState(e.toString()));
    }
  }

  /// Logout Method
  Future<void> logout() async {
    try {
      final Response response = await DioHelper.post(
        endPoint: LOGOUT,
        data: {},
      );
      if (response.statusCode == 200) {
        CacheManager.removeData(key: TOKEN);
        CacheManager.removeData(key: EMAIL);
        CacheManager.removeData(key: PASSWORD);
        emit(AuthSuccessState());
      } else {
        showErrorToast('Something went wrong plz try again!');
        emit(AuthErrorState('Something went wrong plz try again!'));
      }
    } catch (e) {
      showErrorToast(e.toString());
      emit(AuthErrorState(e.toString()));
    }
  }

  String encode(final String text) {
    final Codec<String, String> base64Encode = utf8.fuse(base64);
    final String encoded = base64Encode.encode(text);
    return encoded;
  }

  String decode(final String text) {
    final Codec<String, String> base64Decode = utf8.fuse(base64);
    final String decoded = base64Decode.decode(text);
    return decoded;
  }
}
