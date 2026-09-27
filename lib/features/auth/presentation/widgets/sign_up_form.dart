import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/core/themes/app_colors.dart';
import 'package:i_tech/core/widgets/app_button.dart';
import 'package:i_tech/core/widgets/app_text_form_field.dart';
import 'package:i_tech/features/auth/presentation/manager/auth_cubit.dart';
import 'package:i_tech/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:i_tech/features/auth/presentation/widgets/custom_have_account_widget.dart';
import 'package:i_tech/features/auth/presentation/widgets/show_toast_msg.dart';

class SignUpForm extends StatefulWidget {
  const new({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
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
            controller: _nameController,
            hint: "Name",
            prefixIcon: Icon(Icons.person, color: AppColors.greyColor),
            // controller: ,
          ),
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
                isSecure: !auth.showRegiserPassword,

                validator: (password) {
                  return _simpleValidateDate(password);
                },
                hint: "Password",
                prefixIcon: Icon(Icons.lock, color: AppColors.greyColor),

                suffixIcon: IconButton(
                  onPressed: () {
                    auth.toggleRegisterPassword();
                  },
                  icon: Icon(
                    auth.showRegiserPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.greyColor,
                  ),
                ),
                controller: _passwordController,
              );
            },
          ),

          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              } else if (state is SignUpFailure) {
                log(state.errMsg);
                showAppSnackBar(
                  backgroundColor: AppColors.errorColor,
                  context,
                  text: state.errMsg,
                );
              }
            },
            builder: (context, state) {
              return AppButton(
                text: state is SignUpLoading ? "Loading..." : "Sign Up",
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      state is! SignUpLoading) {
                    auth.signUp(
                      email: _emailController.text,
                      password: _passwordController.text,
                      name: _nameController.text,
                    );
                  }
                },
              );
            },
          ),

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

  ///not correct put this method here but for learning only

  String? _simpleValidateDate(String? email) {
    if (email == null || email.isEmpty) {
      return "Field is required";
    } else {
      return null;
    }
  }
}
