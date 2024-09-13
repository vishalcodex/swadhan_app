import 'package:get/get.dart';

import '../models/blog_model.dart';
import '../models/settings_model.dart';
import '../models/slide_model.dart';
import '../models/api_response.dart';
import '../models/package_model.dart';
import '../providers/api_provider.dart';

class SliderRepository {
  late ApiProvider apiProvider;

  SliderRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> fetchSliders() async {
    return await apiProvider.makeAPICall("GET", "sliders", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data =
            (value.data["data"] as List).map((e) => Slide.fromJson(e)).toList();
      } else {
        value.data = [];
      }

      return value;
    });
  }

  Future<ApiResponse> fetchPackages() async {
    return await apiProvider.makeAPICall("GET", "packages", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["packages"] as List)
            .map((e) => Package.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }

      return value;
    });
  }

  Future<ApiResponse> fetchSettings() async {
    return await apiProvider.makeAPICall("GET", "settings", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        // value.data = Setting.fromJson(value.data["setting"]);
      }
      return value;
    });
  }

  Future<ApiResponse> fetchBlogs() async {
    return await apiProvider.makeAPICall("GET", "blogs", {}).then((value) {
      List<Blog> blogs = [];
      if (value.status == Status.COMPLETED) {
        blogs =
            (value.data["blogs"] as List).map((e) => Blog.fromJson(e)).toList();
      }
      value.data = blogs;
      return value;
    });
  }

  Future<ApiResponse> fetchPrivacyPolicy() async {
    return await apiProvider
        .makeAPICall("GET", "privacy-policy", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => Setting.fromJson(e))
            .toList();
      }
      return value;
    });
  }

  Future<ApiResponse> fetchTermsNConditions() async {
    return await apiProvider
        .makeAPICall("GET", "terms-and-conditions", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => Setting.fromJson(e))
            .toList();
      }
      return value;
    });
  }

  Future<ApiResponse> fetchAboutUs() async {
    return await apiProvider.makeAPICall("GET", "about", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => Setting.fromJson(e))
            .toList();
      }
      return value;
    });
  }

  Future<ApiResponse> fetchNotices() async {
    return await apiProvider.makeAPICall("GET", "notices", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => Notice.fromJson(e))
            .toList();
      }
      return value;
    });
  }

  Future<ApiResponse> fecthAds() async {
    return await apiProvider
        .makeAPICall("GET", "advertisements", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data =
            (value.data["data"] as List).map((e) => Slide.fromJson(e)).toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }
}
