import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swavalamban/app/screens/home/controllers/home_controller.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/top_performer_model.dart';
import '../../../routes/app_routes.dart';
import '../controllers/member_controller.dart';

// ignore: must_be_immutable
class MemberScreen extends GetView<MemberController> {
  const MemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      // backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            backgroundColor: ColorPallete.theme,
            leading: InkWell(
              onTap: () {
                Get.find<HomeController>().setTabIndex.value = 0;
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorPallete.primary,
              ),
            ),
            title: const TextView(
              text: "Members Screen",
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
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 5.0 * fem, horizontal: 5 * fem),
                  child: RoundedContainer(
                    radius: 0,
                    height: 35,
                    child: ScrollablePositionedList.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      // itemScrollController: controller.scrollController,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        // Category category =
                        //     controller.categories.elementAt(index);
                        // bool isSelected = category.name ==
                        //     controller.selectedCategory.value.name;
                        bool isSelected = false;
                        if (index == 0) isSelected = true;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.5 * fem),
                          child: InkWell(
                            onTap: () {
                              // controller.onCategorySelected(category);
                            },
                            child: RoundedContainer(
                              radius: 10,
                              borderColor: ColorPallete.primary,
                              color: isSelected
                                  ? ColorPallete.primary
                                  : ColorPallete.theme,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15 * fem,
                                ),
                                child: Center(
                                  child: TextView(
                                    text: "Profession ${index + 1}",
                                    fontSize: 14,
                                    color: isSelected
                                        ? ColorPallete.theme
                                        : ColorPallete.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      controller.fetchMmebersByProfession();
                      return Future.value();
                    },
                    child: MyListView(
                      scroll: true,
                      children: [
                        Obx(
                          () => Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0 * fem, vertical: 5 * fem),
                            child: controller.memebers.isEmpty
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
                                            // Get.toNamed(Routes.MEMBER_DETAILS,
                                            //     arguments: {
                                            //       "member": {
                                            //         "image":
                                            //             "assets/images/members/lady1.jpg",
                                            //         "name": "Mmeber 1"
                                            //       }
                                            //     });
                                          },
                                          child: RoundedContainer(
                                            radius: 10,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4,
                                            color: ColorPallete.secondary
                                                .withOpacity(0.3),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: RoundedContainer(
                                                    radius: 10,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3,
                                                    color: ColorPallete.grey
                                                        .withOpacity(0.5),
                                                    clip: Clip
                                                        .antiAliasWithSaveLayer,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10 * fem,
                                                            horizontal:
                                                                10 * fem),
                                                    child: Column(
                                                      children: [
                                                        Expanded(
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
                                                                    height: 20,
                                                                    width: 100,
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    10 * fem,
                                                              ),
                                                              RoundedContainer(
                                                                radius: 5,
                                                                color: ColorPallete
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.5),
                                                                height: 10,
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    10 * fem,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        RoundedContainer(
                                                                      radius: 5,
                                                                      color: ColorPallete
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.5),
                                                                      height:
                                                                          10,
                                                                      width:
                                                                          250,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    10 * fem,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        RoundedContainer(
                                                                      radius: 5,
                                                                      color: ColorPallete
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.5),
                                                                      height:
                                                                          10,
                                                                      width:
                                                                          250,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    10 * fem,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        RoundedContainer(
                                                                      radius: 5,
                                                                      color: ColorPallete
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.5),
                                                                      height:
                                                                          10,
                                                                      width:
                                                                          250,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        RoundedContainer(
                                                          radius: 10,
                                                          height: 30,
                                                          color: ColorPallete
                                                              .grey
                                                              .withOpacity(
                                                                  0.25),
                                                          child: const Center(
                                                            child: TextView(
                                                              text: "View More",
                                                              color:
                                                                  ColorPallete
                                                                      .grey,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
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
                                    children: controller.memebers.map((member) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10 * fem),
                                      child: Container(
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                              color: ColorPallete.grey
                                                  .withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 10,
                                              offset: Offset(0, 5))
                                        ]),
                                        child: RoundedContainer(
                                          radius: 10,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          color: ColorPallete.theme,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: RoundedContainer(
                                                  radius: 10,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                  color: ColorPallete.grey
                                                      .withOpacity(0.5),
                                                  clip: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: CachedNetworkImage(
                                                    imageUrl: member["image"],
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                    errorWidget:
                                                        (context, url, error) {
                                                      return Image.asset(
                                                        member["image"],
                                                        fit: BoxFit.cover,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10 * fem,
                                                      horizontal: 10 * fem),
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: MyListView(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                RoundedContainer(
                                                                  radius: 5,
                                                                  child:
                                                                      TextView(
                                                                    text: member[
                                                                        "name"],
                                                                    fontSize:
                                                                        16,
                                                                    weight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10 * fem,
                                                            ),
                                                            const RoundedContainer(
                                                              radius: 5,
                                                              child: TextView(
                                                                text:
                                                                    "Borivali",
                                                                fontSize: 14,
                                                                color: ColorPallete
                                                                    .secondary,
                                                                weight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20 * fem,
                                                            ),
                                                            const RoundedContainer(
                                                              radius: 5,
                                                              child: TextView(
                                                                text:
                                                                    "Exclusive Services",
                                                                fontSize: 14,
                                                                color: ColorPallete
                                                                    .secondary,
                                                                weight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10 * fem,
                                                            ),
                                                            const RoundedContainer(
                                                              radius: 5,
                                                              child: TextView(
                                                                text:
                                                                    "International Tours",
                                                                fontSize: 14,
                                                                weight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.toNamed(
                                                              Routes
                                                                  .MEMBER_DETAILS,
                                                              arguments: {
                                                                "member": Member
                                                                    .fromJson(
                                                                        member)
                                                              });
                                                        },
                                                        child: RoundedContainer(
                                                          radius: 10,
                                                          height: 30,
                                                          color: ColorPallete
                                                              .primary
                                                              .withOpacity(
                                                                  0.25),
                                                          child: const Center(
                                                            child: TextView(
                                                              text: "View More",
                                                              color: ColorPallete
                                                                  .secondary,
                                                              weight: FontWeight
                                                                  .bold,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
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
