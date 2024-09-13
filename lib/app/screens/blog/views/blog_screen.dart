import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swavalamban/app/models/blog_model.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../routes/app_routes.dart';
import '../controllers/blog_controller.dart';

// ignore: must_be_immutable
class BlogScreen extends GetView<BlogController> {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    controller.category.value = Get.arguments?["category"];
    controller.category.refresh();
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            backgroundColor: ColorPallete.theme,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorPallete.primary,
              ),
            ),
            title: TextView(
              text: controller.category.value.name ?? "",
              color: ColorPallete.secondary,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      controller.fetchBlogsByCategory();
                      return Future.value();
                    },
                    child: MyListView(
                      scroll: true,
                      children: [
                        Obx(
                          () => Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0 * fem, vertical: 10 * fem),
                            child: controller.blogs.isEmpty
                                ? MyListView(
                                    children: [1, 2, 3].map((blog) {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey.withOpacity(0.5),
                                      highlightColor: Colors.white,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10 * fem),
                                        child: InkWell(
                                          onTap: () {
                                            Get.toNamed(Routes.BLOG_DETAILS,
                                                arguments: {
                                                  "blog": Blog(
                                                      title: "Product Name")
                                                });
                                          },
                                          child: RoundedContainer(
                                            radius: 10,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                3,
                                            color: ColorPallete.secondary
                                                .withOpacity(0.3),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: RoundedContainer(
                                                    radius: 10,
                                                    color: ColorPallete.grey
                                                        .withOpacity(0.5),
                                                    clip: Clip
                                                        .antiAliasWithSaveLayer,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10 * fem,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10 * fem,
                                                      horizontal: 10 * fem),
                                                  child: MyListView(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          RoundedContainer(
                                                            radius: 5,
                                                            color: ColorPallete
                                                                .grey
                                                                .withOpacity(
                                                                    0.5),
                                                            height: 10,
                                                            width: 100,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5 * fem,
                                                      ),
                                                      RoundedContainer(
                                                        radius: 5,
                                                        color: ColorPallete.grey
                                                            .withOpacity(0.5),
                                                        height: 7.5,
                                                      ),
                                                      SizedBox(
                                                        height: 5 * fem,
                                                      ),
                                                      Row(
                                                        children: [
                                                          RoundedContainer(
                                                            radius: 5,
                                                            color: ColorPallete
                                                                .grey
                                                                .withOpacity(
                                                                    0.5),
                                                            height: 7.5,
                                                            width: 250,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList())
                                : MyListView(
                                    children: controller.blogs.map((blog) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10 * fem),
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.BLOG_DETAILS,
                                              arguments: {"blog": blog});
                                        },
                                        child: RoundedContainer(
                                          radius: 10,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              3,
                                          color: ColorPallete.secondary
                                              .withOpacity(0.1),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: RoundedContainer(
                                                  radius: 10,
                                                  color: ColorPallete.theme,
                                                  clip: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: Image.network(
                                                    blog.image!,
                                                    // height: 75
                                                    width: double.infinity,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10 * fem,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10 * fem,
                                                    horizontal: 10 * fem),
                                                child: MyListView(
                                                  children: [
                                                    TextView(
                                                      text:
                                                          "Title : ${blog.title!}",
                                                      weight: FontWeight.bold,
                                                      fontSize: 14,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxlines: 2,
                                                      color: ColorPallete
                                                          .secondary,
                                                    ),
                                                    SizedBox(
                                                      height: 5 * fem,
                                                    ),
                                                    TextView(
                                                      text: blog.description ??
                                                          "",
                                                      maxlines: 2,
                                                      weight: FontWeight.bold,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: ColorPallete
                                                          .secondary,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
