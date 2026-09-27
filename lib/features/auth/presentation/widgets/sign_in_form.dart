import 'package:flutter/material.dart';
import 'package:i_tech/core/themes/app_colors.dart';
import 'package:i_tech/core/widgets/app_button.dart';
import 'package:i_tech/core/widgets/app_text_form_field.dart';
import 'package:i_tech/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:i_tech/features/auth/presentation/widgets/custom_have_account_widget.dart';

class SignInForm extends StatelessWidget {
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

          const Text(
            textAlign: TextAlign.center,
            "Forgot your password?",
            style: TextStyle(
              fontSize: 17,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),

          AppButton(text: "Sign In", onPressed: () {}),

          CustomDonHaveAccountWidget(
            leadingText: "Don't have an account?",
            trailingText: "Sing Up",
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
}

///*** if you want to use Text.rich insted of Row ***/

// Text.rich(
//             TextSpan(
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 17,
//                 color: AppColors.blueGreyColor,
//               ),

//               children: [
//                 TextSpan(text: "Don't have an account?"),
//                 TextSpan(
//                   recognizer: TapGestureRecognizer()..onTap=(){
//                     //implement your logic here
//                   },
//                   text: "Sing Up",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 17,
//                     color: AppColors.primaryColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
