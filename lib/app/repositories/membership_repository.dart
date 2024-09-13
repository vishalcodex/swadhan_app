import 'dart:developer';

import 'package:get/get.dart';

import '../models/api_response.dart';
import '../providers/api_provider.dart';
import 'package:dio/dio.dart' as dio;

class MembershipRepository {
  late ApiProvider apiProvider;

  MembershipRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  //FAMILY
  Future<ApiResponse> saveFamilyDetails(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "update/family-details", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  //SCHEME
  Future<ApiResponse> saveSchemeDetails(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "update/govt-scheme-details", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }
}
