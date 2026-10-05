import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:i_tech/features/home/data/models/note_model.dart';

import 'package:http/http.dart' as http;

class HomeRepo {
  Future<List<NoteModel>> getNotes() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://notesbackend-production-9eeb.up.railway.app/api/notes",
        ),
      );

      final List bodyList = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // List<NoteModel> notes = [];

        // for (var note in bodyList) {
        //   notes.add(NoteModel.fromJson(note));
        // }

        // return notes;
        return [...bodyList.map((note) => NoteModel.fromJson(note))];
      } else {
        throw Exception('Error When Fetch Notes');
      }
    } catch (e) {
      throw Exception(e.toString());
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

  Future<void> updateNote({required NoteModel note}) async {
    try {
      var response = await http.put(
        headers: {'Content-Type': 'application/json'},
        Uri.parse(
          "https://notesbackend-production-9eeb.up.railway.app/api/notes/${note.id}",
        ),
        body: jsonEncode({'title': note.title, 'content': note.content}),
      );

      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception(body['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addNote({required String title, required String content}) async {
    try {
      var response = await http.post(
        headers: {'Content-Type': 'application/json'},
        Uri.parse(
          "https://notesbackend-production-9eeb.up.railway.app/api/notes",
        ),
        body: jsonEncode({'title': title, 'content': content}),
      );

      final body = jsonDecode(response.body);

      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(body['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
