import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:swavalamban/app/components/ui/form_fields.dart';
import 'package:swavalamban/app/screens/auth/widgets/auth_text_field.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controller/auth_controller.dart';

class RegisterScreen extends GetView<AuthController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () => Future.value(true),
          child: Scaffold(
              backgroundColor: ColorPallete.theme,
              resizeToAvoidBottomInset: true,
              body: Column(
                children: [
                  SizedBox(
                    height: 10 * fem,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15 * fem),
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: ColorPallete.primary,
                          ),
                          const Spacer(),
                          TextView(
                            text: "Login",
                            fontSize: 16,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: MyListView(
                    scroll: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10 * fem),
                        child: MyListView(
                          children: [
                            const TextView(
                              text: "Swadhan",
                              fontSize: 22,
                              weight: FontWeight.bold,
                              color: ColorPallete.secondary,
                            ),
                            SizedBox(
                              height: 15 * fem,
                            ),
                            const TextView(
                              text: "Register details",
                              fontSize: 16,
                              weight: FontWeight.bold,
                              color: ColorPallete.secondary,
                            ),
                            SizedBox(
                              height: 15 * fem,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextView(
                                text: "Phone Number",
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 5 * fem,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: RoundedContainer(
                                radius: 5,
                                color: ColorPallete.primary.withOpacity(0.1),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: TextView(
                                    text: controller.user.value.phoneNumber!,
                                    fontSize: 14,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            // MyFormField(
                            //   fieldName: "Gender",
                            //   type: InputType.DROP_DOWN,
                            //   keyboard: TextInputType.none,
                            //   dropDownOptions: ["Male", "Female", "Others"],
                            //   onChanged: (value) {},
                            // ),
                            SizedBox(
                              height: 10 * fem,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextView(
                                text: "Gender",
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 10 * fem,
                            ),
                            Obx(
                              () => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 0),
                                child: Row(
                                  children: ["Male", "Female"].map((e) {
                                    bool selected = e ==
                                        (controller.user.value.gender ?? "");
                                    return Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          controller.user.value.gender = e;
                                          controller.user.refresh();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                selected
                                                    ? Icons.radio_button_checked
                                                    : Icons.radio_button_off,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 10 * fem,
                                              ),
                                              TextView(
                                                text: e,
                                                color: ColorPallete.primary,
                                                fontSize: 14,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5 * fem),
                              child: Form(
                                  child: Column(
                                children: [
                                  AuthTextField(
                                    label: "First Name*",
                                    fontSize: 14,
                                    onChanged: (value) {
                                      controller.user.value.firstName = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15 * fem,
                                  ),
                                  AuthTextField(
                                    label: "Last Name*",
                                    fontSize: 14,
                                    onChanged: (value) {
                                      controller.user.value.lastName = value;
                                    },
                                  ),
                                ],
                              )),
                            ),
                            SizedBox(
                              height: 10 * fem,
                            ),
                            MyFormField(
                              fieldName: "Birthday",
                              initialValue: controller.user.value.birthdate ==
                                      null
                                  ? null
                                  : DateFormat("dd-MM-yyyy").format(
                                      DateFormat("yyyy-MM-dd").parse(
                                          controller.user.value.birthdate!)),
                              type: InputType.DATE,
                              keyboard: TextInputType.none,
                              onChanged: (value) {
                                controller.user.value.birthdate =
                                    DateFormat("yyyy-MM-dd").format(
                                        DateFormat("dd-MM-yyyy").parse(value));
                              },
                            ),

                            Padding(
                              padding: EdgeInsets.all(10 * fem),
                              child: Form(
                                  child: Column(
                                children: [
                                  AuthTextField(
                                    label: "Email*",
                                    fontSize: 14,
                                    onChanged: (value) {
                                      controller.user.value.email = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15 * fem,
                                  ),
                                  AuthTextField(
                                    label: "Password*",
                                    obscureText: true,
                                    fontSize: 14,
                                    onChanged: (value) {
                                      controller.user.value.password = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15 * fem,
                                  ),
                                  Obx(
                                    () => AuthTextField(
                                      label: "Confirm Password*",
                                      obscureText: controller.isVisible.value,
                                      fontSize: 14,
                                      onChanged: (value) {
                                        controller.creds["confirm_password"] =
                                            value;
                                      },
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            controller.isVisible.value =
                                                !controller.isVisible.value;
                                          },
                                          icon: Icon(
                                            controller.isVisible.value
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: ColorPallete.primary,
                                          )),
                                    ),
                                  )
                                ],
                              )),
                            ),
                            // SizedBox(
                            //   height: 20 * fem,
                            // ),
                            // const TextView(
                            //   text: "Birthday (Optional)",
                            //   fontSize: 18,
                            //   weight: FontWeight.bold,
                            //   color: ColorPallete.secondary,
                            // ),
                          ],
                        ),
                      )
                    ],
                  ))
                ],
              ),
              floatingActionButton: Obx(
                () => InkWell(
                  onTap: () {
                    if (!controller.isLoading.value) {
                      controller.register();
                    }
                  },
                  child: RoundedContainer(
                      radius: 50,
                      height: 50,
                      color: ColorPallete.primary,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          controller.isLoading.value
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0 * fem),
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: ColorPallete.theme,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0 * fem,
                                      vertical: 15 * fem),
                                  child: const TextView(
                                    text: "Join Now",
                                    fontSize: 16,
                                    weight: FontWeight.w500,
                                    color: ColorPallete.theme,
                                  ),
                                ),
                        ],
                      )),
                ),
              )),
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
