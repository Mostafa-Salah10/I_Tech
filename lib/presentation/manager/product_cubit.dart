import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/data/models/product_model.dart';
import 'package:i_tech/data/repo/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _productRepo;
  ProductCubit({required this._productRepo}) : super(ProductInitial());

  Future<void> getProducts() async {
    emit(GetProductsLoading());

    final result = await _productRepo.getProducts();

    result.fold(
      (errorMsg) {
        emit(GetProductsFailure(errorMsg: errorMsg));
      },
      (products) {
        emit(GetProductsSuccess(products: products));
      },
    );
  }
}
