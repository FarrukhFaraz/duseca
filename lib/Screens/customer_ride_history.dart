import 'package:duseca/Models/history_model.dart';
import 'package:duseca/Provider/history_provider.dart';
import 'package:duseca/Screens/earning.dart';
import 'package:duseca/Utils/colors.dart';
import 'package:duseca/Utils/navigator.dart';
import 'package:duseca/Widgets/button.dart';
import 'package:duseca/Widgets/history_page_item_widget.dart';
import 'package:duseca/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerRideHistoryScreen extends StatelessWidget {
  const CustomerRideHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: size.width,
              height: size.height,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
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
                            padding: EdgeInsets.only(
                                top: 5, right: 4, bottom: 5, left: 10),
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
                        child: textWidget(context, 'Ride History',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColor.kBlack.withOpacity(0.7)),
                      ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Consumer<HistoryProvider>(
                        builder: (context, provider, child) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.historyList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          HistoryModel model = provider.historyList[index];
                          return historyPageItemWidget(context, size, model);
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: size.width * 0.06,
              right: size.width * 0.06,
              child: InkWell(
                onTap: () {
                  navPush(context, const EarningsScreen());
                },
                child: btnWidget(
                    context, true, 'Driver Info.', 45, double.infinity),
              ),
            )
          ],
        ),
      ),
    );
  }
}
