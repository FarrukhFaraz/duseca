import 'package:flutter/material.dart';

import '../Utils/colors.dart';

Widget circleWidget(bool val, var onTap) {
  return CircleAvatar(
    radius: 14,
    backgroundColor: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              width: val ? 6 : 1.3,
              color: val ? AppColor.kMain_2 : AppColor.kBlack.withOpacity(0.65),
            )),
      ),
    ),
  );
}
