import 'package:duseca/Utils/colors.dart';
import 'package:flutter/cupertino.dart';

Widget textWidget(
  BuildContext context,
  String text, {
  int? maxLine,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    textAlign: textAlign??TextAlign.center,
    maxLines: maxLine ?? 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      height: 1.3,
      color: color ?? AppColor.kBlack.withOpacity(0.4),
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w400,
    ),
  );
}
