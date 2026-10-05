import 'package:flutter/material.dart';
import 'package:i_tech/features/home/data/models/note_model.dart';
import 'package:i_tech/features/home/presentation/widgets/update_note_body.dart';

class UpdateNoteScreen extends StatelessWidget {
  const UpdateNoteScreen({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Note",
          style: TextStyle(fontSize: 20, fontWeight: .bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: UpdateNoteBody(note: note),
        ),
      ),
    );
  }
}
