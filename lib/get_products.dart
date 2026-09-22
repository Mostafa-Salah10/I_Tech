import 'package:dio/dio.dart';
import 'package:i_tech/models/prouduct_model.dart';

Future<List<ProuductModel>> getProducts() async {
  var dio = Dio();

  try {
    var response = await dio.get('https://dummyjson.com/products');

    final List<ProuductModel> products = [];

    for (var product in response.data['products']) {
      products.add(ProuductModel.fromJson(product));
    }

    return products;
  } catch (e) {
    throw Exception("");
  }
}
