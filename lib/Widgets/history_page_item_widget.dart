import 'package:duseca/Models/history_model.dart';
import 'package:flutter/material.dart';

import '../Utils/colors.dart';
import 'text_widget.dart';

Widget historyPageItemWidget(
    BuildContext context, Size size, HistoryModel model) {
  return Container(
    margin: const EdgeInsets.only(top: 12),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(width: 1, color: AppColor.kGrey),
    ),
    constraints: BoxConstraints(maxHeight: size.height * 0.15),
    child: Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Row(
          children: [
            Container(
              width: size.width * 0.13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.kMain_1.withOpacity(0.39)),
            ),
            const SizedBox(width: 2),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                const CircleAvatar(
                  radius: 4,
                  backgroundColor: AppColor.kGreen,
                ),
                const SizedBox(height: 2),
                Container(
                  width: 2,
                  height: 20,
                  color: AppColor.kGrey,
                ),
                const Icon(
                  Icons.arrow_drop_down_rounded,
                  color: AppColor.kMain_1,
                ),
                const Spacer(
                  flex: 5,
                )
              ],
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 1),
                textWidget(
                  context,
                  model.text1!,
                  color: AppColor.kBlack.withOpacity(0.7),
                ),
                const Spacer(flex: 3),
                textWidget(
                  context,
                  model.text2!,
                  color: AppColor.kBlack,
                ),
                const Spacer(flex: 5),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(
                  context,
                  model.price!,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.kBlack.withOpacity(0.7),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: AppColor.kMain_1.withOpacity(0.8),
                      size: 17,
                    ),
                    textWidget(
                      context,
                      model.location!,
                      fontSize: 12,
                      color: AppColor.kBlack.withOpacity(0.7),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        Image.asset('assets/${model.image}'),
      ],
    ),
  );
}
