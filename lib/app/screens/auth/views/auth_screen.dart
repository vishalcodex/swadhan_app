import 'dart:math';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/text_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../controller/auth_controller.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;
import '../widgets/auth_text_field.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.97,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white,
                    child: CustomPaint(
                      painter: CurvePainter(),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.30,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Transform.rotate(
                        angle: pi / 4,
                        // origin: Offset(
                        //     (MediaQuery.of(context).size.width / (pow(2, 1 / 2))) / 2,
                        //     (MediaQuery.of(context).size.width / (pow(2, 1 / 2))) /
                        //         2),
                        child: Container(
                          // radius: 40,
                          decoration: BoxDecoration(
                              color: ColorPallete.theme,
                              borderRadius: BorderRadius.circular(40 * fem)),
                          height: MediaQuery.of(context).size.width *
                              1.1 /
                              (pow(2, 1 / 2)),
                          width: MediaQuery.of(context).size.width *
                              1.1 /
                              (pow(2, 1 / 2)),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: MyListView(
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/ui/logo.png",
                                    fit: BoxFit.fitWidth,
                                    height: 200,
                                    // color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Center(
                              child: Container(
                                child: RoundedContainer(
                                  radius: 20,
                                  clip: Clip.antiAliasWithSaveLayer,
                                  // color: ColorPallete.theme,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: MyListView(
                                      // mainAxisSize: MainAxisSize.min,
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Center(
                                          child: TextView(
                                            text: "Verifying Number",
                                            fontSize: 24,
                                            weight: FontWeight.w700,
                                            color: ColorPallete.secondary,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20 * fem,
                                        ),
                                        Center(
                                          child: TextView(
                                            text: translations
                                                .enterNumberToContinue.tr,
                                            color: ColorPallete.secondary,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30.0,
                                        ),
                                        Obx(
                                          () => MyListView(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              AuthTextField(
                                                keyboard: TextInputType.phone,
                                                label:
                                                    translations.phoneNumber.tr,
                                                onChanged: (value) {
                                                  controller.user.value
                                                      .phoneNumber = value;
                                                },
                                              ),
                                              SizedBox(
                                                height: 20 * fem,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.0 * fem),
                                                child: TextView(
                                                  text: translations
                                                      .sixDigitOtp.tr,
                                                  color: ColorPallete.secondary,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20 * fem,
                                              ),
                                              SizedBox(
                                                height: 20 * fem,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (!controller
                                                      .isLoading.value) {
                                                    controller.sendOTP();
                                                  }
                                                },
                                                // inkwell color
                                                child: RoundedContainer(
                                                  radius: 5,
                                                  height: 50,
                                                  color: ColorPallete.primary,
                                                  child: Center(
                                                    child: SizedBox(
                                                      child: controller
                                                              .isLoading.value
                                                          ? const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor: AlwaysStoppedAnimation<
                                                                        Color>(
                                                                    ColorPallete
                                                                        .theme),
                                                                strokeWidth:
                                                                    5.0,
                                                              ),
                                                            )
                                                          : const TextView(
                                                              text: "Send OTP",
                                                              color:
                                                                  ColorPallete
                                                                      .theme,
                                                              fontSize: 16,
                                                              weight: FontWeight
                                                                  .bold,
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 16.0),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: <Widget>[
                          //       const Text(
                          //         'Don\'t have an account? ',
                          //         style: TextStyle(
                          //             color: ColorPallete.secondary,
                          //             fontWeight: FontWeight.w500,
                          //             fontSize: 16),
                          //       ),
                          //       GestureDetector(
                          //         onTap: () {
                          //           Get.toNamed(Routes.REGISTER);
                          //         },
                          //         child: const Text(
                          //           'Create now',
                          //           style: TextStyle(
                          //               color: ColorPallete.primary,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 16),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
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

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = ColorPallete.primary.withOpacity(0.2);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.50);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
