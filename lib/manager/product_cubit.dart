import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/get_products.dart';
import 'package:i_tech/manager/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductStateInit());

  Future<void> getProudctsFromApi() async {
    emit(GetProudctsLoading());

    var result = await getProducts();

    // if (result is Success<ProuductModel>) {
    //   emit(GetProudctsSuccess(products: result.result));
    // } else if (result is Error){
    //   emit(GetProudctsError(errorMsg: result.errMsg));
    // }

    result.fold(
      (error) {
        emit(GetProudctsError(errorMsg: error));
      },
      (products) {
        emit(GetProudctsSuccess(products: products));
      },
    );
  }
}
