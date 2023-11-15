import 'package:duseca/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

Widget bookSeatWidget(BuildContext context , String text , Color color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        constraints: const BoxConstraints(
          maxWidth: 20,
          maxHeight: 20
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: color
          ),
          borderRadius: BorderRadius.circular(2),
          color: color
        ),
      ),
      const SizedBox(width: 10),
      textWidget(context, text),
    ],
  );
}
