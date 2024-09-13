import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/payment_controller.dart';

// ignore: must_be_immutable
class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({Key? key}) : super(key: key);

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
          text: "Online Payment",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0 * fem),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 2.5,
                            color: ColorPallete.grey.withOpacity(0.5),
                            offset: Offset(0, 5 * fem),
                          )
                        ]),
                    child: RoundedContainer(
                      radius: 10,
                      color: ColorPallete.theme,
                      child: Padding(
                        padding: EdgeInsets.all(15.0 * fem),
                        child: MyListView(
                          children: [
                            TextView(
                              text: "Group Name",
                              fontSize: 14,
                            ),
                            SizedBox(
                              height: 10 * fem,
                            ),
                            TextView(
                              text:
                                  "grocery retail and vibrant textile and handloom sectors to eco-friendly organic farming enterprises and sustainable product ventures, these businesses contribute significantly to India's economic diversity. Services such as cleaning, catering, floristry, tailoring, and wellness,including yoga studios",
                            ),
                            SizedBox(
                              height: 20 * fem,
                            ),
                            const Center(
                              child: TextView(
                                text: "₹ 299/-",
                                fontSize: 25,
                                color: ColorPallete.secondary,
                              ),
                            ),
                            SizedBox(
                              height: 10 * fem,
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
                                          text: "Pay Now",
                                          fontSize: 16,
                                          color: ColorPallete.theme,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
