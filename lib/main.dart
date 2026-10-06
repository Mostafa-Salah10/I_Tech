import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/core/themes/app_colors.dart';
import 'package:i_tech/features/auth/data/repo/auth_repo.dart';
import 'package:i_tech/features/auth/presentation/manager/auth_cubit.dart';
import 'package:i_tech/features/home/data/repo/home_repo.dart';
import 'package:i_tech/features/home/presentation/manager/create_update/create_update_note_cubit.dart';
import 'package:i_tech/features/home/presentation/manager/home/home_cubit.dart';
import 'package:i_tech/features/home/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(authRepo: AuthRepo())),
        BlocProvider(create: (context) => HomeCubit(homeRepo: HomeRepo())),
        BlocProvider(
          create: (context) => CreateUpdateNoteCubit(homeRepo: HomeRepo()),
        ),
      ],
      child: MaterialApp(

        
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.lightBackgroundColor,
          ),
          scaffoldBackgroundColor: AppColors.lightBackgroundColor,
        ),
        title: "Notes App",
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
