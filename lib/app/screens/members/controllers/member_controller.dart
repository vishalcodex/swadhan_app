import 'package:get/get.dart';

import '../../../models/blog_model.dart';
import '../../../models/category_model.dart';
// import '../../../repositories/category_repository.dart';

class MemberController extends GetxController {
  RxList<Map<String, dynamic>> memebers = <Map<String, dynamic>>[].obs;
  Rx<Blog> selectedBlog = Blog().obs;

  RxInt selectedIndex = 0.obs;

  // late CategoryRepository _categoryRepository;

  MemberController() {
    // _categoryRepository = CategoryRepository();
  }
  Rx<Category> category = Category().obs;
  @override
  void onInit() {
    super.onInit();
  }

  void fetchMmebersByProfession() async {
    memebers.value = [];
    // blogs.value = category.value.blogs!;
    // blogs.refresh();
    // await _categoryRepository.fetchBlogsByCategory(category).then((value) {
    //   if (value.status == Status.COMPLETED) {
    //     blogs.value = value.data;
    //     blogs.refresh();
    //   }
    // });

    Future.delayed(const Duration(seconds: 1), () {
      memebers.value = [
        {"image": "assets/images/members/lady4.jpg", "name": "Member 4"},
        {"image": "assets/images/members/lady3.jpg", "name": "Member 3"},
        {"image": "assets/images/members/lady2.jpg", "name": "Member 2"},
        {"image": "assets/images/members/lady1.jpg", "name": "Member 1"},
      ];
      memebers.refresh();
    });
  }
}
