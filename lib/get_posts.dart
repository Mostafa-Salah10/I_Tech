import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<PostModel>> getPosts() async {
  try {
    var response = await http.get(Uri.parse('https://dummyjson.com/posts'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      List<PostModel> posts = [];

      for (var post in jsonData['posts']) {
        posts.add(PostModel.fromJson(post));
      }

      return posts;
    } else {
      throw Exception('Error From Status code block');
    }
  } catch (e) {
    throw Exception('Error From Try Block');
  }
}

class PostModel {
  final int id;
  final String title;
  final String body;

  new({required this.id, required this.title, required this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(body: json['body'], id: json['id'], title: json['title']);
  }
}
