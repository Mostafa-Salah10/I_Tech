import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;

class AuthRepo {
  Future<Either<String, Null>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var response = await http.post(
        Uri.parse(
          'https://notesbackend-production-9eeb.up.railway.app/api/signup',
        ),

        headers: {'Content-Type': 'application/json'},

        body: jsonEncode({"name": name, "email": email, "password": password}),
      );

      log(response.body);

      var body = jsonDecode(response.body);

      if (response.statusCode == 201) {
        return Right(null);
      } else {
        return left(body['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Null>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var response = await http.post(
        Uri.parse(
          'https://notesbackend-production-9eeb.up.railway.app/api/login',
        ),
        headers: {'Content-Type': 'application/json'},

        body: jsonEncode({"email": email, "password": password}),
      );

      var body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return Right(null);
      } else {
        return left(body['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
