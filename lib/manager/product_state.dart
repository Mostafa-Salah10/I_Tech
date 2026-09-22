import 'package:i_tech/models/prouduct_model.dart';

abstract class ProductState {}

class ProductStateInit extends ProductState {}

class GetProudctsLoading extends ProductState {}

class GetProudctsSuccess extends ProductState {
  final List<ProuductModel> products;

  new({required this.products});
}

class GetProudctsError extends ProductState {
  final String errorMsg;

  new({required this.errorMsg});
}
