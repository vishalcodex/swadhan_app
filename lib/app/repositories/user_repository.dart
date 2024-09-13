import 'package:get/get.dart';
import 'package:swavalamban/app/models/businessCategory.dart';

import '../models/api_response.dart';
import '../models/user_model.dart';
import '../providers/api_provider.dart';
import 'package:dio/dio.dart' as dio;

class UserRepository {
  late ApiProvider apiProvider;

  UserRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  // Future<ApiResponse> signUp(String phoneNo) async {
  //   return await apiProvider
  //       .makeAPICall("POST", "api/signup", {"phone": phoneNo}).then((value) {
  //     if (value.status == Status.COMPLETED) {
  //       // User user = User.fromJson(value.data["user"]);
  //       // user.token = value.data["token"];
  //       // value.data = user;
  //     }
  //     return value;
  //   });
  // }

  // Future<ApiResponse> verifyOtp(creds) async {
  //   return await apiProvider
  //       .makeAPICall("POST", "api/verify-otp", creds)
  //       .then((value) {
  //     if (value.status == Status.COMPLETED) {
  //       User user = User.fromJson(value.data["user"]);
  //       user.token = value.data["token"];
  //       value.data = user;
  //     }
  //     return value;
  //   });
  // }

  // Future<ApiResponse> setPassword(String password) async {
  //   return await apiProvider.makeAPICall(
  //       "POST", "api/set-password", {"password": password}).then((value) {
  //     if (value.status == Status.COMPLETED) {
  //       // User user = User.fromJson(value.data["user"]);
  //       // user.token = value.data["token"];
  //       // value.data = user;
  //     }
  //     return value;
  //   });
  // }

  Future<ApiResponse> login(creds) async {
    var data = dio.FormData.fromMap(creds);
    return await apiProvider.makeAPICall("POST", "login", data).then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data["user"]);
        user.token = value.data["token"];
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> forgotPassword(var data) async {
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "forgot-password", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        // User user = User.fromJson(value.data["user"]);
        // user.token = value.data["token"];
        // value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> fetchUserDetails() async {
    return await apiProvider.makeAPICall("GET", "profile", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data["user"]);
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> logout() async {
    return await apiProvider.makeAPICall("GET", "logout", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data);
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> register(creds) async {
    var data = dio.FormData.fromMap(creds);
    return await apiProvider
        .makeAPICall("POST", "register", data)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data["user"]);
        user.token = value.data["token"];
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> fetchBusinessCategories() async {
    return await apiProvider
        .makeAPICall("GET", "business-categories", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => BusinessCategory.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> submitBusinessDetails(User user) async {
    var body = dio.FormData.fromMap(user.toJson());
    if (user.businessDocument != null &&
        !user.businessDocument!.contains("business_documents")) {
      body.fields.removeWhere((element) => element.key == "business_document");
      body.files.add(
        MapEntry(
          "business_document",
          await dio.MultipartFile.fromFile(user.businessDocument!,
              filename: user.businessDocument.toString().split("/").last),
        ),
      );
    }
    return await apiProvider
        .makeAPICall("POST", "update-business-details", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data["user"]);
        // user.token = value.data["token"];
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> submitPersonalDetails(User user) async {
    var body = dio.FormData.fromMap(user.toJson());

    if (user.aadharCardUpload != null &&
        !user.aadharCardUpload!.contains("aadhar_cards")) {
      body.fields.removeWhere((element) => element.key == "aadhar_card_upload");
      body.files.add(
        MapEntry(
          "aadhar_card_upload",
          await dio.MultipartFile.fromFile(user.aadharCardUpload!,
              filename: user.aadharCardUpload.toString().split("/").last),
        ),
      );
    }

    if (user.panCardUpload != null &&
        !user.panCardUpload!.contains("pan_cards")) {
      body.fields.removeWhere((element) => element.key == "pan_card_upload");
      body.files.add(
        MapEntry(
          "pan_card_upload",
          await dio.MultipartFile.fromFile(user.panCardUpload!,
              filename: user.panCardUpload.toString().split("/").last),
        ),
      );
    }
    if (user.photo != null && !user.photo!.contains("photos")) {
      body.fields.removeWhere((element) => element.key == "photo");
      body.files.add(
        MapEntry(
          "photo",
          await dio.MultipartFile.fromFile(user.photo!,
              filename: user.photo.toString().split("/").last),
        ),
      );
    }
    return await apiProvider
        .makeAPICall("POST", "update-personal-details", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data["user"]);
        // user.token = value.data["token"];
        value.data = user;
      }
      return value;
    });
  }
}
