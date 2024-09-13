import 'package:flutter/services.dart';

import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class ContactUsView extends GetView<HomeController> {
  const ContactUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
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
            title: const TextView(
              text: "Contact Us",
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
                              height: 20 * fem,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedContainer(
                                  radius: 100,
                                  height: 100,
                                  clip: Clip.antiAliasWithSaveLayer,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset("assets/ui/logo.png"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20 * fem,
                            ),
                            const RoundedContainer(
                              radius: 0,
                              child: TextView(
                                text: "Get In Touch",
                                color: ColorPallete.secondary,
                                fontSize: 22,
                                alignment: TextAlign.center,
                                weight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10 * fem,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedContainer(
                                  radius: 0,
                                  child: TextView(
                                    text:
                                        "If you have any inqueries get in touch with us.\nWe will be happyto help you",
                                    color: ColorPallete.secondary,
                                    fontSize: 14,
                                    weight: FontWeight.w400,
                                    // alignment: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20 * fem,
                            ),
                            // const EntryWidget(
                            //   icon: Icon(
                            //     Icons.location_on,
                            //     color: ColorPallete.secondary,
                            //     size: 25,
                            //   ),
                            //   value: "Address",
                            // ),
                            const EntryWidget(
                              icon: Icon(
                                Icons.phone_outlined,
                                color: ColorPallete.secondary,
                                size: 25,
                              ),
                              value: "+91 7338389310 / 6364678930",
                            ),
                            const EntryWidget(
                              icon: Icon(
                                Icons.mail_outline,
                                color: ColorPallete.secondary,
                                size: 25,
                              ),
                              value: "info@swavalamban.com",
                            ),
                            // const EntryWidget(
                            //   icon: Icon(
                            //     Icons.whatsapp,
                            //     color: ColorPallete.secondary,
                            //     size: 40,
                            //   ),
                            //    value: "+91 7230000408",
                            // )
                            SizedBox(
                              height: 30 * fem,
                            ),
                            const RoundedContainer(
                              radius: 0,
                              child: TextView(
                                text: "Social Media",
                                color: ColorPallete.secondary,
                                fontSize: 18,
                                alignment: TextAlign.center,
                                weight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10 * fem,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0 * fem),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10 * fem,
                                  ),
                                  Center(
                                      child: Image.asset(
                                    "assets/ui/fb.png",
                                    height: 40 * fem,
                                  )),
                                  SizedBox(
                                    width: 15 * fem,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0 * fem),
                                      child: const TextView(
                                        text:
                                            "Saty Updated, connect, and engage with us on Facebook.",
                                        color: ColorPallete.secondary,
                                        fontSize: 14, weight: FontWeight.w400,
                                        // alignment: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0 * fem),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10 * fem,
                                  ),
                                  Center(
                                      child: Image.asset(
                                    "assets/ui/insta.png",
                                    height: 40 * fem,
                                  )),
                                  SizedBox(
                                    width: 15 * fem,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0 * fem),
                                      child: const TextView(
                                        text:
                                            "Explore our visual world and discover beauty ofour brand.",
                                        color: ColorPallete.secondary,
                                        fontSize: 14, weight: FontWeight.w400,
                                        // alignment: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0 * fem),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10 * fem,
                                  ),
                                  Center(
                                      child: Image.asset(
                                    "assets/ui/twt.png",
                                    height: 40 * fem,
                                  )),
                                  SizedBox(
                                    width: 15 * fem,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0 * fem),
                                      child: const TextView(
                                        text:
                                            "Follow us for real time updates and lively discussions.",
                                        color: ColorPallete.secondary,
                                        fontSize: 14,
                                        weight: FontWeight.w400,
                                        // alignment: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

class EntryWidget extends StatelessWidget {
  final Widget icon;
  final String value;
  const EntryWidget({super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5 * fem),
      child: RoundedContainer(
        radius: 50,
        borderColor: ColorPallete.grey,
        child: Padding(
          padding: EdgeInsets.all(10.0 * fem),
          child: Row(
            children: [
              SizedBox(
                width: 10 * fem,
              ),
              Center(child: icon),
              SizedBox(
                width: 15 * fem,
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: value
                        // "${Urls.baseUrl}website/${Get.find<AuthService>().user.value.username}",
                        )).then((p0) {
                      // log("${Urls.baseUrl}website/${Get.find<AuthService>().user.value.username}");
                      Get.showSnackbar(
                        GetSnackBar(
                          backgroundColor: ColorPallete.primary,
                          duration: Duration(seconds: 3),
                          message: "$value copied to Clipboard",
                        ),
                      );
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5.0 * fem),
                    child: TextView(
                      text: value,
                      color: ColorPallete.secondary,
                      fontSize: 14,
                      // alignment: TextAlign.center,
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
