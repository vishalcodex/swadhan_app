import 'package:get/get.dart';

import '../../../models/api_response.dart';
import '../../../models/category_model.dart';
import '../../../models/event_model.dart';
import '../../../repositories/event_repository.dart';
// import '../../../repositories/category_repository.dart';

class EventController extends GetxController {
  RxInt selectedIndex = 0.obs;

  late EventRepository _eventRepository;

  EventController() {
    _eventRepository = EventRepository();
  }
  Rx<Category> category = Category().obs;
  @override
  void onInit() {
    super.onInit();
  }

  RxBool isLoading = false.obs;
  //EVENTS
  RxList<Event> events = <Event>[].obs;
  Rx<Event> selectedEvent = Event().obs;
  fetchEvents() async {
    isLoading.value = true;
    events.value = [];
    _eventRepository.fetchEvents().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        events.value = value.data;
        events.refresh();
      }
    });
  }
}
