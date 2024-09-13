import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/businessCategory.dart';
import '../../../providers/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../controllers/category_controller.dart';

class CategoriesView extends GetView<CategoryController> {
  final bool inHomeView;
  const CategoriesView({
    super.key,
    required this.inHomeView,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0 * fem, horizontal: 5 * fem),
      child: Obx(
        () => RefreshIndicator(
          onRefresh: () {
            controller.fetchBusinessCategories();
            return Future.value();
          },
          child: MyListView(
            scroll: true,
            children: [
              if (inHomeView)
                Row(
                  children: [
                    const RoundedContainer(
                      radius: 0,
                      color: ColorPallete.primaryAccent,
                      borderColor: ColorPallete.secondary,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextView(
                          text: "Choose Business Category",
                          fontSize: 12,
                          color: ColorPallete.secondary,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.CATEGORY);
                      },
                      child: const TextView(
                        text: "View More",
                        color: ColorPallete.secondary,
                        fontSize: 12,
                        weight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0 * fem),
                child: controller.busniesCategories.isEmpty
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 8,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 5 * fem,
                                  crossAxisSpacing: 5 * fem),
                          itemBuilder: (context, index) {
                            // bool isSelected = false;
                            // Category cat = controller.busniesCategories.elementAt(
                            //     index < controller.busniesCategories.length
                            //         ? index
                            //         : controller.busniesCategories.length - 1);
                            // isSelected =
                            //     cat.name == controller.selectedBusinessCategory.value.name;

                            return InkWell(
                              onTap: () {},
                              child: RoundedContainer(
                                radius: 10,
                                clip: Clip.antiAliasWithSaveLayer,
                                height: MediaQuery.of(context).size.width / 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.5),
                                  child: RoundedContainer(
                                    radius: 7.5,
                                    clip: Clip.antiAliasWithSaveLayer,
                                    color: ColorPallete.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: inHomeView
                            ? controller.busniesCategories.length < 12
                                ? controller.busniesCategories.length
                                : 12
                            : controller.busniesCategories.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 5 * fem,
                            crossAxisSpacing: 5 * fem),
                        itemBuilder: (context, index) {
                          bool isSelected = false;
                          BusinessCategory cat = controller.busniesCategories
                              .elementAt(index <
                                      controller.busniesCategories.length
                                  ? index
                                  : controller.busniesCategories.length - 1);
                          isSelected = cat.name ==
                              controller.selectedBusinessCategory.value.name;

                          return inHomeView && index == 11
                              ? InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.CATEGORY);
                                  },
                                  child: RoundedContainer(
                                    radius: 10,
                                    color:
                                        ColorPallete.primary.withOpacity(0.25),
                                    height:
                                        MediaQuery.of(context).size.width / 5,
                                    child: const Center(
                                      child: TextView(
                                        text: "See More",
                                        color: ColorPallete.secondary,
                                        weight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    controller.selectedBusinessCategory.value =
                                        cat;
                                    controller.selectedBusinessCategory
                                        .refresh();
                                    if (inHomeView) {
                                      // Get.find<HomeController>()
                                      //     .setTabIndex
                                      //     .value = 1;
                                      // controller.showSuppliers.value = true;
                                      // controller.fetchSuppliers();
                                    }
                                  },
                                  child: RoundedContainer(
                                    radius: 10,
                                    clip: Clip.antiAliasWithSaveLayer,
                                    borderColor: isSelected
                                        ? ColorPallete.primary
                                        : null,
                                    height:
                                        MediaQuery.of(context).size.width / 5,
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.5),
                                          child: RoundedContainer(
                                            radius: 7.5,
                                            clip: Clip.antiAliasWithSaveLayer,
                                            child: CachedNetworkImage(
                                              imageUrl: Urls.getImageUrl(
                                                  cat.image ?? ""),
                                              height: double.infinity,
                                              width: double.infinity,
                                              fit: BoxFit.fill,
                                              errorWidget:
                                                  (context, url, error) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(
                                                      7.50),
                                                  child: Image.asset(
                                                    cat.image!,
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    fit: BoxFit.fill,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return RoundedContainer(
                                                        radius: 7.5,
                                                        color: isSelected
                                                            ? ColorPallete
                                                                .primary
                                                                .withOpacity(
                                                                    0.5)
                                                            : ColorPallete.grey
                                                                .withOpacity(
                                                                    0.25),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                              placeholder: (context, url) {
                                                return RoundedContainer(
                                                  radius: 0,
                                                  color: isSelected
                                                      ? ColorPallete.primary
                                                          .withOpacity(0.5)
                                                      : ColorPallete.grey
                                                          .withOpacity(0.25),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: Container(
                                            decoration:
                                                BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 15,
                                                  spreadRadius: 2,
                                                  color: isSelected
                                                      ? ColorPallete.theme
                                                          .withOpacity(0.95)
                                                      : ColorPallete
                                                          .themeContrast
                                                          .withOpacity(0.75))
                                            ]),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: TextView(
                                                text: cat.name ?? "",
                                                color: isSelected
                                                    ? ColorPallete.themeContrast
                                                    : ColorPallete.theme,
                                                weight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis,
                                                alignment: TextAlign.center,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                        },
                      ),
              ),
              // const TextView(
              //   text: "Please select your state",
              //   fontSize: 16,
              //   color: ColorPallete.secondary,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
              //   child: RoundedContainer(
              //     radius: 10,
              //     borderColor: ColorPallete.grey,
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
              //       child: DropdownButtonHideUnderline(
              //         child: DropdownButtonFormField(
              //           decoration:
              //               const InputDecoration(border: InputBorder.none),
              //           value: controller.selectedLocation.value,
              //           items: controller.locations
              //               .map((element) => DropdownMenuItem<String>(
              //                   value: element["name"],
              //                   child: TextView(text: element["name"])))
              //               .toList(),
              //           onChanged: (value) {},
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              // if (!inHomeView)
              //   InkWell(
              //     onTap: () {
              //       // if (inHomeView) {
              //       //   Get.find<HomeController>().setTabIndex.value = 1;
              //       // }
              //       controller.searchSuppliers();
              //     },
              //     child: RoundedContainer(
              //       radius: 10,
              //       color: ColorPallete.primary,
              //       child: Padding(
              //         padding: EdgeInsets.symmetric(vertical: 15.0 * fem),
              //         child: const Center(
              //           child: TextView(
              //             text: "Lets find Suppliers",
              //             fontSize: 14,
              //             color: ColorPallete.theme,
              //           ),
              //         ),
              //       ),
              //     ),
              //   )
            ],
          ),
        ),
      ),
    );
  }
}
