import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/form_fields.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/text_view.dart';
import '../controller/auth_controller.dart';

class BusinessForm extends GetView<AuthController> {
  const BusinessForm({super.key});

  @override
  Widget build(BuildContext context) {
    // double baseWidth = 393;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    return MyListView(
      children: [
        const TextView(
          text: "Business Details",
          color: ColorPallete.secondary,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyFormField(
              initialValue: controller.user.value.gstNumber,
              fieldName: "GST Number",
              type: InputType.TEXT,
              length: 15,
              keyboard: TextInputType.name,
              hintText: "Enter your GST number (optional)",
              onChanged: (value) {
                controller.user.value.gstNumber = value;
              },
            ),
            Obx(
              () => MyFormField(
                initialValue:
                    (controller.user.value.businessCategoryId ?? "") == ""
                        ? null
                        : controller
                            .busniesCategories
                            .where((p0) =>
                                p0.id.toString() ==
                                controller.user.value.businessCategoryId)
                            .first
                            .name,
                fieldName: "Business Category",
                type: InputType.DROP_DOWN,
                hintText: "Enter your business name",
                dropDownOptions: controller.busniesCategories
                    .map((element) => element.name)
                    .toList(),
                keyboard: TextInputType.name,
                onChanged: (value) {
                  controller.onBusinessCategoryChanged(value);
                },
              ),
            ),
            MyFormField(
              initialValue: controller.user.value.businessName,
              fieldName: "Business Name",
              type: InputType.TEXT,
              hintText: "Enter your business name",
              keyboard: TextInputType.name,
              onChanged: (value) {
                controller.user.value.businessName = value;
              },
            ),
            MyFormField(
              initialValue: controller.user.value.ownerName,
              fieldName: "Owner Name",
              type: InputType.TEXT,
              hintText: "Enter your owner's name",
              keyboard: TextInputType.name,
              onChanged: (value) {
                controller.user.value.ownerName = value;
              },
            ),
            // SizedBox(
            //   height: 5 * fem,
            // ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10.0),
            //   child: TextView(
            //     text: "Business Document",
            //     color: ColorPallete.primary,
            //     fontSize: 14,
            //   ),
            // ),
            // Obx(
            //   () => InkWell(
            //     onTap: () async {
            //       FilePickerResult? result =
            //           await FilePicker.platform.pickFiles();
            //       if (result != null) {
            //         File file = File(result.files.single.path!);
            //         controller.user.value.businessDocument = file.path;
            //         controller.user.refresh();
            //       } else {
            //         // User canceled the picker
            //       }
            //     },
            //     child: Padding(
            //       padding: EdgeInsets.all(5 * fem),
            //       child: RoundedContainer(
            //         radius: 5,
            //         color: ColorPallete.primary.withOpacity(0.1),
            //         child: Padding(
            //           padding: EdgeInsets.all(15.0 * fem),
            //           child: Row(
            //             children: [
            //               TextView(
            //                 text: controller.user.value.businessDocument ??
            //                     "Upload relevant business documents.",
            //                 color: ColorPallete.grey,
            //                 fontSize: 14,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            MyFormField(
              initialValue: controller.user.value.officeLocation,
              fieldName: "Office Location",
              hintText: "Enter the full address of your office location",
              type: InputType.TEXT,
              keyboard: TextInputType.name,
              onChanged: (value) {
                controller.user.value.officeLocation = value;
              },
            )
          ],
        )
      ],
    );
  }
}
