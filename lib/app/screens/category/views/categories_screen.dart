import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/businessCategory.dart';
import '../controllers/category_controller.dart';
import '../widgets/category_view.dart';

// ignore: must_be_immutable
class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorPallete.theme,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorPallete.primary,
          ),
        ),
        title: const TextView(
          text: "Business Categories",
          color: ColorPallete.secondary,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 5 * fem,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Icon(
                      Icons.search,
                      color: ColorPallete.secondary,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: DropdownSearch<BusinessCategory>(
                        selectedItem: controller.selectedBusinessCategory.value,
                        popupProps: PopupProps.menu(
                          showSearchBox: true,
                          containerBuilder: (context, popupWidget) {
                            return Container(
                              color: ColorPallete.theme,
                              child: popupWidget,
                            );
                          },
                          itemBuilder: (context, item, isSelected) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0 * fem, vertical: 10 * fem),
                              child: TextView(
                                text: item.name!,
                                color: ColorPallete.secondary,
                                fontSize: 14,
                              ),
                            );
                          },
                          searchFieldProps: TextFieldProps(
                            style: TextStyle(
                                color: ColorPallete.primary,
                                fontSize: 12 * ffem),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15 * fem),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(10 * fem)),
                              hintText: "Search Location ..",
                              hintStyle: TextStyle(
                                  color: ColorPallete.grey,
                                  fontSize: 12 * ffem),
                            ),
                          ),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15 * fem),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10 * fem),
                            ),
                          ),
                          baseStyle: TextStyle(
                              color: ColorPallete.secondary,
                              fontSize: 10 * ffem),
                        ),
                        dropdownBuilder: (context, selectedItem) {
                          return TextView(
                            text: selectedItem?.name ?? "",
                            color: ColorPallete.primary,
                            fontSize: 14,
                            weight: FontWeight.bold,
                          );
                        },
                        asyncItems: (String filter) => Future(() => controller
                            .busniesCategories
                            .where((p0) => p0.name!.startsWith(filter))
                            .toList()),
                        itemAsString: (BusinessCategory u) => u.name!,
                        onChanged: (BusinessCategory? value) {}
                        // controller.onLoactionChanged(value!.name!),
                        ),
                  )
                ],
              ),
            ),
            Expanded(
              child: const CategoriesView(
                inHomeView: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
