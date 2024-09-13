import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/color_pallete.dart';
import '../../routes/app_routes.dart';
import '../../screens/home/controllers/home_controller.dart';
import '../../services/auth_service.dart';
import 'my_list_view.dart';
import 'rounded_container.dart';
import 'text_view.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class CustomDrawer extends GetView<HomeController> {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Container(
      decoration: const BoxDecoration(
        color: ColorPallete.accent,
        // borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(30 * fem),
        //     bottomLeft: Radius.circular(30 * fem)),
      ),
      height: double.infinity,
      width: baseWidth * 0.75 * fem,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10 * fem, horizontal: 15 * fem),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User

              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0 * fem, vertical: 2.5 * fem),
                      child: Icon(
                        Icons.close,
                        color: ColorPallete.secondary,
                        size: 25 * fem,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5 * fem,
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: ColorPallete.primary.withOpacity(0.15),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                  child: Image.asset(
                    "assets/ui/logo.png",
                    height: 75 * fem,
                  ),
                ),
              ),

              SizedBox(
                height: 10 * fem,
              ),
              TextView(
                text:
                    "${controller.user.value.firstName} ${controller.user.value.lastName}",
                color: ColorPallete.secondary,
                fontSize: 18,
                weight: FontWeight.w600,
              ),
              SizedBox(
                height: 10 * fem,
              ),
              TextView(
                text: controller.user.value.email ?? "karomhatre@gmailcom",
                color: ColorPallete.secondary,
                fontSize: 14,
                weight: FontWeight.w400,
              ),
              SizedBox(
                height: 20 * fem,
              ),

              Expanded(
                child: MyListView(
                  scroll: true,
                  children: [
                    DrawerItem(
                      image: "assets/ui/home_icon.png",
                      title: translations.home.tr,
                      onPressed: () {
                        // Get.offAllNamed(Routes.HOME);
                      },
                    ),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                      image: "assets/ui/user.png",
                      title: "Profile",
                      onPressed: () {
                        // Get.toNamed(
                        //   Routes.MY_PROFILE,
                        // );
                        // controller.setTabIndex.value = 1;
                      },
                    ),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                    // DrawerItem(
                    //   image: "assets/ui/user.png",
                    //   title: "Contacted Sellers",
                    //   onPressed: () {
                    //     Get.back();
                    //     Get.toNamed(
                    //       Routes.CONTACTED_SELLERS,
                    //     );
                    //     // controller.setTabIndex.value = 3;
                    //   },
                    // ),

                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                    // DrawerItem(
                    //     image: "assets/ui/certificates.png",
                    //     title: "My Packages",
                    //     onPressed: () {
                    //       Get.toNamed(Routes.PACKAGES);
                    //     }),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                      image: "assets/ui/settings.png",
                      title: translations.aboutUs.tr,
                      onPressed: () {
                        controller.fetchAboutUs();
                        Get.toNamed(Routes.ABOUT_US);
                      },
                    ),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                      image: "assets/ui/certificates.png",
                      title: "Terms & Condtions",
                      onPressed: () {
                        controller.fetchTermsnConditions();
                        Get.toNamed(Routes.TERMS_N_CONDITIONS);
                      },
                    ),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                      image: "assets/ui/certificates.png",
                      title: "Privacy Policy",
                      onPressed: () {
                        controller.fetchPrivacyPolicy();
                        Get.toNamed(Routes.PRIVACY_POLICY);
                      },
                    ),
                    SizedBox(
                      height: 5 * fem,
                    ),

                    // Divider(
                    //   thickness: 1 * fem,
                    //   height: 10 * fem,
                    //   color: ColorPallete.grey,
                    // ),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                    DrawerItem(
                        image: "assets/ui/contact_us.png",
                        title: translations.contactUs.tr,
                        onPressed: () {
                          // Get.toNamed(Routes.CONTACT_US);
                        }),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    // DrawerItem(
                    //     image: "assets/ui/events.png",
                    //     title: translations.followUs.tr,
                    //     onPressed: () {}),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                    // DrawerItem(
                    //     image: "assets/ui/settings.png",
                    //     title: translations.chooseLang.tr,
                    //     onPressed: () {
                    //       controller.showLanguagePopUp(context);
                    //     }),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                    // DrawerItem(
                    //     image: "assets/ui/settings.png",
                    //     title: "FAQs",
                    //     onPressed: () {}),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                  ],
                ),
              ),

              SizedBox(
                height: 5 * fem,
              ),
              InkWell(
                onTap: () async {
                  await Get.find<AuthService>()
                      .removeCurrentUser()
                      .then((value) {
                    Get.offAndToNamed(Routes.LOGIN);
                  });
                },
                child: RoundedContainer(
                  radius: 10 * fem,
                  color: ColorPallete.primary,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0 * fem),
                    child: const Center(
                      child: TextView(
                        text: "Logout",
                        color: ColorPallete.theme,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData? icon;
  final String? image;
  final String title;
  final Function() onPressed;
  const DrawerItem(
      {super.key,
      this.icon,
      this.image,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return InkWell(
      onTap: () {
        Get.back();
        onPressed();
        // controller.setTabIndex.value = 1;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.5 * fem),
        child: RoundedContainer(
          // height: 45,
          radius: 10,
          color: ColorPallete.primary.withOpacity(0.1),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 15.0 * fem, vertical: 7.5 * fem),
            child: Center(
              child: Row(
                children: [
                  if (image != null)
                    Image.asset(
                      image!,
                      color: ColorPallete.primary,
                      height: 25 * fem,
                    ),
                  SizedBox(
                    width: 10 * fem,
                  ),
                  Center(
                    child: TextView(
                      text: title,
                      fontSize: 14,
                      weight: FontWeight.w500,
                      color: ColorPallete.secondary,
                    ),
                  ),
                  const Spacer(),
                  Transform.flip(
                    flipX: true,
                    child: Image.asset(
                      "assets/ui/back.png",
                      width: 25 * fem,
                      color: ColorPallete.primary,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
