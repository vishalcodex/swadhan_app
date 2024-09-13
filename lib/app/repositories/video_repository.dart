// import 'dart:developer';

import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/video_model.dart';
import '../providers/api_provider.dart';
// import 'package:dio/dio.dart' as dio;

class VideoRepository {
  late ApiProvider apiProvider;

  VideoRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> fetchVideos() async {
    return await apiProvider.makeAPICall("GET", "videos", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data =
            (value.data["data"] as List).map((e) => Video.fromJson(e)).toList();
      }
      return value;
    });
  }
}
