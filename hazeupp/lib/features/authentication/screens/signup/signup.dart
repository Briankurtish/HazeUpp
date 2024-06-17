import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hazeupp/common/widgets/login_signup/form_divider.dart';
import 'package:hazeupp/common/widgets/login_signup/social_buttons.dart';
import 'package:hazeupp/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:hazeupp/utils/constants/colors.dart';
import 'package:hazeupp/utils/constants/sizes.dart';
import 'package:hazeupp/utils/constants/text_strings.dart';
import 'package:hazeupp/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Form
              const TSignUpForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Divider
              TFormDivider(
                dividerText: TTexts.orSignUpWith.capitalize!,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Social Buttons
              const TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
