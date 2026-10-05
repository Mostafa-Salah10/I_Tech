import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/core/themes/app_colors.dart';
import 'package:i_tech/features/home/presentation/manager/home/home_cubit.dart';
import 'package:i_tech/features/home/presentation/screens/add_note_screen.dart';
import 'package:i_tech/features/home/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
        },
        shape: CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: AppColors.lightBackgroundColor, size: 25),
      ),
      appBar: AppBar(
        title: Text(
          "My Notes",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: 30, color: AppColors.blackColor),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, size: 30, color: AppColors.blackColor),
          ),
        ],
      ),
      body: HomeScreenBody(),
    );
  }
}
