import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hazeupp/common/styles/spacing_styles.dart';
import 'package:hazeupp/common/widgets/login_signup/form_divider.dart';
import 'package:hazeupp/common/widgets/login_signup/social_buttons.dart';
import 'package:hazeupp/features/authentication/screens/login/widgets/login_form.dart';
import 'package:hazeupp/features/authentication/screens/login/widgets/login_header.dart';
import 'package:hazeupp/utils/constants/sizes.dart';
import 'package:hazeupp/utils/constants/text_strings.dart';
import 'package:hazeupp/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingwithAppBarHeight,
          child: Column(
            children: [
              // Logo title and sub title
              TLoginHeader(dark: dark),

              // Form
              TLoginForm(),

              // Divider
              TFormDivider(
                dividerText: TTexts.orSignInWith.capitalize!,
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // Footer
              TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
