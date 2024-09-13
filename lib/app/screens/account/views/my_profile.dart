import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../home/controllers/home_controller.dart';

// ignore: must_be_immutable
class MyProfileScreen extends GetView<HomeController> {
  const MyProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.theme,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorPallete.theme),
        backgroundColor: ColorPallete.primary,
        title: const TextView(
          text: "Profile",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => controller.user.value.firstName == null
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: ColorPallete.primary,
                        ),
                      )
                    : MyListView(
                        scroll: true,
                        children: [
                          SizedBox(
                            height: 25 * fem,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/ui/profile.png",
                                height: 100 * fem,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15 * fem,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextView(
                                text: "South Canara Agro Mart",
                                // controller
                                //     .user.value.accountName!.capitalize!,
                                fontSize: 18,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.0 * fem),
                            child: MyListView(
                              children: [
                                SizedBox(
                                  height: 5 * fem,
                                ),
                                EntryWidget(
                                  title: "Name",
                                  value: controller.user.value.firstName!,
                                  icon: Icons.person,
                                ),

                                EntryWidget(
                                  title: "Email",
                                  value: controller.user.value.email!,
                                  icon: Icons.email,
                                ),

                                EntryWidget(
                                  title: "Phone Number",
                                  value: controller.user.value.phoneNumber!,
                                  icon: Icons.phone,
                                ),
                                // if (controller.user.value.referralCode != "")
                                //   EntryWidget(
                                //     title: "Referral Code",
                                //     value: controller.user.value.referralCode!,
                                //     icon: Icons.alternate_email,
                                //   ),
                                // EntryWidget(
                                //   title: "Membership Id",
                                //   value: controller.user.value.membregNo!,
                                //   icon: Icons.card_membership,
                                // ),
                                SizedBox(
                                  height: 5 * fem,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0 * fem),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: RoundedContainer(
                  radius: 10,
                  color: ColorPallete.primary,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0 * fem),
                    child: const Center(
                      child: TextView(
                        text: "Return to Home",
                        color: ColorPallete.theme,
                        weight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getInitials(String name) {
    String initials = "";
    if (name != "") {
      var names = name.split(" ");
      int numWords = 2;
      if (numWords < names.length) {
        numWords = names.length;
      }
      for (var i = 0; i < numWords; i++) {
        initials += '${names[i][0]}';
      }
    }
    return initials;
  }
}

class EntryWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const EntryWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0 * fem, horizontal: 10 * fem),
      child: RoundedContainer(
        radius: 0,
        child: MyListView(
          children: [
            TextView(
              text: title,
              color: ColorPallete.secondary,
              fontSize: 12,
            ),
            SizedBox(
              height: 5 * fem,
            ),
            RoundedContainer(
              radius: 10,
              color: ColorPallete.primary.withOpacity(0.1),
              child: Padding(
                padding: EdgeInsets.all(10.0 * fem),
                child: Row(
                  children: [
                    Expanded(
                      child: TextView(
                        text: value == "" ? "NA" : value,
                        color: ColorPallete.primary,
                        fontSize: 16,
                        maxlines: 1,
                        overflow: TextOverflow.ellipsis,
                        weight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5 * fem),
                      child: Icon(
                        icon,
                        color: ColorPallete.primary,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
