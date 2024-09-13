import 'package:flutter/material.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';

class DetailEntryWidget extends StatelessWidget {
  final String title;
  final String? value;
  const DetailEntryWidget(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10 * fem),
      child: RoundedContainer(
        radius: 0,
        child: MyListView(
          children: [
            TextView(
              text: title,
              color: ColorPallete.secondary,
              fontSize: 14,
            ),
            SizedBox(
              height: 5 * fem,
            ),
            TextView(
              text: (value ?? "") == ""
                  ? "N/A"
                  : value == "null"
                      ? "N/A"
                      : value!,
              color: ColorPallete.primary,
              fontSize: 16,
              weight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
