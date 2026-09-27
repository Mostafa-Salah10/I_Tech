import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:i_tech/data/models/product_model.dart';

class ProductRepo {
  final Dio dio;

  new({required this.dio});
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      var response = await dio.get('https://dummyjson.com/products');

      List<ProductModel> products = [];

      for (var product in response.data['products']) {
        products.add(ProductModel.fromJson(product));
      }

      return right(products);
    } on DioException catch (e) {
      ///handle any backend response
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }
}
