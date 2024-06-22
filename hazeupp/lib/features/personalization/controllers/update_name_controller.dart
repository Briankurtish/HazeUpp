import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hazeupp/data/repositories/user/user_repository.dart';
import 'package:hazeupp/features/personalization/controllers/user_controller.dart';
import 'package:hazeupp/features/personalization/screens/profile/profile.dart';
import 'package:hazeupp/utils/constants/image_strings.dart';
import 'package:hazeupp/utils/helpers/network_managet.dart';
import 'package:hazeupp/utils/popups/full_screen_loader.dart';
import 'package:hazeupp/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // Fetch User record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      TScreenLoader.openLoadingDialog(
          "We are updating your information...", TImages.docerAnimation);

      // Check Internet Connecting
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in the firebase store
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // Update the Rx User Value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      TScreenLoader.stopLoading();

      // Show Success message
      TLoaders.sucessSnackBar(
          title: "Congratulations", message: "Your name has been updated");

      // Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
