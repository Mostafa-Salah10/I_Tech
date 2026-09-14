import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onSkip});

  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSkip,
      child: Text("Skip", style: TextStyle(fontSize: 17, color: Colors.grey)),
    );
  }
}
