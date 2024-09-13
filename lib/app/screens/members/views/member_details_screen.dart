import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/top_performer_model.dart';
import '../../../providers/api_endpoints.dart';

// ignore: must_be_immutable
class MemberDetailsScreen extends StatelessWidget {
  const MemberDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    Member member = Get.arguments?["member"];
    return Scaffold(
      extendBody: true,
      // backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            backgroundColor: ColorPallete.primary,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorPallete.theme,
              ),
            ),
            title: const TextView(
              text: "Member Details", // translations.blogDetails.tr,
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: MyListView(
                    scroll: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
                        child: MyListView(
                          children: [
                            SizedBox(
                              height: 10 * fem,
                            ),
                            RoundedContainer(
                              radius: 15,
                              height: 175,
                              clip: Clip.antiAliasWithSaveLayer,
                              color: ColorPallete.disableGrey,
                              child: CachedNetworkImage(
                                imageUrl:
                                    Urls.getImageUrl(member.user?.photo ?? ""),
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.fill,
                                errorWidget: (context, url, error) {
                                  return const RoundedContainer(radius: 0);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20 * fem,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextView(
                                    text:
                                        "${member.user?.firstName ?? ""} ${member.user?.lastName ?? ""}",
                                    color: ColorPallete.secondary,
                                    fontSize: 16,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10 * fem,
                            ),
                            _getPersonalDetails(fem, member),
                            _getBusinessDetails(fem, member),
                            SizedBox(
                              height: 10 * fem,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getPersonalDetails(
    double fem,
    Member member,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10 * fem),
      child: Container(
        decoration: BoxDecoration(
          color: ColorPallete.theme,
          borderRadius: BorderRadius.circular(10 * fem),
          boxShadow: [
            BoxShadow(
              color: ColorPallete.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 15,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0 * fem),
          child: RoundedContainer(
            radius: 10,
            child: MyListView(
              children: [
                const TextView(
                  text: "Personal Details",
                  color: ColorPallete.secondary,
                  weight: FontWeight.bold,
                  fontSize: 18,
                ),
                SizedBox(
                  height: 10 * fem,
                ),
                _getEntry(
                  "Name",
                  "${member.user?.firstName ?? ""} ${member.user?.lastName ?? ""}",
                ),
                _getEntry("Email", member.user?.email ?? ""),
                _getEntry(
                    "Mobile No.", "+91 ${member.user?.phoneNumber ?? ""}"),
                _getEntry(
                    "Aadhaar Card No.", member.user?.aadharCardNumber ?? ""),
                _getEntry("Gender", member.user?.gender ?? ""),
                _getEntry("BirthDate", member.user?.birthdate ?? ""),
                _getEntry("Maritial Status", member.user?.maritalStatus ?? ""),
                _getEntry("Location", member.user?.location ?? ""),
                _getEntry("Address",
                    "${member.user?.taluka ?? ""}, ${member.user?.district ?? ""}, ${member.user?.state ?? ""}"),
                _getEntry("Pin Code", member.user?.pincode ?? ""),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getBusinessDetails(
    double fem,
    Member member,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10 * fem),
      child: Container(
        decoration: BoxDecoration(
          color: ColorPallete.theme,
          borderRadius: BorderRadius.circular(10 * fem),
          boxShadow: [
            BoxShadow(
              color: ColorPallete.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 15,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0 * fem),
          child: RoundedContainer(
            radius: 10,
            child: MyListView(
              children: [
                const TextView(
                  text: "Business Details",
                  color: ColorPallete.secondary,
                  weight: FontWeight.bold,
                  fontSize: 16,
                ),
                SizedBox(
                  height: 10 * fem,
                ),
                _getEntry("Business Name", member.user?.businessName ?? ""),
                _getEntry("Owner Name", member.user?.ownerName ?? ""),
                _getEntry("Email", member.user?.email ?? ""),
                _getEntry(
                    "Mobile No.", "+91 ${member.user?.phoneNumber ?? ""}"),
                _getEntry("GST No.", member.user?.gstNumber ?? ""),
                _getEntry("Office Location", member.user?.officeLocation ?? ""),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getEntry(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: title,
            fontSize: 14,
            // weight: FontWeight.bold,
            color: ColorPallete.secondary,
          ),
          const SizedBox(
            width: 10,
          ),
          TextView(
            text: ":",
            fontSize: 14,
            weight: FontWeight.bold,
            color: ColorPallete.secondary,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextView(
              text: value,
              fontSize: 14,
              // weight: FontWeight.bold,
              color: ColorPallete.primary,
            ),
          )
        ],
      ),
    );
  }
}
