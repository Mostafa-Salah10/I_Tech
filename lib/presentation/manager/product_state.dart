part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetProductsLoading extends ProductState {}

final class GetProductsFailure extends ProductState {
  final String errorMsg;

  new({required this.errorMsg});
}

final class GetProductsSuccess extends ProductState {
  final List<ProductModel> products;

  new({required this.products});
}
