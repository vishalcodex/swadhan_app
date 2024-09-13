import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../../common/color_pallete.dart';
import '../../../../common/utils.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controller/auth_controller.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class VerifyOTPScreen extends GetView<AuthController> {
  const VerifyOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
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
                                            text: "OTP Verification",
                                            fontSize: 24,
                                            weight: FontWeight.w700,
                                            color: ColorPallete.secondary,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20 * fem,
                                        ),
                                        MyListView(
                                          children: [
                                            // Image.asset(
                                            //   "assets/ui/otp2.png",
                                            //   height: MediaQuery.of(context).size.height * 0.30,
                                            // ),
                                            SizedBox(
                                              height: 20 * fem,
                                            ),
                                            // const Center(
                                            //   child: TextView(
                                            //     text: "WELCOME",
                                            //     color: ColorPallete.secondary,
                                            //     fontSize: 18,
                                            //     weight: FontWeight.bold,
                                            //   ),
                                            // ),
                                            // SizedBox(
                                            //   height: 20 * fem,
                                            // ),
                                            Center(
                                              child: TextView(
                                                text: translations
                                                    .sixDigitOtpSent.tr,
                                                color: ColorPallete.secondary,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20 * fem,
                                            ),
                                            RoundedContainer(
                                              radius: 0,
                                              // height: 50,
                                              child: OTPTextField(
                                                length: 6,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                fieldWidth: 50 * fem,
                                                style: SafeGoogleFont(
                                                  'Roboto',
                                                  fontSize: 25 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5 * ffem / fem,
                                                  letterSpacing:
                                                      -0.349999994 * fem,
                                                  color: ColorPallete.secondary,
                                                ),
                                                contentPadding:
                                                    EdgeInsets.all(15 * fem),
                                                // obscureText: true,
                                                textFieldAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                fieldStyle: FieldStyle.box,
                                                otpFieldStyle: OtpFieldStyle(
                                                  borderColor: ColorPallete
                                                      .greyContainer,
                                                  enabledBorderColor:
                                                      ColorPallete
                                                          .greyContainer,
                                                  backgroundColor: ColorPallete
                                                      .greyContainer,
                                                  focusBorderColor: ColorPallete
                                                      .greyContainer,
                                                ),
                                                onCompleted: (pin) {
                                                  controller.creds["otp"] = pin;
                                                },
                                                onChanged: (value) {
                                                  controller.creds["otp"] =
                                                      value.length > 5
                                                          ? value
                                                          : "";
                                                },
                                              ),
                                            ),

                                            SizedBox(
                                              height: 20 * fem,
                                            ),

                                            InkWell(
                                              onTap: () {
                                                if (!controller.isLoading.value)
                                                  controller.verifyOTP();
                                              },
                                              child: RoundedContainer(
                                                radius: 10,
                                                height: 50,
                                                color: ColorPallete.primary,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.0 * fem),
                                                  child: Obx(
                                                    () => controller
                                                            .isLoading.value
                                                        ? const Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              color:
                                                                  ColorPallete
                                                                      .theme,
                                                            ),
                                                          )
                                                        : Center(
                                                            child: TextView(
                                                              text: translations
                                                                  .verifyOtp.tr,
                                                              fontSize: 16,
                                                              color:
                                                                  ColorPallete
                                                                      .theme,
                                                            ),
                                                          ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
