import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool showLoginPassword = false;
  bool showRegiserPassword = false;

  void toggleLoginPassword() {
    showLoginPassword = !showLoginPassword;
    emit(TogglePasswordIcon());
  }
  void toggleRegisterPassword() {
    showRegiserPassword = !showRegiserPassword;
    emit(TogglePasswordIcon());
  }
}
