import 'package:duseca/Provider/sign_up_provider.dart';
import 'package:flutter/material.dart';

import '../Utils/colors.dart';

Widget btnWidget(
  BuildContext context,
  bool validate,
  String text,
  double maxHeight,
  double maxWidth,
) {
  return Container(
    constraints: BoxConstraints(
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(),
        color: validate
            ? AppColor.kMain_2
            : AppColor.kMain_2.withOpacity(0.5)),
    padding: const EdgeInsets.symmetric(vertical: 10),
    alignment: Alignment.center,
    child: Text(
      text,
      style: const TextStyle(fontSize: 16, color: AppColor.kWhite),
    ),
  );
}
