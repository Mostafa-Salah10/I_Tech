part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

//toggle state
final class TogglePasswordIcon extends AuthState {}

///sign in states
final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpFailure extends AuthState {
  final String errMsg;

  new({required this.errMsg});
}

///sign up states

final class SignInLoading extends AuthState {}

final class SignInSuccess extends AuthState {}

final class SignInFailure extends AuthState {
  final String errMsg;

  new({required this.errMsg});
}
