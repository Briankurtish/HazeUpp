import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hazeupp/data/repositories/authentication/authentication_repository.dart';
import 'package:hazeupp/utils/constants/image_strings.dart';
import 'package:hazeupp/utils/helpers/network_managet.dart';
import 'package:hazeupp/utils/popups/full_screen_loader.dart';
import 'package:hazeupp/utils/popups/loaders.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // @override
  // void onInit() {
  //   email.text = localStorage.read("REMEBER_ME_EMAIL");
  //   password.text = localStorage.read("REMEBER_ME_PASSWORD");
  //   super.onInit();
  // }

  // Email and Password signin
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      TScreenLoader.openLoadingDialog(
          "Logging you in ....", TImages.docerAnimation);

      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TScreenLoader.stopLoading();
        return;
      }

      // Save data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // login user using email & password authentication
      final UserCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      TScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
