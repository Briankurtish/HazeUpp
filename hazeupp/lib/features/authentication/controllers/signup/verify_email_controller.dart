import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hazeupp/common/widgets/success_screen/success_screen.dart';
import 'package:hazeupp/data/repositories/authentication/authentication_repository.dart';
import 'package:hazeupp/utils/constants/image_strings.dart';
import 'package:hazeupp/utils/constants/text_strings.dart';
import 'package:hazeupp/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // send email whenever verify screen appears & set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send Email verification Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.sucessSnackBar(
          title: "Email Sent",
          message: "Please check your inbox and verify your email");
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Time to automatically redirect an Email verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              animation: TImages.successfullyRegisteredAnimation,
              title: TTexts.yourAccountCreatedTitle,
              subTitle: TTexts.yourAccountCreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  // Manually check if email is verfied
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            animation: TImages.successfullyRegisteredAnimation,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}
