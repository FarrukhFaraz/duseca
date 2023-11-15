import 'package:duseca/Provider/earning_provider.dart';
import 'package:duseca/Utils/colors.dart';
import 'package:duseca/Widgets/bar_chart.dart';
import 'package:duseca/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EarningMainWidget extends StatelessWidget {
  const EarningMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<EarningProvider>(builder: (context, provider, child) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget(context, 'Your earning',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColor.kBlack.withOpacity(0.65)),
                DropdownMenu(
                  label: Text(
                    provider.initialValue,
                    // textAlign: TextAlign.center,
                    maxLines: 1,
                    style: const TextStyle(color: AppColor.kMain_1),
                  ),
                  inputDecorationTheme: const InputDecorationTheme(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      isDense: true,
                      outlineBorder: BorderSide.none,
                      focusedErrorBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      labelStyle: TextStyle(color: AppColor.kWhite),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      isCollapsed: true),
                  trailingIcon: Container(),
                  leadingIcon: const Icon(
                    Icons.arrow_drop_down_rounded,
                    color: AppColor.kMain_1,
                  ),
                  onSelected: (val) {
                    provider.initialValue = val!;
                  },
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(
                      value: 'This week',
                      label: 'This week',
                    ),
                    DropdownMenuEntry(
                      value: 'This month',
                      label: 'This month',
                    ),
                    DropdownMenuEntry(
                      value: 'This year',
                      label: 'This year',
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
                height: size.height * 0.6,
                width: size.width,
                child: BarChartWidget()),
          ],
        ),
      );
    });
  }
}
