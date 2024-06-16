import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hazeupp/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:hazeupp/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:hazeupp/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:hazeupp/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:hazeupp/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:hazeupp/utils/constants/colors.dart';
import 'package:hazeupp/utils/constants/image_strings.dart';
import 'package:hazeupp/utils/constants/sizes.dart';
import 'package:hazeupp/utils/constants/text_strings.dart';
import 'package:hazeupp/utils/device/device_utility.dart';
import 'package:hazeupp/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Horizontal scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // Skip button
          const OnBoardingSkip(),

          // Dot Navigation smoothpage indicator
          const OnBoardingDotNavigation(),

          // circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
