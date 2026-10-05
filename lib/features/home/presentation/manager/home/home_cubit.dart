import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/features/home/data/models/note_model.dart';
import 'package:i_tech/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this._homeRepo}) : super(HomeInitial());
  final HomeRepo _homeRepo;

  List<NoteModel> notes = [];

  Future<void> getNotes() async {
    emit(GetNotesLoading());
    try {
      final notes = await _homeRepo.getNotes();

      this.notes = notes;

      emit(GetNotsSuccess());
    } catch (e) {
      emit(GetNotesFailure(errMsg: e.toString()));
    }
  }

  Future<void> deleteNote({required int noteId}) async {
    emit(DeleteNoteLoading());
    final result = await _homeRepo.deleteNote(noteId: noteId);
    result.fold(
      (err) {
        emit(DeleteNoteFailure(errMsg: err));
      },
      (_) {
        notes.removeWhere((note) => note.id == noteId);
        emit(DeleteNoteSuccess());
      },
    );
  }
}
