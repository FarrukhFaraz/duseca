

import 'package:duseca/Utils/colors.dart';
import 'package:flutter/material.dart';

import '../Utils/constants.dart';

Widget signUpDusecaWidget(BuildContext context, Size size){
  return Container(
    constraints: BoxConstraints(
      maxWidth: size.width/2
    ),
      padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1.5 , color: AppColor.kMain_1,)
      ),
      // alignment: Alignment.center,
      child: const Text(AppConstants.duseca , style: TextStyle(color: AppColor.kMain_1, fontSize: 18 , fontWeight: FontWeight.bold),));
}