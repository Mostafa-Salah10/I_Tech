import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/features/home/data/models/note_model.dart';
import 'package:i_tech/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this._homeRepo}) : super(HomeInitial());
  final HomeRepo _homeRepo;

  Future<void> getNotes() async {
    emit(GetNotesLoading());
    final result = await _homeRepo.getNotes();
    result.fold(
      (err) {
        emit(GetNotesFailure(errMsg: err));
      },
      (notes) {
        emit(GetNotsSuccess(notes: notes));
      },
    );
  }
}
