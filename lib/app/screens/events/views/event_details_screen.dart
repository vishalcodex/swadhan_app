import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/event_model.dart';
import '../../../providers/api_endpoints.dart';

// ignore: must_be_immutable
class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    Event event = Get.arguments?["event"];
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
              text: "Event Details", // translations.blogDetails.tr,
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
                                imageUrl: Urls.getImageUrl(event.image ?? ""),
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.fill,
                                errorWidget: (context, url, error) {
                                  return const RoundedContainer(radius: 0);
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
                                    text: event.name ?? "",
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
                            TextView(
                              text: event.date ?? "",
                              color: ColorPallete.grey,
                              fontSize: 14,
                              weight: FontWeight.bold,
                            ),

                            SizedBox(
                              height: 20 * fem,
                            ),
                            const TextView(
                              text: "Summary",
                              color: ColorPallete.secondary,
                              fontSize: 16,
                              weight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 10 * fem,
                            ),

                            TextView(
                              text: (event.description ?? "") != ""
                                  ? event.description!
                                  : "📝 Event Description:\nJoin us for the Summer Business Expo 2024, where innovation meets opportunity! This exciting event brings together entrepreneurs, industry leaders, and business enthusiasts from all over to explore the latest trends, network with professionals, and discover new growth strategies.\n\n\nWhat to Expect:\nKeynote Speakers: Hear from top industry experts sharing their insights and success stories.\nNetworking Opportunities: Connect with potential partners, clients, and investors.\nWorkshops & Panels: Participate in hands-on sessions covering marketing, finance, technology, and more.\nExhibitor Booths: Explore a diverse range of products and services from local and national businesses.\n\n\nSpecial Highlights:\nStartup Pitch Competition: Watch as emerging startups present their innovative ideas for a chance to win exciting prizes.\nBusiness Awards Ceremony: Celebrate the achievements of outstanding local businesses.\nWhether you're a seasoned entrepreneur or just starting out, the Summer Business Expo 2024 is the perfect opportunity to gain knowledge, make valuable connections, and drive your business forward.\n\n\nDon’t miss out—reserve your spot today and be part of this dynamic event!",
                              color: ColorPallete.secondary,
                              fontSize: 14,
                            ),
                            // Html(
                            //   data: event["description"] ?? "",
                            //   style: {
                            //     "body": Style(color: ColorPallete.secondary)
                            //   },
                            // ),
                            SizedBox(
                              height: 10 * fem,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0 * fem),
                  child: InkWell(
                    onTap: () {
                      launchUrl(
                          Uri.parse("https://www.summerbusinessexpo2024.com"),
                          mode: LaunchMode.externalApplication);
                    },
                    child: const RoundedContainer(
                      radius: 10,
                      height: 45,
                      color: ColorPallete.primary,
                      child: Center(
                        child: TextView(
                          text: "BOOK NOW",
                          color: ColorPallete.theme,
                          fontSize: 14,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )

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
