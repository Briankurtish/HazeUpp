import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hazeupp/common/styles/spacing_styles.dart';
import 'package:hazeupp/features/authentication/screens/login/login.dart';
import 'package:hazeupp/features/authentication/screens/signup/verify_email.dart';
import 'package:hazeupp/utils/constants/image_strings.dart';
import 'package:hazeupp/utils/constants/sizes.dart';
import 'package:hazeupp/utils/constants/text_strings.dart';
import 'package:hazeupp/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingwithAppBarHeight * 2,
          child: Column(
            children: [
              // Image
              Image(
                image: AssetImage(image),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Title and Subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: const Text(TTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
