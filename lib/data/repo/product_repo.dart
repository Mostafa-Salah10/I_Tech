import 'package:dartz/dartz.dart';
import 'package:i_tech/data/models/product_model.dart';

abstract class ProductRepo {
  Future<Either<String, List<ProductModel>>> getProducts();
}
