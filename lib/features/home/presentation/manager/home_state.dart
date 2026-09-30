part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetNotesLoading extends HomeState {}

final class GetNotesFailure extends HomeState {
  final String errMsg;

  new({required this.errMsg});
}

final class GetNotsSuccess extends HomeState {
  final List<NoteModel> notes;

  new({required this.notes});
}
