import 'package:flutter/material.dart';
import 'package:i_tech/screens/onboarding_screen.dart';

class SessionThreeTask extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),

      debugShowCheckedModeBanner: false,

      title: "Session Three Task",
    );
  }
}
