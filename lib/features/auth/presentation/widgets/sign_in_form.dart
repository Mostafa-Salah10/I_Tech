import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/core/themes/app_colors.dart';
import 'package:i_tech/core/widgets/app_button.dart';
import 'package:i_tech/core/widgets/app_text_form_field.dart';
import 'package:i_tech/features/auth/presentation/manager/auth_cubit.dart';
import 'package:i_tech/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:i_tech/features/auth/presentation/widgets/custom_have_account_widget.dart';

class SignInForm extends StatefulWidget {
  const new({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthCubit>();
    return Form(
      key: _formKey,
      child: Column(
        spacing: 25,
        children: [
          AppTextFormField(
            validator: (email) {
              return _simpleValidateDate(email);
            },
            hint: "Email",
            prefixIcon: Icon(Icons.email, color: AppColors.greyColor),
            controller: _emailController,
          ),

          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return AppTextFormField(
                validator: (password) {
                  return _simpleValidateDate(password);
                },
                controller: _passwordController,
                isSecure: !auth.showLoginPassword,
                hint: "Password",
                prefixIcon: Icon(Icons.lock, color: AppColors.greyColor),

                suffixIcon: IconButton(
                  onPressed: () {
                    auth.toggleLoginPassword();
                  },
                  icon: Icon(
                    auth.showLoginPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.greyColor,
                  ),
                ),
              );
            },
          ),

          const Text(
            textAlign: TextAlign.center,
            "Forgot your password?",
            style: TextStyle(
              fontSize: 17,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),

          AppButton(
            text: "Sign In",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ///sign in
              }
            },
          ),

          CustomDonHaveAccountWidget(
            leadingText: "Don't have an account?",
            trailingText: "Sign Up",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  ///not correct put this method here but for learning only

  String? _simpleValidateDate(String? email) {
    if (email == null || email.isEmpty) {
      return "Field is required";
    } else {
      return null;
    }
  }
}
