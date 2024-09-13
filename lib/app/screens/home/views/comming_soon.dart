import 'package:flutter/material.dart';
import 'package:swavalamban/app/components/ui/text_view.dart';
import 'package:swavalamban/common/color_pallete.dart';

class CommingSoonView extends StatelessWidget {
  const CommingSoonView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
            child: Center(
          child: TextView(
            text: "Coming Soon ...",
            fontSize: 25,
            color: ColorPallete.grey,
            weight: FontWeight.bold,
          ),
        ))
      ],
    );
  }
}
