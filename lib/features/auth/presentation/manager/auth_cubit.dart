import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/features/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this._authRepo}) : super(AuthInitial());

  final AuthRepo _authRepo;

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

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());

    final res = await _authRepo.signIn(email: email, password: password);

    res.fold(
      (err) {
        emit(SignInFailure(errMsg: err));
      },
      (_) {
        emit(SignInSuccess());
      },
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignUpLoading());

    final res = await _authRepo.signUp(
      name: name,
      email: email,
      password: password,
    );

    res.fold(
      (err) {
        emit(SignUpFailure(errMsg: err));
      },
      (_) {
        emit(SignUpSuccess());
      },
    );
  }
}
