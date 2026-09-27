import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/core/themes/app_colors.dart';
import 'package:i_tech/features/auth/data/repo/auth_repo.dart';
import 'package:i_tech/features/auth/presentation/manager/auth_cubit.dart';
import 'package:i_tech/features/auth/presentation/screens/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: AuthRepo()),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.lightBackgroundColor,
        ),
        title: "Notes App",
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      ),
    );
  }
}
