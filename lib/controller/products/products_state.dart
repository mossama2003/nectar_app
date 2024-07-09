part of 'products_cubit.dart';

abstract class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

class ProductsLoadingState extends ProductsStates {}

class ProductsSuccessState extends ProductsStates {}

class ProductsErrorState extends ProductsStates {
  final String errorMsg;

  ProductsErrorState({required this.errorMsg});
}

class LoadingState extends ProductsStates {}

class SuccessState extends ProductsStates {}

class ErrorState extends ProductsStates {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}