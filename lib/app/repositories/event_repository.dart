// import 'dart:developer';

import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/event_model.dart';
import '../providers/api_provider.dart';
// import 'package:dio/dio.dart' as dio;

class EventRepository {
  late ApiProvider apiProvider;

  EventRepository() {
    apiProvider = Get.find<ApiProvider>();
  }
  Future<ApiResponse> fetchEvents() async {
    return await apiProvider.makeAPICall("GET", "events", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data =
            (value.data["data"] as List).map((e) => Event.fromJson(e)).toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }
}
