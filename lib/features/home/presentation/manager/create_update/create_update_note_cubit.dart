import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/features/home/data/models/note_model.dart';
import 'package:i_tech/features/home/data/repo/home_repo.dart';

part 'create_update_note_state.dart';

class CreateUpdateNoteCubit extends Cubit<CreateUpdateNoteState> {
  CreateUpdateNoteCubit({required this._homeRepo})
    : super(CreateUpdateNoteInitial());

  final HomeRepo _homeRepo;

  Future<void> addNote({required String title, required String content}) async {
    emit(AddNoteLoading());

    try {
      await _homeRepo.addNote(title: title, content: content);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errMsg: e.toString()));
    }
  }

  Future<void> updateNote({required NoteModel note}) async {
    emit(UpdateNoteLoading());

    try {
      await _homeRepo.updateNote(note: note);
      emit(UpdateNoteSuccess());
    } catch (e) {
      emit(UpdateNoteFailure(errMsg: e.toString()));
    }
  }
}
