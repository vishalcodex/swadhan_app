import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swavalamban/app/screens/auth/widgets/auth_text_field.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../routes/app_routes.dart';
import '../controller/auth_controller.dart';

import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

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
                                        Center(
                                          child: TextView(
                                            text: translations.login.tr,
                                            fontSize: 24,
                                            weight: FontWeight.w700,
                                            color: ColorPallete.secondary,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30.0,
                                        ),
                                        Obx(
                                          () => MyListView(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              controller.loginViaEmail.value
                                                  ? AuthTextField(
                                                      label:
                                                          translations.email.tr,
                                                      keyboard: TextInputType
                                                          .emailAddress,
                                                      onChanged: (value) {
                                                        controller.creds[
                                                            "email"] = value;
                                                      },
                                                    )
                                                  : AuthTextField(
                                                      keyboard:
                                                          TextInputType.phone,
                                                      label: translations
                                                          .phoneNumber.tr,
                                                      onChanged: (value) {
                                                        controller.creds[
                                                            "mobile"] = value;
                                                      },
                                                    ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controller
                                                          .loginViaEmail.value =
                                                      !controller
                                                          .loginViaEmail.value;
                                                  controller.loginViaEmail
                                                      .refresh();
                                                  controller.creds["email"] =
                                                      "";
                                                  controller.creds["mobile"] =
                                                      "";
                                                },
                                                child: TextView(
                                                  text:
                                                      "Login Via ${controller.loginViaEmail.value ? "Phone Number" : "Email"}",
                                                  fontSize: 14,
                                                  weight: FontWeight.w700,
                                                  alignment: TextAlign.end,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              AuthTextField(
                                                obscureText: controller
                                                    .showPassword.value,
                                                keyboard: TextInputType
                                                    .visiblePassword,
                                                label: translations.password.tr,
                                                suffixIcon: TextButton(
                                                  onPressed: () {
                                                    controller.errorMessage
                                                        .value = "";
                                                    Get.toNamed(
                                                        Routes.FORGOT_PASSWORD);
                                                  },
                                                  child: const RoundedContainer(
                                                    radius: 60,
                                                    child: TextView(
                                                      text: "Forgot?",
                                                      fontSize: 14,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                onChanged: (value) {
                                                  controller.creds["password"] =
                                                      value;
                                                },
                                              ),
                                              SizedBox(
                                                height: 20 * fem,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (!controller
                                                      .isLoading.value) {
                                                    controller.signIn();
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
                                                              text: "Log in",
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
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  'Don\'t have an account? ',
                                  style: TextStyle(
                                      color: ColorPallete.secondary,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.AUTH);
                                  },
                                  child: const Text(
                                    'Create now',
                                    style: TextStyle(
                                        color: ColorPallete.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
