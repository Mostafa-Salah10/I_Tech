import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key, this.onNext, required this.title});

  final VoidCallback? onNext;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: MaterialButton(
        onPressed: onNext,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),

        height: 55,
        minWidth: double.infinity,
        color: Colors.green,
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 17)),
      ),
    );
  }
}
