import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/form_fields.dart';
import '../../../components/ui/image_input.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../providers/api_endpoints.dart';
import '../controller/auth_controller.dart';

class PersonalForm extends GetView<AuthController> {
  const PersonalForm({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return MyListView(
      children: [
        const TextView(
          text: "Personal Details",
          color: ColorPallete.secondary,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
        const SizedBox(
          height: 10,
        ),
        Form(
          key: controller.personalForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyFormField(
                initialValue: controller.user.value.aadharCardNumber,
                fieldName: "Aadhar Card Number",
                type: InputType.TEXT,
                required: true,
                keyboard: TextInputType.number,
                length: 12,
                hintText: "Enter your Aadhar card number",
                onChanged: (value) {
                  controller.user.value.aadharCardNumber = value;
                },
              ),
              SizedBox(
                height: 5 * fem,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextView(
                  text: "Aadhar Card Upload*",
                  color: ColorPallete.primary,
                  fontSize: 14,
                ),
              ),
              Obx(
                () => ImageInput(
                  callback: (img) {
                    controller.user.value.aadharCardUpload = img;
                    controller.user.refresh();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5 * fem),
                    child: (controller.user.value.aadharCardUpload ?? "") != ""
                        ? RoundedContainer(
                            radius: 10,
                            height: 150,
                            width: double.infinity,
                            clip: Clip.antiAliasWithSaveLayer,
                            child: CachedNetworkImage(
                              imageUrl: Urls.getImageUrl(
                                  controller.user.value.aadharCardUpload ?? ""),
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) {
                                return Image.file(
                                  File(controller.user.value.aadharCardUpload ??
                                      ""),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.photo_outlined,
                                      size: 50,
                                      color: ColorPallete.grey,
                                    );
                                  },
                                );
                              },
                            ),
                          )
                        : RoundedContainer(
                            radius: 5,
                            color: ColorPallete.primary.withOpacity(0.1),
                            child: Padding(
                              padding: EdgeInsets.all(15.0 * fem),
                              child: const Row(
                                children: [
                                  TextView(
                                    text: "Upload a copy of your Aadhar card.",
                                    color: ColorPallete.grey,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              MyFormField(
                initialValue: controller.user.value.panCardNumber,
                fieldName: "PAN Card Number",
                type: InputType.TEXT,
                required: true,
                length: 10,
                capitalisation: true,
                hintText: "Enter your PAN card number",
                keyboard: TextInputType.text,
                validator: (value) {
                  return (value ?? "") == ""
                      ? "PAN Card Number is required."
                      : RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(value!)
                          ? null
                          : "Invalid PAN.";
                },
                onChanged: (value) {
                  controller.user.value.panCardNumber = value;
                },
              ),
              SizedBox(
                height: 5 * fem,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextView(
                  text: "PAN Card Upload*",
                  color: ColorPallete.primary,
                  fontSize: 14,
                ),
              ),
              Obx(
                () => ImageInput(
                  callback: (img) {
                    controller.user.value.panCardUpload = img;
                    controller.user.refresh();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5 * fem),
                    child: (controller.user.value.panCardUpload ?? "") != ""
                        ? RoundedContainer(
                            radius: 10,
                            height: 150,
                            width: double.infinity,
                            clip: Clip.antiAliasWithSaveLayer,
                            child: CachedNetworkImage(
                              imageUrl: Urls.getImageUrl(
                                  controller.user.value.panCardUpload ?? ""),
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) {
                                return Image.file(
                                  File(controller.user.value.panCardUpload ??
                                      ""),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.photo_outlined,
                                      size: 50,
                                      color: ColorPallete.grey,
                                    );
                                  },
                                );
                              },
                            ),
                          )
                        : RoundedContainer(
                            radius: 5,
                            color: ColorPallete.primary.withOpacity(0.1),
                            child: Padding(
                              padding: EdgeInsets.all(15.0 * fem),
                              child: const Row(
                                children: [
                                  TextView(
                                    text: "Upload a copy of your PAN card.",
                                    color: ColorPallete.grey,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 5 * fem,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextView(
                  text: "Photo*",
                  color: ColorPallete.primary,
                  fontSize: 14,
                ),
              ),
              Obx(
                () => ImageInput(
                  callback: (img) {
                    controller.user.value.photo = img;
                    controller.user.refresh();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5 * fem),
                    child: (controller.user.value.photo ?? "") != ""
                        ? RoundedContainer(
                            radius: 10,
                            height: 150,
                            width: double.infinity,
                            clip: Clip.antiAliasWithSaveLayer,
                            child: CachedNetworkImage(
                              imageUrl: Urls.getImageUrl(
                                  controller.user.value.photo ?? ""),
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) {
                                return Image.file(
                                  File(controller.user.value.photo ?? ""),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.photo_outlined,
                                      size: 50,
                                      color: ColorPallete.grey,
                                    );
                                  },
                                );
                              },
                            ),
                          )
                        : RoundedContainer(
                            radius: 5,
                            color: ColorPallete.primary.withOpacity(0.1),
                            child: Padding(
                              padding: EdgeInsets.all(15.0 * fem),
                              child: const Row(
                                children: [
                                  TextView(
                                    text: "Upload your photo.",
                                    color: ColorPallete.grey,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              MyFormField(
                initialValue: controller.user.value.maritalStatus,
                fieldName: "Marital Status",
                type: InputType.DROP_DOWN,
                required: true,
                // hintText: "Enter your location",
                dropDownOptions: ["Single", "Married", "Divorced", "Widowed"],
                keyboard: TextInputType.text,
                onChanged: (value) {
                  controller.user.value.maritalStatus = value;
                },
              ),
              MyFormField(
                initialValue: controller.user.value.location,
                fieldName: "Location",
                type: InputType.TEXT,
                required: true,
                hintText: "Enter your location",
                keyboard: TextInputType.text,
                onChanged: (value) {
                  controller.user.value.location = value;
                },
              ),
              MyFormField(
                initialValue: controller.user.value.taluka,
                fieldName: "Taluka",
                hintText: "Enter your taluka",
                type: InputType.TEXT,
                required: true,
                keyboard: TextInputType.text,
                onChanged: (value) {
                  controller.user.value.taluka = value;
                },
              ),
              MyFormField(
                initialValue: controller.user.value.district,
                fieldName: "District",
                hintText: "Enter your district",
                type: InputType.TEXT,
                required: true,
                keyboard: TextInputType.text,
                onChanged: (value) {
                  controller.user.value.district = value;
                },
              ),
              MyFormField(
                initialValue: controller.user.value.state,
                fieldName: "State",
                hintText: "Enter your state",
                type: InputType.TEXT,
                required: true,
                keyboard: TextInputType.text,
                onChanged: (value) {
                  controller.user.value.state = value;
                },
              ),
              MyFormField(
                initialValue: controller.user.value.pincode,
                fieldName: "Pincode",
                hintText: "Enter your pincode",
                type: InputType.TEXT,
                required: true,
                length: 6,
                keyboard: TextInputType.number,
                onChanged: (value) {
                  controller.user.value.pincode = value;
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
