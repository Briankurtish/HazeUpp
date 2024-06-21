import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hazeupp/utils/helpers/network_managet.dart';
import 'package:hazeupp/utils/constants/image_strings.dart';
import 'package:hazeupp/utils/popups/full_screen_loader.dart';
import 'package:hazeupp/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final username = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Signup
  Future<void> signup() async {
    try {
      // Start Loading
      TScreenLoader.openLoadingDialog(
          "We are processing your information....", TImages.docerAnimation);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              "In order to create an account, you must have to read the Privacy Policy & Term of Use ",
        );
        return;
      }

      // Register User in the firebase authentication and save user data in the firebase

      // save authenticated user data in the firestore

      // show success message

      // Move to verify email screen
    } catch (e) {
      // show some generic error to the user
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    } finally {
      // Remove Loader
      TScreenLoader.stopLoading();
    }
  }
}
