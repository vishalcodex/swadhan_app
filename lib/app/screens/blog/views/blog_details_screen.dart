import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/blog_model.dart';
import '../../../providers/api_endpoints.dart';

// ignore: must_be_immutable
class BlogDetailsScreen extends StatelessWidget {
  const BlogDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    Blog blog = Get.arguments?["blog"];
    return Scaffold(
      extendBody: true,
      // backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            backgroundColor: ColorPallete.primary,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorPallete.theme,
              ),
            ),
            title: const TextView(
              text: "Blog Details", // translations.blogDetails.tr,
              color: ColorPallete.theme,
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
                  child: MyListView(
                    scroll: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
                        child: MyListView(
                          children: [
                            SizedBox(
                              height: 10 * fem,
                            ),
                            RoundedContainer(
                              radius: 15,
                              height: 175,
                              clip: Clip.antiAliasWithSaveLayer,
                              color: ColorPallete.disableGrey,
                              child: CachedNetworkImage(
                                imageUrl: Urls.getImageUrl(blog.image ?? ""),
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.fill,
                                errorWidget: (context, url, error) {
                                  return Container();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20 * fem,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextView(
                                    text: blog.title ?? "",
                                    color: ColorPallete.secondary,
                                    fontSize: 16,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 10 * fem,
                            ),
                            // TextView(
                            //   text: blog.description ?? "",
                            //   color: ColorPallete.secondary,
                            //   fontSize: 14,
                            // ),
                            Html(
                              data: blog.description!,
                              style: {
                                "body": Style(color: ColorPallete.secondary)
                              },
                            ),
                            SizedBox(
                              height: 10 * fem,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   decoration: BoxDecoration(boxShadow: [
                //     BoxShadow(
                //       blurRadius: 10,
                //       spreadRadius: 5,
                //       color: ColorPallete.grey.withOpacity(0.5),
                //     ),
                //   ]),
                //   child: RoundedContainer(
                //     radius: 0,
                //     color: ColorPallete.theme,
                //     child: Padding(
                //       padding: EdgeInsets.all(5.0 * fem),
                //       child: Row(
                //         children: [
                //           Expanded(
                //             child: RoundedContainer(
                //               radius: 10,
                //               color: ColorPallete.primary,
                //               child: Padding(
                //                 padding: EdgeInsets.all(15.0 * fem),
                //                 child: const Center(
                //                   child: TextView(
                //                     text: "Subscribe Now",
                //                     color: ColorPallete.theme,
                //                     fontSize: 14,
                //                     weight: FontWeight.w700,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           SizedBox(
                //             width: 5 * fem,
                //           ),
                //           Expanded(
                //             child: RoundedContainer(
                //               radius: 10,
                //               color: ColorPallete.primary,
                //               child: Padding(
                //                 padding: EdgeInsets.all(15.0 * fem),
                //                 child: const Center(
                //                   child: TextView(
                //                     text: "Enquire Now",
                //                     color: ColorPallete.theme,
                //                     fontSize: 14,
                //                     weight: FontWeight.w700,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
