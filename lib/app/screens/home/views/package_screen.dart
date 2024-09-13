import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

class PackagesScreen extends GetView<HomeController> {
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          // extendBody: true,
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorPallete.theme),
            backgroundColor: ColorPallete.primary,
            // leading: InkWell(
            //   onTap: () {
            //     controller.scaffoldKey.currentState!.openDrawer();
            //   },
            //   child: const Icon(
            //     Icons.menu,
            //     color: ColorPallete.primary,
            //   ),
            // ),
            title: TextView(
              text: "Packages",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                  child: RefreshIndicator(
                onRefresh: () {
                  controller.fetchPackages();
                  return Future.value();
                },
                child: MyListView(
                  scroll: true,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0 * fem, vertical: 10 * fem),
                      child: MyListView(
                        children: [
                          Obx(
                            () => controller.packages.isEmpty
                                ? const SizedBox(
                                    height: 200,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: ColorPallete.primary,
                                      ),
                                    ),
                                  )
                                : MyListView(
                                    children:
                                        controller.packages.map((package) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0 * fem,
                                            horizontal: 10 * fem),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10 * fem),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 10,
                                                    spreadRadius: 2.5,
                                                    color: ColorPallete.grey
                                                        .withOpacity(0.5),
                                                    offset: Offset(0, 5 * fem))
                                              ]),
                                          child: InkWell(
                                            onTap: () {
                                              // Get.toNamed(Routes.PACKAGES);
                                            },
                                            child: InkWell(
                                              onTap: () {
                                                controller
                                                    .onPackageSelected(package);
                                              },
                                              child: RoundedContainer(
                                                radius: 10,
                                                color: ColorPallete.theme,
                                                borderColor: ColorPallete.grey
                                                    .withOpacity(0.2),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      15.0 * fem),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: MyListView(
                                                          children: [
                                                            TextView(
                                                              text: package
                                                                  .packageName
                                                                  .toString(),
                                                              fontSize: 16,
                                                              weight: FontWeight
                                                                  .bold,
                                                            ),
                                                            SizedBox(
                                                              height: 10 * fem,
                                                            ),
                                                            TextView(
                                                              text: package
                                                                  .packageDescription
                                                                  .toString(),
                                                              fontSize: 12,
                                                              color: ColorPallete
                                                                  .secondary,
                                                              maxlines: 5,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            // SizedBox(
                                                            //   height: 10 * fem,
                                                            // ),
                                                            // InkWell(
                                                            //   onTap: () {
                                                            //     controller
                                                            //         .onPackageSelected(element);
                                                            //   },
                                                            //   child: RoundedContainer(
                                                            //     radius: 10,
                                                            //     color: ColorPallete.primary,
                                                            //     child: Padding(
                                                            //       padding:
                                                            //           EdgeInsets.all(10.0 * fem),
                                                            //       child: Center(
                                                            //         child: TextView(
                                                            //           text: "Start with this",
                                                            //           fontSize: 14,
                                                            //           color: ColorPallete.theme,
                                                            //         ),
                                                            //       ),
                                                            //     ),
                                                            //   ),
                                                            // )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10 * fem,
                                                      ),
                                                      Expanded(
                                                          flex: 1,
                                                          child: MyListView(
                                                            children: [
                                                              Center(
                                                                child: TextView(
                                                                  text:
                                                                      "₹ ${package.packagePrice}/-",
                                                                  fontSize: 16,
                                                                  weight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: ColorPallete
                                                                      .secondary,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 5 * fem,
                                                              ),
                                                              Center(
                                                                child: TextView(
                                                                  text:
                                                                      "${package.numberOfDays} days",
                                                                  fontSize: 14,
                                                                  weight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: ColorPallete
                                                                      .secondary,
                                                                  alignment:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ],
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
