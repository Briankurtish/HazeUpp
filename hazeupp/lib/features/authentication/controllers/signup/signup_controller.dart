import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hazeupp/data/repositories/authentication/authentication_repository.dart';
import 'package:hazeupp/data/repositories/user/user_repository.dart';
import 'package:hazeupp/features/authentication/models/user_model.dart';
import 'package:hazeupp/features/authentication/screens/signup/verify_email.dart';
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
  void signup() async {
    try {
      // Start Loading
      TScreenLoader.openLoadingDialog(
          "We are processing your information....", TImages.docerAnimation);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove laoder
        TScreenLoader.stopLoading();

        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove laoder
        TScreenLoader.stopLoading();

        return;
      }

      // Privacy policy check
      if (!privacyPolicy.value) {
        // Remove laoder
        TScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              "In order to create an account, you must have to read the Privacy Policy & Term of Use ",
        );
        return;
      }

      // Register User in the firebase authentication and save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // save authenticated user data in the firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
      );

      final userRepository = Get.put(UserRepository());

      await userRepository.saveUserRecord(newUser);

      // Remove laoder
      TScreenLoader.stopLoading();

      // show success message
      TLoaders.sucessSnackBar(
          title: "Congratulations",
          message: "Your account has been created! Verify email to continue");

      // Move to verify email screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      // Remove loader
      TScreenLoader.stopLoading();

      // show some generic error to the user
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}
