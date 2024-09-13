import 'package:flutter_html/flutter_html.dart';

import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class AboutUsView extends GetView<HomeController> {
  const AboutUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorPallete.theme),
            backgroundColor: ColorPallete.primary,
            // leading: InkWell(
            //   onTap: () {
            //     controller.scaffoldKey.currentState!.openDrawer();
            //   },
            //   child: const Icon(
            //     Icons.menu,
            //     color: ColorPallete.primary,
            //   ),
            // ),
            title: const TextView(
              text: "About Us",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Container(
              color: ColorPallete.theme,
              child: Column(
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0 * fem, vertical: 30 * fem),
                    child: MyListView(
                      scroll: true,
                      children: [
                        Obx(
                          () => controller.isLoading.value
                              ? const SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: ColorPallete.primary,
                                    ),
                                  ),
                                )
                              : Html(data: controller.aboutUs.value),
                        )
                        // TextView(
                        //   text:
                        //       "Welcome to South Canara Agro Mart. By accessing or using our app, you agree to comply with and be bound by the following Terms and Conditions. Please read them carefully.\n\n#### 1. Acceptance of Terms\n\nBy registering, accessing, or using South Canara Agro Mart, you agree to be bound by these Terms and Conditions, as well as our Privacy Policy. If you do not agree with any part of these terms, you must not use our app.\n\n#### 2. User Eligibility\n\nYou must be at least 18 years old and have the legal capacity to enter into binding contracts to use this app. By using the app, you represent and warrant that you meet these eligibility requirements.\n\n#### 3. Account Registration\n\n- You must create an account to access certain features of the app.\n\n- You agree to provide accurate and complete information during the registration process.\n- You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.\n\n#### 4. Use of the App\n\n- You agree to use the app only for lawful purposes and in accordance with these Terms and Conditions.\n- You must not use the app to engage in any fraudulent, misleading, or illegal activities.\n- You are prohibited from violating or attempting to violate the security of the app.\n\n#### 5. User Roles\n\n- Users can register as both buyers and sellers on the app.\n- Sellers can post listings of their products, including detailed descriptions and pricing.\n- Buyers can browse product listings and make inquiries directly to the sellers.\n\n#### 6. Listing and Selling Products\n\n- Sellers must ensure that all products listed on the app comply with applicable laws and regulations.\n- Sellers are responsible for the accuracy, quality, and legality of their product listings.\n- South Canara Agro Mart reserves the right to remove any product listings that violate these Terms and Conditions or applicable laws.\n\n#### 7. Purchasing Products\n\n- Buyers agree to purchase products in accordance with the terms specified in the product listing.\n- Buyers are responsible for ensuring that they comply with all applicable laws and regulations when purchasing products.\n\n#### 8. Communication and Transactions\n\n- All communications and transactions between buyers and sellers must be conducted through the app.\n- Any disputes, complaints, or issues regarding pricing, quality, or other matters must be resolved directly between the buyer and seller.\n\n#### 9. Limitation of Responsibility\n\n- South Canara Agro Mart and its promoters are not responsible for any disputes, complaints, or issues related to pricing, quality, or any other discussions or transactions that occur between buyers and sellers through the app.\n- The app serves solely as a platform to facilitate the connection and communication between buyers and sellers.\n\n#### 10. Payment Terms\n\n- All payments must be made through the secure payment gateways provided by South Canara Agro Mart.\n- South Canara Agro Mart is not responsible for any issues arising from transactions conducted outside of the app's payment system.\n\n#### 11. Dispute Resolution\n\n- In the event of a dispute between buyers and sellers, both parties agree to first attempt to resolve the issue amicably.\n- If a resolution cannot be reached, South Canara Agro Mart may, at its discretion, facilitate mediation between the parties, but is not obligated to do so.\n\n#### 12. Intellectual Property\n\n- All content on the app, including text, graphics, logos, and software, is the property of South Canara Agro Mart or its licensors and is protected by intellectual property laws.\n- Users may not use, reproduce, or distribute any content from the app without prior written permission.\n\n#### 13. Limitation of Liability\n\n- South Canara Agro Mart is not liable for any direct, indirect, incidental, or consequential damages arising from the use or inability to use the app.\n- South Canara Agro Mart does not guarantee the accuracy, completeness, or reliability of any content or information provided on the app.\n\n#### 14. Dispute or Disagreement with Terms\n\n- If you have any dispute or disagree with any part of these Terms and Conditions, you are requested not to use this app.\n\n#### 15. Changes to Terms and Conditions\n\n- South Canara Agro Mart reserves the right to modify these Terms and Conditions at any time. Any changes will be effective immediately upon posting on the app.\n- Your continued use of the app after any changes constitutes your acceptance of the revised Terms and Conditions.\n\n#### 16. Termination\n\n- South Canara Agro Mart may terminate or suspend your account and access to the app at any time, without prior notice, for conduct that we believe violates these Terms and Conditions or is harmful to other users.\n\n#### 17. Governing Law\n\nThese Terms and Conditions are governed by and construed in accordance with the laws of [Your Country/State], without regard to its conflict of law principles.\n\n#### 18. Contact Information\n\nFor any questions or concerns regarding these Terms and Conditions, please contact us at [Your Contact Information].\n\n---\n\n*By using South Canara Agro Mart, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions.*\n\n---",
                        //   fontSize: 14,
                        //   color: ColorPallete.secondary,
                        // ),
                      ],
                    ),
                  )
                      // : Padding(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: 20.0 * fem, vertical: 20 * fem),
                      //     child: RoundedContainer(
                      //       radius: 10,
                      //       color: ColorPallete.theme,
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(15.0),
                      //         child: MyListView(
                      //           scroll: true,
                      //           children: [
                      //             const SizedBox(
                      //               height: 20,
                      //             ),
                      //             Center(
                      //               child: Image.asset(
                      //                 "assets/ui/logo.png",
                      //                 height: 75,
                      //                 fit: BoxFit.fill,
                      //               ),
                      //             ),
                      //             const SizedBox(
                      //               height: 20,
                      //             ),
                      //             // const Center(
                      //             //   child: TextView(
                      //             //     text: "South Canara",
                      //             //     fontSize: 20,
                      //             //     color: ColorPallete.primary,
                      //             //     weight: FontWeight.bold,
                      //             //   ),
                      //             // ),
                      //             const SizedBox(
                      //               height: 20,
                      //             ),
                      //             const Center(
                      //               child: TextView(
                      //                 text: "All Rights Reserved.",
                      //                 fontSize: 14,
                      //                 color: ColorPallete.secondary,
                      //                 weight: FontWeight.w500,
                      //               ),
                      //             ),
                      //             const SizedBox(
                      //               height: 20,
                      //             ),
                      //             const Center(
                      //               child: TextView(
                      //                 text: "Version 1.0.0 v1",
                      //                 fontSize: 14,
                      //                 color: ColorPallete.secondary,
                      //                 weight: FontWeight.w600,
                      //               ),
                      //             ),
                      //             const SizedBox(
                      //               height: 20,
                      //             ),
                      //             const Center(
                      //               child: Row(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   TextView(
                      //                     text: "Contact Us :",
                      //                     fontSize: 14,
                      //                     color: ColorPallete.secondary,
                      //                     weight: FontWeight.w400,
                      //                   ),
                      //                   TextView(
                      //                     text: "info@swadhan.com",
                      //                     fontSize: 14,
                      //                     color: ColorPallete.primary,
                      //                     weight: FontWeight.w600,
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //             const SizedBox(
                      //               height: 20,
                      //             ),
                      //             const Center(
                      //               child: Row(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   TextView(
                      //                     text: "Website :",
                      //                     fontSize: 14,
                      //                     color: ColorPallete.secondary,
                      //                     weight: FontWeight.w400,
                      //                   ),
                      //                   TextView(
                      //                     text: "https://swadhan.com",
                      //                     fontSize: 14,
                      //                     color: ColorPallete.primary,
                      //                     weight: FontWeight.w600,
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //             const SizedBox(
                      //               height: 20,
                      //             ),
                      //             // const Center(
                      //             //   child: TextView(
                      //             //     text: "Address",
                      //             //     fontSize: 16,
                      //             //     color: ColorPallete.secondary,
                      //             //     weight: FontWeight.w500,
                      //             //   ),
                      //             // ),
                      //             // const SizedBox(
                      //             //   height: 10,
                      //             // ),
                      //             // const Center(
                      //             //   child: TextView(
                      //             //     text: "Address",
                      //             //     fontSize: 14,
                      //             //     color: ColorPallete.secondary,
                      //             //     weight: FontWeight.w600,
                      //             //     alignment: TextAlign.center,
                      //             //   ),
                      //             // )
                      //             const Center(
                      //               child: TextView(
                      //                 text:
                      //                     "### Welcome to Swadhan\n\n\nAt Swadhan, we pride ourselves on being a premier platform connecting buyers and sellers of high-quality dry fruits and spices. \n\n\n### Who We Are\n\n\nSwadhan is a leading supplier and broker of Cashew Kernels, Raw Cashew Nuts, and Spices. Our roots are deeply embedded in the vibrant agro-industrial community of Mangalore. We aim to revolutionize the way dry fruits and spices are traded by providing a seamless, efficient, and transparent marketplace for both buyers and sellers.\n\n\n### Our Vision\n\n\nTo be the preferred and trusted partner in the supply of high-quality agro products, fostering sustainable and eco-friendly practices. We are committed to serving our customers with nutritious and healthy products across India and the world, innovating continuously to meet the needs of a dynamic market.\n\n\n### Our Mission\n\n\n- *Quality Products at Reasonable Prices*: Ensuring our customers receive the best value without compromising on quality.\n- *Building Strong Relationships*: Creating lasting connections between our organization and customers through trust and reliability.\n- *Transparency in Business*: Educating our customers with clear, factual information and maintaining transparency in all business dealings.\n\n\n### What We Offer\n\n\n#### High-Quality Products\n- *Cashew Kernels*: Fresh, crunchy, and sourced from the best farms.\n- *Raw Cashew Nuts*: High-grade nuts ready for processing.\n- *Spices*: A wide variety of spices to add flavor and health benefits to your cuisine.\n\n\n#### Seamless Buyer-Seller Interaction\n\n- *Easy Listings*: Sellers can effortlessly list their products with high-quality images and detailed descriptions.\n- *Direct Communication*: Buyers and sellers can connect directly through our integrated messaging system.\n\n\n### Our Commitment to Quality\n\n\nQuality is at the heart of everything we do. We work closely with our suppliers to ensure that every product meets our stringent quality standards. Our quality control processes are designed to guarantee that our customers receive only the best.\n\n\nJoin Us Today\n\n\nWhether you are a seller looking to expand your market reach or a buyer seeking the best agro products, Swadhan is your ideal partner. Join our growing community and experience the difference of trading with a trusted, innovative platform.\n\n\nContact Us\n\n\nFor more details or business inquiries, please feel free to contact us.\n\n\n*South Canara Sales Corporation*  \nEmail: swadhansalescorp@gmail.com  \nWhatsApp/Mobile: +91 63646 78930 /\n+917338389310",
                      //                 fontSize: 14,
                      //                 color: ColorPallete.secondary,
                      //                 weight: FontWeight.w500,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),

                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
