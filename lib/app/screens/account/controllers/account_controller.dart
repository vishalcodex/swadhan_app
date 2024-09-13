import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';

class AccountController extends GetxController {
  AccountController() {}

  bool fromRegister = false;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      fromRegister = Get.arguments["from_register"] ?? false;
    }
  }

  RxList<String> selectedBrands = <String>[].obs;

  void toHome() {
    if (fromRegister) {
      fromRegister = false;
      Get.offAllNamed(
        Routes.HOME,
        predicate: (route) => Get.currentRoute == "/home",
      );
    } else {
      Get.back();
    }
  }

  void logout() {
    Get.find<AuthService>().removeCurrentUser();
    Get.offAndToNamed(Routes.LOGIN);
  }
}
