// import 'dart:developer';

import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/top_performer_model.dart';
import '../models/user_model.dart';
import '../providers/api_provider.dart';
// import 'package:dio/dio.dart' as dio;

class MemberRepository {
  late ApiProvider apiProvider;

  MemberRepository() {
    apiProvider = Get.find<ApiProvider>();
  }
  Future<ApiResponse> fetchNewMembers() async {
    return await apiProvider
        .makeAPICall("GET", "latest-approved-users", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data =
            (value.data["data"] as List).map((e) => User.fromJson(e)).toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchTopPerformers() async {
    return await apiProvider
        .makeAPICall("GET", "top-performer", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => Member.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }
}
