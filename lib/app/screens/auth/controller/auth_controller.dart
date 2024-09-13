import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../models/api_response.dart';
import '../../../models/businessCategory.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class AuthController extends GetxController {
  Rx<User> user = User().obs;
  Rx<String> otp = "".obs;
  late UserRepository _userRepository;
  RxBool isLoading = false.obs;
  // RxBool isLogin = true.obs;
  RxInt currentView = 0.obs;
  RxBool showPassword = false.obs;

  RxBool validEmail = false.obs;
  RxBool validPhone = false.obs;
  RxBool validVpin = false.obs;
  RxBool verifyVpin = false.obs;

  RxBool isError = false.obs;
  RxBool isVisible = false.obs;
  RxString errorMessage = "".obs;
  // final _otplessFlutterPlugin = Otpless();
  // RxInt onStep = 1.obs;

  RxBool loginViaEmail = true.obs;

  AuthController() {
    _userRepository = UserRepository();
  }

  Map creds = {
    // "email": "karomhatre@gmail.com",
    // "phone": "9969383542",
    // "vpin": "0125",
    // "password": "p@ssw0rd"
  };
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user.value.gender = "Male";
    // if (Get.arguments != null) {
    //   toLogin.value = Get.arguments["toLogin"];
    // }
  }

  RxBool isOtpSent = false.obs;

  RxBool isCustomer = true.obs;

  Future signIn({bool? toRsd}) async {
    isLoading.value = true;
    errorMessage.value =
        loginViaEmail.value && (creds["email"] == "" || creds["email"] == null)
            ? translations.emailIsEmpty.tr
            : !loginViaEmail.value &&
                    (creds["mobile"] == "" || creds["mobile"] == null)
                ? "Phone Number should not be empty"
                : creds["password"] == "" || creds["password"] == null
                    ? translations.passwordIsEmpty.tr
                    : "";
    if (errorMessage.value != "") {
      isLoading.value = false;
      return;
    }
    _userRepository.login({
      "email": creds["email"],
      "phone_number": creds["mobile"],
      "password": creds["password"]
    }).then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        Get.showSnackbar(
          GetSnackBar(
            duration: const Duration(seconds: 2),
            message: translations.successfulLoginMsg.tr,
          ),
        );
        Get.find<AuthService>().saveUser(value.data).then((value) {
          Future.delayed(const Duration(seconds: 2), () {
            Get.offAllNamed(Routes.HOME);
          });
        });
      } else {
        Get.showSnackbar(
          GetSnackBar(
            duration: const Duration(seconds: 2),
            message: value.message ?? translations.invalidCreds.tr,
          ),
        );
      }
    });
  }

  void forgotPassword() async {
    errorMessage.value = "";
    if (creds["email"] != null && creds["email"] != ""
        // &&
        // creds["number"] != null &&
        // creds["number"] != ""

        ) {
      isLoading.value = true;
      await _userRepository.forgotPassword({
        "email": creds["email"],
        // "phone_number": creds["number"]
      }).then((value) {
        isLoading.value = false;
        if (value.status == Status.COMPLETED) {
          currentView.value = 0;
          Get.showSnackbar(GetSnackBar(
            duration: const Duration(seconds: 3),
            message: value.data["message"],
          ));
          Future.delayed(const Duration(seconds: 4), () {
            Get.back();
          });
        } else {
          currentView.value = 0;
          Get.showSnackbar(GetSnackBar(
            duration: const Duration(seconds: 3),
            message: value.message,
          ));
        }
      });
    } else {
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 3),
        message: "Invalid Email",
      ));
    }
  }

  String verifyId = "";
  void sendOTP() async {
    if (user.value.phoneNumber == null ||
        user.value.phoneNumber!.length != 10) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: ColorPallete.red,
        duration: const Duration(seconds: 3),
        message: translations.invalidPhoneNumber.tr,
      ));
    } else {
      // Future.delayed(const Duration(seconds: 1), () {
      //   Get.showSnackbar(const GetSnackBar(
      //     backgroundColor: ColorPallete.primary,
      //     duration: Duration(seconds: 3),
      //     message: "Your OTP is 123456",
      //   ));
      // });
      // Get.toNamed(Routes.OTP_VERIFY);
      isLoading.value = true;
      await fb.FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${user.value.phoneNumber}",
        verificationCompleted: (phoneAuthCredential) async {
          await fb.FirebaseAuth.instance
              .signInWithCredential(phoneAuthCredential)
              .then(
            (value) {
              // otpSent.value = false;
              creds["number"] = "";
              Get.showSnackbar(GetSnackBar(
                  duration: const Duration(seconds: 3),
                  message: translations.phoneNumberVerified.tr));
            },
          );
        },
        verificationFailed: (error) {
          isLoading.value = false;
          log(error.message!);
        },
        codeSent: (verificationId, forceResendingToken) {
          isLoading.value = false;
          verifyId = verificationId;
          Get.toNamed(Routes.OTP_VERIFY);
        },
        codeAutoRetrievalTimeout: (verificationId) {
          verifyId = verificationId;
        },
      );
    }
  }

  void verifyOTP() async {
    isLoading.value = true;
    if (creds["otp"].toString().length == 6) {
      // isLoading.value = false;
      // Get.toNamed(Routes.REGISTER);
      fb.PhoneAuthCredential credential = fb.PhoneAuthProvider.credential(
          verificationId: verifyId, smsCode: creds["otp"]);
      // Sign the user in (or link) with the credential
      try {
        await fb.FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          isLoading.value = false;
          Get.toNamed(Routes.REGISTER);
          Get.showSnackbar(
            GetSnackBar(
              backgroundColor: ColorPallete.primary,
              duration: const Duration(seconds: 3),
              message: translations.phoneNumberVerified.tr,
            ),
          );
        });
      } catch (e) {
        isLoading.value = false;
        Get.showSnackbar(GetSnackBar(
          duration: const Duration(seconds: 3),
          message: translations.invalidOtp.tr,
        ));
      }
    } else {
      isLoading.value = false;
      Get.showSnackbar(GetSnackBar(
        duration: const Duration(seconds: 3),
        message: translations.invalidOtp.tr,
      ));
    }
  }

