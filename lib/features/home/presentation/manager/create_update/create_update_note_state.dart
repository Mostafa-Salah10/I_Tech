part of 'create_update_note_cubit.dart';

sealed class CreateUpdateNoteState {}

final class CreateUpdateNoteInitial extends CreateUpdateNoteState {}

final class AddNoteLoading extends CreateUpdateNoteState {}

final class AddNoteSuccess extends CreateUpdateNoteState {}

final class AddNoteFailure extends CreateUpdateNoteState {
  final String errMsg;

  new({required this.errMsg});
}

final class UpdateNoteLoading extends CreateUpdateNoteState {}

final class UpdateNoteSuccess extends CreateUpdateNoteState {}

final class UpdateNoteFailure extends CreateUpdateNoteState {
  final String errMsg;

  new({required this.errMsg});
}
