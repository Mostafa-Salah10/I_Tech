import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:i_tech/features/home/data/models/note_model.dart';

import 'package:http/http.dart' as http;

class HomeRepo {
  Future<Either<String, List<NoteModel>>> getNotes() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://notesbackend-production-9eeb.up.railway.app/api/notes",
        ),
      );

      final List bodyList = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return right([...bodyList.map((note) => NoteModel.fromJson(note))]);
      } else {
        return left('Error When Fetch Notes');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Null>> deleteNote({required int noteId}) async {
    try {
      var response = await http.delete(
        headers: {'Content-Type': 'application/json'},
        Uri.parse(
          "https://notesbackend-production-9eeb.up.railway.app/api/notes/$noteId",
        ),
      );

      if (response.statusCode == 200) {
        return right(null);
      } else {
        return left(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
