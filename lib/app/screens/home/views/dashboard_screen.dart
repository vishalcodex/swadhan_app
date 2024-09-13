import 'package:swavalamban/app/components/ui/my_list_view.dart';

import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/utils.dart';
import '../../../components/ui/custom_bottom_nav_bar.dart';
import '../../../components/ui/custom_drawer.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class MainScreen extends GetView<HomeController> {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async => closeAppAlert(context),
          child: Scaffold(
            key: controller.scaffoldKey,
            // extendBody: true,
            backgroundColor: ColorPallete.theme,
            // appBar: AppBar(
            //   iconTheme: const IconThemeData(color: ColorPallete.theme),
            //   backgroundColor: ColorPallete.primary,
            //   // leading: InkWell(
            //   //   onTap: () {
            //   //     controller.scaffoldKey.currentState!.openDrawer();
            //   //   },
            //   //   child: const Icon(
            //   //     Icons.menu,
            //   //     color: ColorPallete.primary,
            //   //   ),
            //   // ),
            //   title: Obx(
            //     () => TextView(
            //       text: controller.bottomTabs[controller.setTabIndex.value]
            //           ["title"],
            //       color: ColorPallete.theme,
            //       fontSize: 18,
            //       weight: FontWeight.bold,
            //     ),
            //   ),
            //   actions: const [
            //     // InkWell(
            //     //   onTap: () async {
            //     //     await Get.find<AuthService>()
            //     //         .removeCurrentUser()
            //     //         .then((value) {
            //     //       // Get.offAndToNamed(Routes.AUTH);
            //     //       Get.offAllNamed(
            //     //         Routes.SPLASH,
            //     //         predicate: (route) => Get.currentRoute == "/splash",
            //     //       );
            //     //     });
            //     //   },
            //     //   child: Padding(
            //     //     padding: EdgeInsets.symmetric(horizontal: 10 * fem),
            //     //     child: Icon(
            //     //       Icons.logout_rounded,
            //     //       color: ColorPallete.theme,
            //     //       size: 25 * fem,
            //     //     ),
            //     //   ),
            //     // )
            //   ],
            // ),

            body: Obx(
              () => Column(
                children: [
                  if (controller.setTabIndex.value == 0)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Container(
                        // decoration: BoxDecoration(boxShadow: [
                        //   BoxShadow(
                        //       color: ColorPallete.grey.withOpacity(0.5),
                        //       blurRadius: 10,
                        //       offset: Offset(0, 5),
                        //       spreadRadius: 2.5)
                        // ]),
                        child: RoundedContainer(
                          radius: 0,
                          // height: 60,
                          color: ColorPallete.theme,
                          child: MyListView(
                            children: [
                              SizedBox(
                                height: 5 * fem,
                              ),
                              Row(
                                children: [
                                  const Spacer(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0 * fem),
                                    child: Image.asset(
                                      "assets/ui/noti.png",
                                      height: 30,
                                      color: ColorPallete.secondary,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Scaffold.of(controller
                                      //         .scaffoldKey.currentContext!)
                                      //     .openEndDrawer();
                                      controller.scaffoldKey.currentState!
                                          .openEndDrawer();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0 * fem),
                                      child: Image.asset(
                                        "assets/ui/userp.png",
                                        height: 30,
                                        color: ColorPallete.secondary,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5 * fem,
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0 * fem, vertical: 5 * fem),
                                child: Row(
                                  children: [
                                    TextView(
                                      text:
                                          "Good Afternoon! ${controller.user.value.firstName ?? "User"}",
                                      color: ColorPallete.secondary,
                                      weight: FontWeight.bold,
                                      fontSize: 20,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: RoundedContainer(
                      radius: 0,
                      // height: MediaQuery.of(context).size.height,
                      child:
                          controller.getTabScreen(controller.setTabIndex.value),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: CustomBottomNavBar(),
            endDrawer: const CustomDrawer(),
          ),
        ),
      ),
    );
  }
}