// REGISTRATION

  Future register() async {
    // isLoading.value = true;
    // Future.delayed(const Duration(seconds: 1), () {
    //   isLoading.value = false;
    //   user.value.token = "Authorised";
    //   Get.find<AuthService>().saveUser(user.value).then((value) {
    //     Future.delayed(const Duration(seconds: 2), () {
    //       Get.offAllNamed(Routes.HOME);
    //     });
    //   });
    // });
    isLoading.value = true;

    errorMessage.value = (user.value.email ?? "") == ""
        ? translations.emailIsEmpty.tr
        : (user.value.password ?? "") == ""
            ? translations.passwordIsEmpty.tr
            : (user.value.password) != creds["confirm_password"]
                ? "Passwords do not Match !"
                : (user.value.firstName ?? "") == ""
                    ? "First Name should not be Empty"
                    : (user.value.lastName ?? "") == ""
                        ? "Last Name should not be Empty"
                        : "";
    fetchBusinessCategories();
    Get.toNamed(Routes.SIGN_UP);
    if (errorMessage.value != "") {
      isLoading.value = false;
      Get.showSnackbar(
        GetSnackBar(
          duration: const Duration(seconds: 5),
          backgroundColor: ColorPallete.red,
          message: errorMessage.value,
        ),
      );
      return;
    }

    errorMessage.value = "";
    // user.value.phoneNumber = "9876543021";
    _userRepository.register(user.toJson()).then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        Get.showSnackbar(
          GetSnackBar(
            duration: const Duration(seconds: 5),
            message: translations.registeredSuccessfully.tr,
          ),
        );
        Get.find<AuthService>().saveUser(value.data).then((value) {
          Future.delayed(const Duration(seconds: 2), () {
            fetchBusinessCategories();
            Get.toNamed(Routes.SIGN_UP);
          });
        });
      } else {
        Get.showSnackbar(
          GetSnackBar(
            duration: const Duration(seconds: 5),
            backgroundColor: ColorPallete.red,
            message: value.message ?? translations.errorUpdatingDetails.tr,
          ),
        );
        // errorMessage.value =
        //     value.message ?? translations.errorUpdatingDetails.tr;
      }
    });
  }

  RxList<BusinessCategory> busniesCategories = <BusinessCategory>[].obs;

  fetchBusinessCategories() async {
    await _userRepository.fetchBusinessCategories().then((value) {
      if (value.status == Status.COMPLETED) {
        busniesCategories.value = value.data;
        busniesCategories.refresh();
      } else {}
    });
  }

  void onBusinessCategoryChanged(String value) {
    user.value.businessCategoryId =
        busniesCategories.where((p0) => p0.name == value).first.id.toString();
  }

  RxBool isBusinessForm = true.obs;

  GlobalKey<FormState> personalForm = GlobalKey<FormState>();

  void validateToContinue() async {
    if (isBusinessForm.value) {
      isLoading.value = true;
      await _userRepository.submitBusinessDetails(user.value).then((value) {
        isLoading.value = false;
        if (value.status == Status.COMPLETED) {
          isBusinessForm.value = !isBusinessForm.value;
          Get.showSnackbar(
            const GetSnackBar(
              backgroundColor: ColorPallete.primary,
              duration: Duration(seconds: 3),
              message: "Business Details Saved Successfully !",
            ),
          );
        } else {
          Get.showSnackbar(GetSnackBar(
            backgroundColor: ColorPallete.red,
            duration: const Duration(seconds: 3),
            message: value.message,
          ));
        }
      });
    } else {
      if (personalForm.currentState!.validate()) {
        if ((user.value.aadharCardUpload ?? "") != "" &&
            (user.value.panCardUpload ?? "") != "" &&
            (user.value.photo ?? "") != "") {
          isLoading.value = true;
          await _userRepository.submitPersonalDetails(user.value).then((value) {
            if (value.status == Status.COMPLETED) {
              isLoading.value = false;
              Get.find<AuthService>().saveUser(value.data).then((value) {
                Get.showSnackbar(
                  const GetSnackBar(
                    backgroundColor: ColorPallete.primary,
                    duration: Duration(seconds: 3),
                    message: "Personal Details Saved Successfully !",
                  ),
                );
                Future.delayed(const Duration(seconds: 2), () {
                  Get.offAllNamed(Routes.HOME);
                });
              });
            } else {
              Get.showSnackbar(GetSnackBar(
                backgroundColor: ColorPallete.red,
                duration: const Duration(seconds: 3),
                message: value.message,
              ));
            }
          });
        } else {
          isLoading.value = false;
          Get.showSnackbar(const GetSnackBar(
            backgroundColor: ColorPallete.red,
            duration: Duration(seconds: 3),
            message: "Aadhar , PAN & Profile Photo Requied",
          ));
        }
      }
    }
  }
}
