import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hazeupp/data/repositories/authentication/authentication_repository.dart';
import 'package:hazeupp/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:hazeupp/utils/constants/image_strings.dart';
import 'package:hazeupp/utils/helpers/network_managet.dart';
import 'package:hazeupp/utils/popups/full_screen_loader.dart';
import 'package:hazeupp/utils/popups/loaders.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  // Send Reset email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      TScreenLoader.openLoadingDialog(
          "Processing your request ....", TImages.docerAnimation);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        TScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      TScreenLoader.stopLoading();

      // Show Sucees screen
      TLoaders.sucessSnackBar(
          title: "Email Sent",
          message: "Email link sent to reset your password".tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      TScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      TScreenLoader.openLoadingDialog(
          "Processing your request ....", TImages.docerAnimation);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      TScreenLoader.stopLoading();

      // Show Sucees screen
      TLoaders.sucessSnackBar(
          title: "Email Sent",
          message: "Email link sent to reset your password".tr);
    } catch (e) {
      // Remove Loader
      TScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
