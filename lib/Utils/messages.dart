import 'package:flutter/material.dart';

import 'colors.dart';


showSnackMessage(BuildContext context, String msg , {int? time, Color? color}) {
  final duration = Duration(seconds: time ?? 3);
  final backgroundColor = color??AppColor.kLightBlue;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg , textAlign: TextAlign.center,style: const TextStyle(fontSize: 16),),
      backgroundColor: backgroundColor,
      elevation: 4,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      duration: duration,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      dismissDirection: DismissDirection.endToStart,
    ),
  );
}
