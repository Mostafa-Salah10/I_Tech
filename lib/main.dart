import 'package:flutter/material.dart';
import 'package:i_tech/core/themes/app_colors.dart';
import 'package:i_tech/features/auth/presentation/screens/sign_in_screen.dart';

void main() async {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.lightBackgroundColor
      ),
      title: "Notes App",
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
