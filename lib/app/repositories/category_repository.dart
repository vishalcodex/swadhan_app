import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/businessCategory.dart';
import '../models/category_model.dart';
import '../providers/api_provider.dart';

class CategoryRepository {
  late ApiProvider apiProvider;

  CategoryRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> fetchCategories() async {
    return await apiProvider
        .makeAPICall("GET", "categories", {}).then((value) async {
      if (value.status == Status.COMPLETED) {
        List<Category> categories = (value.data["categories"] as List).map((e) {
          return Category.fromJson(e);
        }).toList();
        value.data = categories;
      }
      return value;
    });
  }

  Future<ApiResponse> fetchSubCategories(Category category) async {
    return await apiProvider
        // .makeAPICall("POST", "blogs", category.toJson())
        .makeAPICall("GET", "subcategories/${category.id}", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["subcategories"] as List)
            .map((e) => Subcategory.fromJson(e))
            .toList();
      } else {
        value.data = [];
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

  // Future<ApiResponse> fetchSuppliers({
  //   required String location,
  //   required String category,
  //   String? subcategory,
  // }) async {
  //   var params = {
  //     "location": location,
  //     "category": category,
  //     "subcategory": subcategory
  //   };
  //   return await apiProvider
  //       .makeAPICall(
  //           "GET",
  //           "products", //?location=$location&category=$category&subcategory=$subcategory",
  //           params)
  //       .then((value) async {
  //     // if (value.status == Status.COMPLETED) {
  //     //   List<Supplier> locations = (value.data["products"] as List).map((e) {
  //     //     return Supplier.fromJson(e);
  //     //   }).toList();
  //     //   value.data = locations;
  //     // }
  //     return value;
  //   });
  // }

  Future<ApiResponse> sendEnquiry(data) async {
    return await apiProvider
        .makeAPICall("POST", "enquiry", data)
        .then((value) async {
      if (value.status == Status.COMPLETED) {}
      return value;
    });
  }
}
