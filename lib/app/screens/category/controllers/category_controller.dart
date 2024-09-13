import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../models/api_response.dart';
import '../../../models/businessCategory.dart';
import '../../../repositories/category_repository.dart';

class CategoryController extends GetxController {
  late CategoryRepository _categoryRepository;
  CategoryController() {
    _categoryRepository = CategoryRepository();
  }

  @override
  void onInit() {
    super.onInit();
    fetchBusinessCategories();
    // fetchLocations();
    selectedBusinessCategory.listen((p0) {
      if (scrollController.isAttached) {
        scrollController.scrollTo(
            index: busniesCategories.indexOf(p0),
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOutCubic);
      }
      // if (p0["sub"] != null) {
      //   subCategories.value = p0["sub"];
      //   selectedSubCategory.value = (p0["sub"] as List).first;
      //   subCategories.refresh();
      // } else {
      //   subCategories.value = [];
      // }
    });
  }

  ItemScrollController scrollController = ItemScrollController();

  //Category
  // Rx<Category> selectedCategory = Category().obs;
  // RxList<Category> categories = <Category>[].obs;

  // fetchCategories() async {
  //   Future.delayed(const Duration(seconds: 1), () {
  //     // _categoryRepository.fetchCategories().then((value) {
  //     //   if (value.status == Status.COMPLETED) {
  //     //     categories.value = value.data;
  //     //     onCategorySelected(categories.first);
  //     //     categories.refresh();
  //     //   }
  //     // });

  //     categories.value = [
  //       {
  //         "name": "Local Grocery Stores",
  //         "image": "assets/images/categories/supermarket.png"
  //       },
  //       {
  //         "name": "Restaurants and Cafes",
  //         "image": "assets/images/categories/cafe.png"
  //       },
  //       {
  //         "name": "Salons and Spas",
  //         "image": "assets/images/categories/hair-salon.png"
  //       },
  //       {
  //         "name": "Dry Cleaners",
  //         "image": "assets/images/categories/drying-machine.png"
  //       },
  //       {
  //         "name": "Bookstores",
  //         "image": "assets/images/categories/book-shop.png"
  //       },
  //       {
  //         "name": "Fitness Centers",
  //         "image": "assets/images/categories/gym.png"
  //       },
  //       {"name": "Pet Shops", "image": "assets/images/categories/pet-shop.png"},
  //       {
  //         "name": "Pharmacies",
  //         "image": "assets/images/categories/drugstore.png"
  //       },
  //       {
  //         "name": "Organic Farms",
  //         "image": "assets/images/categories/market.png"
  //       },
  //       {
  //         "name": "Local Dairy Farms",
  //         "image": "assets/images/categories/shop.png"
  //       },
  //       {
  //         "name": "Fruit and Vegetable Markets",
  //         "image": "assets/images/categories/vegetable-shop.png"
  //       },
  //       {"name": "Bakeries", "image": "assets/images/categories/bakery.png"},
  //       {
  //         "name": "Specialty Food Products (e.g., jams, sauces)",
  //         "image": "assets/images/categories/shelves.png"
  //       }
  //     ].map((e) => Category.fromJson(e)).toList();
  //     categories.refresh();
  //   });
  // }

  Rx<BusinessCategory> selectedBusinessCategory = BusinessCategory().obs;
  RxList<BusinessCategory> busniesCategories = <BusinessCategory>[].obs;
  fetchBusinessCategories() async {
    busniesCategories.value = [];
    await _categoryRepository.fetchBusinessCategories().then((value) {
      if (value.status == Status.COMPLETED) {
        busniesCategories.value = value.data;
        if (busniesCategories.isNotEmpty) {
          selectedBusinessCategory.value = busniesCategories.first;
        }
        busniesCategories.refresh();
      } else {}
    });
  }

  RxBool isLoading = false.obs;
}
