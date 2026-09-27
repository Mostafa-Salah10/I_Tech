import 'package:flutter/material.dart';
import 'package:i_tech/core/themes/app_colors.dart';
import 'package:i_tech/core/widgets/app_button.dart';
import 'package:i_tech/core/widgets/app_text_form_field.dart';
import 'package:i_tech/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:i_tech/features/auth/presentation/widgets/custom_have_account_widget.dart';

class SignUpForm extends StatelessWidget {
  new({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 25,
        children: [
          AppTextFormField(
            hint: "Name",
            prefixIcon: Icon(Icons.person, color: AppColors.greyColor),
            // controller: ,
          ),
          AppTextFormField(
            hint: "Email",
            prefixIcon: Icon(Icons.email, color: AppColors.greyColor),
            // controller: ,
          ),

          AppTextFormField(
            hint: "Password",
            prefixIcon: Icon(Icons.lock, color: AppColors.greyColor),

            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.visibility, color: AppColors.greyColor),
            ),
            // controller: ,
          ),

          AppButton(text: "Sign Up", onPressed: () {}),

          CustomDonHaveAccountWidget(
            leadingText: "Already have an account?",
            trailingText: "Sign In",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
