import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/color_pallete.dart';
import '../routes/app_routes.dart';
import 'ui/my_list_view.dart';
import 'ui/rounded_container.dart';
import 'ui/text_view.dart';
import '../../common/transalations/translation_keys.dart' as translations;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final Shader linearGradient = LinearGradient(
  //   colors: <Color>[Ui.parseColor("#FFA36F"), Ui.parseColor("#FF659C")],
  // ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  bool showAuthOptions = false;
  bool showLangOptions = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: ColorPallete.primary,
      ),
    );
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(Routes.HOME);
    });

    // Future.delayed(const Duration(seconds: 1), () async {
    //   await SliderRepository().fetchSettings().then((value) async {
    //     if (value.status == Status.COMPLETED) {
    //       Setting settings = value.data;
    //       PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //       var needUpdate = compareVersion(
    //           appVersion: packageInfo.version,
    //           latestVersion: settings.appVersion!);
    //       if (needUpdate) {
    //         showUpdateDialog(context);
    //       } else {
    //         Get.offAndToNamed(Routes.HOME);
    //       }
    //     }
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Scaffold(
      backgroundColor: ColorPallete.theme,
      body: Container(
        color: ColorPallete.theme,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0 * fem),
                    child: Image.asset(
                      "assets/ui/logo.png",
                      fit: BoxFit.fitWidth,
                      // color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLanguagePopUp(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: MyListView(
              children: [
                const Center(
                  child: TextView(
                    text: "Choose Language",
                    color: ColorPallete.primary,
                    fontSize: 16,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15 * fem,
                ),
                SizedBox(
                  height: 100 * fem,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            Get.updateLocale(const Locale("en", "EN"))
                                .then((value) async {
                              await GetStorage().write("lang", "en");
                            });
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/ui/english.png",
                                height: 80 * fem,
                                width: 80 * fem,
                                color: Color(0xff6e61b7),
                              ),
                              const Spacer(),
                              Center(
                                child: TextView(
                                  text: translations.eng.tr,
                                  color: ColorPallete.primary,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            Get.updateLocale(const Locale("mr", "MAR"))
                                .then((value) async {
                              await GetStorage().write("lang", "mr");
                            });
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Image.asset(
                                    "assets/ui/marathi.png",
                                    height: 65 * fem,
                                    width: 65 * fem,
                                    // color: Color(0xff6e61b7),
                                  ),
                                ),
                              ),
                              Center(
                                child: TextView(
                                  text: translations.mar.tr,
                                  color: ColorPallete.primary,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void showUpdateDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RoundedContainer(
              radius: 0,
              child: MyListView(
                children: [
                  const TextView(
                    text: "Update Available !",
                    color: ColorPallete.primary,
                    fontSize: 16,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const TextView(
                    text:
                        "New update available on Play Store. Please Update the app.",
                    color: ColorPallete.grey,
                    fontSize: 14,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          if (Platform.isAndroid || Platform.isIOS) {
                            final appId = Platform.isAndroid
                                ? 'com.codex.swadhan'
                                : 'YOUR_IOS_APP_ID';
                            final url = Uri.parse(
                              Platform.isAndroid
                                  ? "market://details?id=$appId"
                                  : "https://apps.apple.com/app/id$appId",
                            );
                            launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        child: const RoundedContainer(
                          radius: 10,
                          color: ColorPallete.primary,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: TextView(
                              text: "Update",
                              color: ColorPallete.theme,
                              fontSize: 13,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
