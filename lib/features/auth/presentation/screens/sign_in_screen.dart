import 'package:flutter/material.dart';
import 'package:i_tech/features/auth/presentation/widgets/custom_top_image_title_auth_widget.dart';
import 'package:i_tech/features/auth/presentation/widgets/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomTopImageAndTitleAuthWidget(title: "Login"),
            
                SignInForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
