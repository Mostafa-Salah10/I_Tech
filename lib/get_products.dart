import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:i_tech/models/prouduct_model.dart';

Future<Either<String, List<ProuductModel>>> getProducts() async {
  var dio = Dio();

  try {
    var response = await dio.get('https://dummyjson.com/products');

    final List<ProuductModel> products = [];

    for (var product in response.data['products']) {
      products.add(ProuductModel.fromJson(product));
    }

    // return Success<ProuductModel>(result: products);

    return right(products);
  } on DioException catch (e) {
    // return Error(errMsg: e.toString());

    return left(e.toString());
  } catch (e) {
    // return Error(errMsg: e.toString());
    return left(e.toString());
  }
}

// class Result {}

// class Error extends Result {
//   final String errMsg;

//   new({required this.errMsg});
// }

// class Success<T> extends Result {
//   final List<T> result;

//   new({required this.result});
// }

// Future<List<PostModel>> getPosts() async {
//   try {
//     var response = await http.get(Uri.parse('https://dummyjson.com/posts'));

//     if (response.statusCode == 200) {
//       var jsonData = jsonDecode(response.body);

//       List<PostModel> posts = [];

//       for (var post in jsonData['posts']) {
//         posts.add(PostModel.fromJson(post));
//       }

//       return posts;
//     } else {

//     final errmsg=JsonDecode(response.body)['errormsg']
//       throw Exception('Error From Status code block');
//     }
//   } catch (e) {
//     throw Exception('Error From Try Block');
//   }
// }
