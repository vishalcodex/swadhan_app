import 'package:get/get.dart';
import '../controllers/event_controller.dart';

class EvetnBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EventController>(EventController());
  }
}
