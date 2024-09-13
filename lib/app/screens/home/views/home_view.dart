import 'package:cached_network_image/cached_network_image.dart';
import 'package:marquee/marquee.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swavalamban/app/screens/category/widgets/category_view.dart';
import 'package:swavalamban/app/screens/events/controllers/event_controller.dart';
import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/slide_model.dart';
import '../../../providers/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          // appBar: PreferredSize(
          //     preferredSize: Size.fromHeight(50.0 * fem),
          //     child: CustomHomeAppBar(
          //       drawerContext: context,
          //       pageName: "",
          //     )),
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () {
                    controller.homeRefresh();
                    return Future.value();
                  },
                  child: Obx(
                    () => MyListView(
                      scroll: true,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                          child: MyListView(
                            children: [
                              SizedBox(
                                height: 15 * fem,
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              _getSliders(controller, fem),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              const TextView(
                                text: "Notice",
                                color: ColorPallete.secondary,
                                fontSize: 16,
                                weight: FontWeight.bold,
                              ),

                              Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 5 * fem),
                                child: RoundedContainer(
                                  radius: 0,
                                  height: 30,
                                  child: Center(
                                    child: Marquee(
                                      text: controller.notice.value,
                                      style: TextStyle(
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.bold),
                                      scrollAxis: Axis.horizontal,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      blankSpace: 20.0 * fem,
                                      // velocity: 50.0,
                                      // pauseAfterRound:
                                      //     const Duration(seconds: 0),
                                      // startPadding: 10.0 * fem,
                                      // accelerationDuration:
                                      //     const Duration(seconds: 1),
                                      // accelerationCurve: Curves.linear,
                                      // decelerationDuration:
                                      //     const Duration(
                                      //         milliseconds: 500),
                                      // decelerationCurve: Curves.easeOut,
                                    ),
                                  ),
                                ),
                              ),
                              // _getAboutUs(fem),
                              _buildMembers(controller, fem, context),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              _buildEvents(controller, fem, context),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              // _buildCategories(controller, fem, context),
                              const CategoriesView(inHomeView: true),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              _getAds(controller, fem),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              _buildTopPerformers(controller, fem, context),
                              SizedBox(
                                height: 10 * fem,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getAboutUs(double fem) {
    return MyListView(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0 * fem),
          child: const TextView(
            text: "Swadhan App is developed for helping SMEs to grow online.",
            color: ColorPallete.secondary,
            fontSize: 16,
            weight: FontWeight.w500,
            alignment: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 5 * fem,
        ),
        _getCard(fem, "Mission", "Empower SMEs to thrive in the digital era."),
        SizedBox(
          height: 5 * fem,
        ),
        _getCard(fem, "Vision",
            "Become the leading platform for SMEs to showcase their businesses and reach new heights."),
        SizedBox(
          height: 5 * fem,
        ),
        _getCard(fem, "GOAL",
            "Enable SMEs to grow online, increase their customer base, and boost sales."),
        SizedBox(
          height: 10 * fem,
        ),
        Padding(
          padding: EdgeInsets.all(10.0 * fem),
          child: const TextView(
            text:
                "At Swadhan, we're dedicated to helping SMEs succeed in the online marketplace. Our app provides a user-friendly platform for businesses to list their products and services, receive orders, and connect with customers. We're committed to building trust and supporting SMEs every step of the way. Join us in revolutionizing the way SMEs do business online!",
            color: ColorPallete.secondary,
            fontSize: 16,
            weight: FontWeight.w500,
            alignment: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  _getSliders(HomeController controller, double fem) {
    return Obx(
      () => MyListView(
        children: [
          // TextView(
          //   text: translations.impUpdates.tr,
          //   color: ColorPallete.secondary,
          //   fontSize: 14,
          //   weight: FontWeight.bold,
          // ),
          // SizedBox(
          //   height: 10 * fem,
          // ),
          controller.sliders.isEmpty
              ? InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.ADVERTISEMENT,
                      arguments: Slide(
                          sliderName: "Slider Title",
                          sliderDescription: "Slider Description"),
                    );
                  },
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.5),
                    highlightColor: Colors.white,
                    child: const RoundedContainer(
                      radius: 10,
                      height: 175,
                      color: ColorPallete.grey,
                    ),
                  ),
                )
              : RoundedContainer(
                  radius: 0,
                  height: 175,
                  child: PageView.builder(
                    controller: controller.sliderPageController,
                    onPageChanged: (value) {
                      controller.selectedSlide.value =
                          (value % controller.sliders.length);
                      controller.selectedSlide.refresh();
                    },
                    itemBuilder: (context, index) {
                      int pos = index % controller.sliders.length;
                      Slide slide = controller.sliders.elementAt(pos);
                      return Padding(
                        padding: EdgeInsets.all(5.0 * fem),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.ADVERTISEMENT, arguments: slide);
                          },
                          child: RoundedContainer(
                            radius: 10,
                            clip: Clip.antiAliasWithSaveLayer,
                            child: Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    spreadRadius: 0.5 * fem,
                                    blurRadius: 5 * fem,
                                    offset: Offset(0, 0 * fem),
                                    color: ColorPallete.grey.withOpacity(0.1))
                              ]),
                              child: CachedNetworkImage(
                                imageUrl: slide.sliderImage!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
          SizedBox(
            height: 5 * fem,
          ),
          controller.selectedSlide.value == -1
              ? Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.white,
                  child: RoundedContainer(
                    radius: 0,
                    height: 7.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [1, 2, 3].map((element) {
                        bool isSelected = element == 1;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.5 * fem),
                          child: RoundedContainer(
                            color: isSelected
                                ? ColorPallete.grey
                                : ColorPallete.grey.withOpacity(0.5),
                            radius: 5,
                            height: 10,
                            width: isSelected ? 20 : 10,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              : SizedBox(
                  height: 10,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.sliders.length,
                      itemBuilder: (context, index) {
                        bool isSelected =
                            index == controller.selectedSlide.value;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.5 * fem),
                          child: RoundedContainer(
                            color: isSelected
                                ? ColorPallete.primary
                                : ColorPallete.grey.withOpacity(0.5),
                            radius: 5,
                            height: 10,
                            width: isSelected ? 20 : 10,
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  _getCard(double fem, String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0 * fem, vertical: 10 * fem),
      child: Container(
        decoration: BoxDecoration(
          color: ColorPallete.theme,
          borderRadius: BorderRadius.circular(20 * fem),
          boxShadow: [
            BoxShadow(
              color: ColorPallete.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 15,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0 * fem),
          child: RoundedContainer(
            radius: 10,
            child: MyListView(
              children: [
                Center(
                  child: TextView(
                    text: title,
                    color: ColorPallete.secondary,
                    weight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5 * fem,
                ),
                Padding(
                  padding: EdgeInsets.all(5.0 * fem),
                  child: Center(
                    child: TextView(
                      text: description,
                      color: ColorPallete.secondary,
                      weight: FontWeight.w500,
                      fontSize: 16,
                      alignment: TextAlign.justify,
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

  _buildMembers(HomeController controller, double fem, BuildContext context) {
    return MyListView(
      children: [
        Row(
          children: [
            const RoundedContainer(
              radius: 0,
              color: ColorPallete.primaryAccent,
              borderColor: ColorPallete.secondary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextView(
                  text: "Welcome to all our new Members",
                  fontSize: 12,
                  color: ColorPallete.secondary,
                  weight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                controller.setTabIndex.value = 1;
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
        controller.members.isEmpty
            ? Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.5),
                highlightColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10 * fem),
                  child: RoundedContainer(
                    height: 175,
                    // color: ColorPallete.grey,
                    radius: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: MyListView(
                            isRow: true,
                            scroll: true,
                            children: [1, 2, 3]
                                .map(
                                  (blog) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10 * fem, vertical: 15),
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: ColorPallete.grey
                                                .withOpacity(0.25),
                                            blurRadius: 15,
                                            spreadRadius: 5)
                                      ]),
                                      child: RoundedContainer(
                                        radius: 10,
                                        clip: Clip.antiAlias,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        color: ColorPallete.grey,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : RoundedContainer(
                height: 185 * fem,
                // color: ColorPallete.grey,
                radius: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: MyListView(
                        isRow: true,
                        scroll: true,
                        children: controller.members
                            .map(
                              (member) => Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7.5 * fem, vertical: 15),
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color:
                                            ColorPallete.grey.withOpacity(0.25),
                                        blurRadius: 15,
                                        spreadRadius: 5)
                                  ]),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.MEMBER_DETAILS,
                                          arguments: {"member": member});
                                    },
                                    child: RoundedContainer(
                                      radius: 10,
                                      clip: Clip.antiAlias,
                                      width: MediaQuery.of(context).size.width /
                                          2 *
                                          fem,
                                      color: ColorPallete.theme,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            RoundedContainer(
                                              radius: 10,
                                              // height: 100 * fem,
                                              clip: Clip.antiAliasWithSaveLayer,
                                              color: ColorPallete.grey
                                                  .withOpacity(0.25),
                                              child: CachedNetworkImage(
                                                imageUrl: Urls.getImageUrl(
                                                    member.photo ?? ""),
                                                height: double.infinity,
                                                width: double.infinity,
                                                fit: BoxFit.fill,
                                                errorWidget:
                                                    (context, url, error) {
                                                  return const RoundedContainer(
                                                    radius: 0,
                                                    child: Icon(
                                                      Icons.person,
                                                      color: ColorPallete.theme,
                                                      size: 50,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              child: RoundedContainer(
                                                radius: 5,
                                                color: ColorPallete.theme,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15.0,
                                                      vertical: 5),
                                                  child: TextView(
                                                    text:
                                                        "${member.firstName ?? ""} ${member.lastName ?? ""}",
                                                    fontSize: 14,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxlines: 3,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }

  _buildEvents(HomeController controller, double fem, BuildContext context) {
    return MyListView(
      children: [
        Row(
          children: [
            const RoundedContainer(
              radius: 0,
              color: ColorPallete.primaryAccent,
              borderColor: ColorPallete.secondary,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextView(
                  text: "Our upcoming Events",
                  fontSize: 12,
                  color: ColorPallete.secondary,
                  weight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Get.put(EventController());
                Get.toNamed(Routes.EVENTS);
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
        controller.events.isEmpty
            ? Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.5),
                highlightColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10 * fem),
                  child: RoundedContainer(
                    height: 175,
                    // color: ColorPallete.grey,
                    radius: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: MyListView(
                            isRow: true,
                            scroll: true,
                            children: [1, 2, 3]
                                .map(
                                  (blog) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10 * fem, vertical: 15),
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: ColorPallete.grey
                                                .withOpacity(0.25),
                                            blurRadius: 15,
                                            spreadRadius: 5)
                                      ]),
                                      child: RoundedContainer(
                                        radius: 10,
                                        clip: Clip.antiAlias,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        color: ColorPallete.grey,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : RoundedContainer(
                height: 185 * fem,
                // color: ColorPallete.grey,
                radius: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: MyListView(
                        isRow: true,
                        scroll: true,
                        children: controller.events
                            .map(
                              (event) => Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7.5 * fem, vertical: 15),
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color:
                                            ColorPallete.grey.withOpacity(0.25),
                                        blurRadius: 15,
                                        spreadRadius: 5)
                                  ]),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.EVENT_DETAILS,
                                          arguments: {"event": event});
                                    },
                                    child: RoundedContainer(
                                      radius: 10,
                                      clip: Clip.antiAlias,
                                      width: MediaQuery.of(context).size.width /
                                          2 *
                                          fem,
                                      color: ColorPallete.theme,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: MyListView(
                                          children: [
                                            RoundedContainer(
                                              radius: 10,
                                              height: 110 * fem,
                                              clip: Clip.antiAliasWithSaveLayer,
                                              color: ColorPallete.grey
                                                  .withOpacity(0.25),
                                              child: CachedNetworkImage(
                                                imageUrl: Urls.getImageUrl(
                                                    event.image ?? ""),
                                                height: double.infinity,
                                                width: double.infinity,
                                                fit: BoxFit.fill,
                                                errorWidget:
                                                    (context, url, error) {
                                                  return RoundedContainer(
                                                      radius: 0);
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                              ),
                                              child: TextView(
                                                text: "Date : ${event.date}",
                                                fontSize: 14,
                                                overflow: TextOverflow.ellipsis,
                                                maxlines: 3,
                                                color: ColorPallete.secondary,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                              ),
                                              child: TextView(
                                                text: event.name.toString(),
                                                fontSize: 14,
                                                overflow: TextOverflow.ellipsis,
                                                maxlines: 1,
                                                color: ColorPallete.secondary,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }

  _getAds(HomeController controller, double fem) {
    return Obx(
      () => controller.ads.isEmpty
          ? InkWell(
              onTap: () {
                // Get.toNamed(
                //   Routes.ADVERTISEMENT,
                //   arguments: Slide(
                //       sliderName: "Slider Title",
                //       sliderDescription: "Slider Description"),
                // );
              },
              child: Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.5),
                highlightColor: Colors.white,
                child: const RoundedContainer(
                  radius: 10,
                  height: 175,
                  color: ColorPallete.grey,
                ),
              ),
            )
          : RoundedContainer(
              radius: 0,
              height: 175,
              child: PageView.builder(
                // controller: controller.sliderPageController,
                onPageChanged: (value) {
                  controller.selectedAd.value = (value % controller.ads.length);
                  controller.selectedAd.refresh();
                },
                itemBuilder: (context, index) {
                  int pos = index % controller.ads.length;
                  Slide slide = controller.ads.elementAt(pos);
                  return Padding(
                    padding: EdgeInsets.all(5.0 * fem),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.ADVERTISEMENT, arguments: slide);
                      },
                      child: RoundedContainer(
                        radius: 10,
                        clip: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                spreadRadius: 0.5 * fem,
                                blurRadius: 5 * fem,
                                offset: Offset(0, 0 * fem),
                                color: ColorPallete.grey.withOpacity(0.1))
                          ]),
                          child: CachedNetworkImage(
                            imageUrl: slide.sliderImage!,
                            fit: BoxFit.fill,
                            errorWidget: (context, url, error) {
                              return RoundedContainer(
                                radius: 0,
                                color: ColorPallete.grey.withOpacity(0.5),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  _buildTopPerformers(
      HomeController controller, double fem, BuildContext context) {
    return MyListView(
      children: [
        Row(
          children: [
            const RoundedContainer(
              radius: 0,
              color: ColorPallete.primaryAccent,
              borderColor: ColorPallete.secondary,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextView(
                  text: "Our Top Performers",
                  fontSize: 12,
                  color: ColorPallete.secondary,
                  weight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                controller.setTabIndex.value = 1;
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
        controller.performers.isEmpty
            ? Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.5),
                highlightColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10 * fem),
                  child: RoundedContainer(
                    height: 175,
                    // color: ColorPallete.grey,
                    radius: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: MyListView(
                            isRow: true,
                            scroll: true,
                            children: [1, 2, 3]
                                .map(
                                  (blog) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10 * fem, vertical: 15),
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: ColorPallete.grey
                                                .withOpacity(0.25),
                                            blurRadius: 15,
                                            spreadRadius: 5)
                                      ]),
                                      child: RoundedContainer(
                                        radius: 10,
                                        clip: Clip.antiAlias,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        color: ColorPallete.grey,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : RoundedContainer(
                height: 185 * fem,
                // color: ColorPallete.grey,
                radius: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: MyListView(
                        isRow: true,
                        scroll: true,
                        children: controller.performers
                            .map(
                              (performer) => Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7.5 * fem, vertical: 15),
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color:
                                            ColorPallete.grey.withOpacity(0.25),
                                        blurRadius: 15,
                                        spreadRadius: 5)
                                  ]),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.MEMBER_DETAILS,
                                          arguments: {"member": performer});
                                    },
                                    child: RoundedContainer(
                                      radius: 10,
                                      clip: Clip.antiAlias,
                                      width: MediaQuery.of(context).size.width /
                                          2 *
                                          fem,
                                      color: ColorPallete.theme,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            RoundedContainer(
                                              radius: 10,
                                              // height: 100 * fem,
                                              clip: Clip.antiAliasWithSaveLayer,
                                              color: ColorPallete.grey
                                                  .withOpacity(0.25),
                                              child: CachedNetworkImage(
                                                imageUrl: Urls.getImageUrl(
                                                    performer.user?.photo ??
                                                        ""),
                                                height: double.infinity,
                                                width: double.infinity,
                                                fit: BoxFit.fill,
                                                errorWidget:
                                                    (context, url, error) {
                                                  return const RoundedContainer(
                                                    radius: 0,
                                                    child: Icon(
                                                      Icons.person,
                                                      color: ColorPallete.theme,
                                                      size: 50,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              child: RoundedContainer(
                                                radius: 5,
                                                color: ColorPallete.theme,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15.0,
                                                      vertical: 5),
                                                  child: TextView(
                                                    text:
                                                        "${performer.user?.firstName ?? ""} ${performer.user?.lastName ?? ""}",
                                                    fontSize: 14,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxlines: 3,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
