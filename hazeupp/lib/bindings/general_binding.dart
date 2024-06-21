import 'package:get/get.dart';
import 'package:hazeupp/utils/helpers/network_managet.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
