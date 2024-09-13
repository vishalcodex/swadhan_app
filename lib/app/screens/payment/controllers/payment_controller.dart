import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class PaymentController extends GetxController {
  PaymentController() {}

  @override
  void onInit() {
    super.onInit();
  }

  void goToWebSiteUrl() {
    Get.toNamed(Routes.WEB_CONGRATS);
  }
}
