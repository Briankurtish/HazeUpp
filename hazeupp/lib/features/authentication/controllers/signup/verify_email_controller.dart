import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // send email whenever verify screen appears & set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    super.onInit();
  }

  // Send Email verification Link
  sendEmailVerification() {}

  // Time to automatically redirect an Email verification

  // Manually check if email is verfied
}
