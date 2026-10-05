class NoteModel {
  final int id;
  final String title;
  final String content;

  new({required this.id, required this.title, required this.content});

  factory NoteModel.fromJson(Map<String, dynamic> note) {
    return NoteModel(
      id: note['id'],
      title: note['title'],
      content: note['content'],
    );
  }


}
