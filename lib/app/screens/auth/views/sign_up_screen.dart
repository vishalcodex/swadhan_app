import '../../../components/ui/my_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controller/auth_controller.dart';
import '../widgets/business_details_form.dart';
import '../widgets/personal_details_form.dart';

class SignUpScreen extends GetView<AuthController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          resizeToAvoidBottomInset: true,
          body: WillPopScope(
            onWillPop: () {
              if (!controller.isBusinessForm.value) {
                controller.isBusinessForm.value =
                    !controller.isBusinessForm.value;
              } else {
                Get.back();
              }
              return Future.value(false);
            },
            child: Obx(
              () => Column(
                children: [
                  SizedBox(
                    height: 50 * fem,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            if (!controller.isBusinessForm.value) {
                              controller.isBusinessForm.value =
                                  !controller.isBusinessForm.value;
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0 * fem, vertical: 5 * fem),
                            child: Icon(
                              Icons.arrow_back,
                              color: ColorPallete.secondary,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: MyListView(
                      scroll: true,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10.0 * fem),
                            child: controller.isBusinessForm.value
                                ? BusinessForm()
                                : PersonalForm())
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        if (!controller.isLoading.value) {
                          controller.validateToContinue();
                        }
                      },
                      child: RoundedContainer(
                        radius: 10,
                        height: 50,
                        color: ColorPallete.primary,
                        child: Center(
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: ColorPallete.theme,
                                )
                              : TextView(
                                  text: controller.isBusinessForm.value
                                      ? "Next"
                                      : "Submit",
                                  color: ColorPallete.theme,
                                  fontSize: 16,
                                  weight: FontWeight.bold,
                                ),
                        ),
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
    paint.color = ColorPallete.primary;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.10);
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
