import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../components/ui/youtube_screen.dart';
import '../../../providers/api_endpoints.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class VideosScreen extends GetView<HomeController> {
  const VideosScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorPallete.theme),
            backgroundColor: ColorPallete.primary,
            leading: InkWell(
              onTap: () {
                controller.setTabIndex.value = 0;
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: ColorPallete.theme,
              ),
            ),
            title: const TextView(
              text: "Videos",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Container(
              color: ColorPallete.theme,
              child: Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () {
                        controller.fetchVideos();
                        // controller.fetchBlogsByCategory();
                        return Future.value();
                      },
                      child: MyListView(
                        scroll: true,
                        children: [
                          Obx(
                            () => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0 * fem, vertical: 10 * fem),
                              child: controller.videos.isEmpty
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
                                              // Get.toNamed(Routes.BLOG_DETAILS,
                                              //     arguments: {
                                              //       "blog": Blog(
                                              //           title: "Product Name")
                                              //     });
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
                                                      child: const Center(
                                                        child: Icon(
                                                          Icons.play_arrow,
                                                          size: 100,
                                                          color:
                                                              ColorPallete.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10 * fem,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10 * fem,
                                                            horizontal:
                                                                10 * fem),
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
                                                          color: ColorPallete
                                                              .grey
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
                                      children: controller.videos.map((video) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10 * fem),
                                        child: Container(
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10,
                                              spreadRadius: 5,
                                              color: ColorPallete.grey
                                                  .withOpacity(0.5),
                                              offset: const Offset(0, 5),
                                            )
                                          ]),
                                          child: RoundedContainer(
                                            radius: 10,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                3,
                                            color: ColorPallete.theme,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: RoundedContainer(
                                                    radius: 10,
                                                    color: ColorPallete.theme,
                                                    clip: Clip
                                                        .antiAliasWithSaveLayer,
                                                    child: Stack(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl: Urls
                                                                    .getImageUrl(
                                                                        video
                                                                            .thumbnail),
                                                                //     YoutubeThumbnail(
                                                                //   youtubeId: video[
                                                                //           "video"]
                                                                //       .split(
                                                                //           "/")
                                                                //       .last
                                                                //       .split(
                                                                //           "=")
                                                                //       .last,
                                                                // ).hd(),
                                                                fit:
                                                                    BoxFit.fill,
                                                                errorWidget:
                                                                    (context,
                                                                        error,
                                                                        stackTrace) {
                                                                  return const RoundedContainer(
                                                                      radius:
                                                                          0);
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Center(
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                                    return YoutubeScreen(
                                                                      videoId: video
                                                                          .link!
                                                                          .split(
                                                                              "/")
                                                                          .last
                                                                          .split(
                                                                              "=")
                                                                          .last,
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .play_circle_fill_rounded,
                                                              color:
                                                                  ColorPallete
                                                                      .theme,
                                                              size: 60,
                                                            ),
                                                          ),
                                                        )
                                                      ],
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
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: TextView(
                                                              text:
                                                                  "Name : ${video.title}",
                                                              weight: FontWeight
                                                                  .bold,
                                                              fontSize: 14,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxlines: 2,
                                                              color: ColorPallete
                                                                  .secondary,
                                                            ),
                                                          ),
                                                          TextView(
                                                            text: video.updatedAt ==
                                                                    null
                                                                ? ""
                                                                : DateFormat(
                                                                        "dd MMM yyyy")
                                                                    .format(DateFormat(
                                                                            "yyyy-MM-dd")
                                                                        .parse(video
                                                                            .updatedAt!)),
                                                            maxlines: 2,
                                                            weight:
                                                                FontWeight.bold,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            color: ColorPallete
                                                                .grey,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5 * fem,
                                                      ),
                                                      TextView(
                                                        text:
                                                            video.description ??
                                                                "",
                                                        maxlines: 2,
                                                        weight: FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
      ),
    );
  }
}
