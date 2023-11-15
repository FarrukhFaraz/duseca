import 'package:duseca/Utils/colors.dart';
import 'package:duseca/Widgets/billing_main_widget.dart';
import 'package:duseca/Widgets/earning_main_widget.dart';
import 'package:duseca/Widgets/no_rides_main_widget.dart';
import 'package:duseca/Widgets/review_main_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../Widgets/text_widget.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      animationDuration: const Duration(milliseconds: 500),
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.kWhite,
          leading: Container(),
          leadingWidth: 0,
          title: Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: size.width*0.06,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(20),
                    child: const Padding(
                      padding:
                          EdgeInsets.only(top: 5, right: 4, bottom: 5, left: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.kMain_1,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: textWidget(context, 'Driver Info.',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColor.kBlack.withOpacity(0.7)),
                ))
              ],
            ),
          ),
          bottom:   TabBar(
            tabs: const <Tab>[
              Tab(text: 'Earnings'),
              Tab(text: 'No. Rides'),
              Tab(text: 'Billings'),
              Tab(text: 'Reviews'),
            ],
            indicatorWeight: 2,
            indicatorColor: AppColor.kMain_1,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: const EdgeInsets.all(1),
            // labelPadding: EdgeInsets.all(0),
            splashBorderRadius: BorderRadius.circular(12),
            automaticIndicatorColorAdjustment: true,
            // padding: EdgeInsets.all(0),
            isScrollable: true,
            tabAlignment: TabAlignment.center,
          ),
        ),
        body: const TabBarView(children: [
          EarningMainWidget(),
          NoRidesMainWidget(),
          BillingMainWidget(),
          ReviewMainWidget(),
        ])

      ),
    );
  }
}
