import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../routes/app_routes.dart';
import '../controllers/payment_controller.dart';

// ignore: must_be_immutable
class PaymentCompleteScreen extends GetView<PaymentController> {
  const PaymentCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
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
          text: "Thank You",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          Get.offAllNamed(
            Routes.HOME,
            predicate: (route) => Get.currentRoute == "/home",
          );
          return Future.value(false);
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: RoundedContainer(
                    radius: 10,
                    child: Padding(
                      padding: EdgeInsets.all(15.0 * fem),
                      child: MyListView(
                        children: [
                          const Center(
                            child: TextView(
                              text: "Congrats",
                              fontSize: 30,
                              color: ColorPallete.red,
                              weight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20 * fem,
                          ),
                          const Center(
                            child: TextView(
                              text:
                                  "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. accompanied by English versions from the 1914 translation by H. Rackham.",
                              fontSize: 12,
                              color: ColorPallete.secondary,
                              alignment: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20 * fem,
                          ),
                          const Center(
                            child: TextView(
                              text: "This is your Website URL",
                              fontSize: 14,
                              color: ColorPallete.secondary,
                              alignment: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 15 * fem,
                          ),
                          const Center(
                            child: TextView(
                              text: "https://socialcardify.com/test1",
                              fontSize: 16,
                              color: ColorPallete.secondary,
                              alignment: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20 * fem,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.goToWebSiteUrl();
                                },
                                child: RoundedContainer(
                                  radius: 5,
                                  color: Colors.green,
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0 * fem),
                                    child: const Center(
                                      child: TextView(
                                        text: "Copy Now",
                                        fontSize: 16,
                                        color: ColorPallete.theme,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10 * fem,
                          ),
                          RoundedContainer(
                            radius: 5,
                            color: Colors.green,
                            child: Padding(
                              padding: EdgeInsets.all(15.0 * fem),
                              child: const Center(
                                child: TextView(
                                  text: "Share on Whatsapp",
                                  fontSize: 16,
                                  color: ColorPallete.theme,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10 * fem,
                          ),
                          RoundedContainer(
                            radius: 5,
                            color: Colors.green,
                            child: Padding(
                              padding: EdgeInsets.all(15.0 * fem),
                              child: const Center(
                                child: TextView(
                                  text: "Share on Facebook",
                                  fontSize: 16,
                                  color: ColorPallete.theme,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10 * fem,
                          ),
                          RoundedContainer(
                            radius: 5,
                            color: Colors.green,
                            child: Padding(
                              padding: EdgeInsets.all(15.0 * fem),
                              child: const Center(
                                child: TextView(
                                  text: "Share on Instagram",
                                  fontSize: 16,
                                  color: ColorPallete.theme,
                                ),
                              ),
                            ),
                          ),
                        ],
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
