import 'package:flutter/material.dart';
import 'package:i_tech/features/home/presentation/widgets/add_note_body.dart';

class AddNoteScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Note",
          style: TextStyle(fontSize: 20, fontWeight: .bold),
        ),
      ),
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.all(20), child: AddNoteBody()),
      ),
    );
  }
}
