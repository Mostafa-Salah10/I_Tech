import 'package:flutter/material.dart';

class CustomTopImageAndTitleAuthWidget extends StatelessWidget {
  const CustomTopImageAndTitleAuthWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Center(
          child: Image.asset(
            'assets/images/note_logo.png',
            width: 160,
            height: 160,
          ),
        ),

        Text(
          title,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 45),
      ],
    );
  }
}