part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetNotesLoading extends HomeState {}

final class GetNotesFailure extends HomeState {
  final String errMsg;

  new({required this.errMsg});
}

final class GetNotsSuccess extends HomeState {}

final class DeleteNoteLoading extends HomeState {}

final class DeleteNoteFailure extends HomeState {
  final String errMsg;

  new({required this.errMsg});
}

final class DeleteNoteSuccess extends HomeState {}
