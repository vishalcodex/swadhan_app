import 'package:get/get.dart';
import '../../category/controllers/category_controller.dart';
import '../../events/controllers/event_controller.dart';
import '../../members/controllers/member_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<CategoryController>(CategoryController());
    Get.put<MemberController>(MemberController());
    Get.put<EventController>(EventController());
  }
}
