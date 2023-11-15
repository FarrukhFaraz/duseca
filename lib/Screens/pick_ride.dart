import 'package:duseca/Models/car_seat_model.dart';
import 'package:duseca/Provider/pick_up_provider.dart';
import 'package:duseca/Screens/customer_ride_history.dart';
import 'package:duseca/Utils/navigator.dart';
import 'package:duseca/Widgets/button.dart';
import 'package:duseca/Utils/colors.dart';
import 'package:duseca/Widgets/book_seat_widget.dart';
import 'package:duseca/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PickRideScreen extends StatelessWidget {
  const PickRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: size.height * 0.15),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Center(
                        child: textWidget(context, 'Book Seat',
                            color: AppColor.kBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.06, vertical: 6),
                      decoration: BoxDecoration(
                          color: AppColor.kMain_2.withOpacity(0.4)),
                      child: Row(
                        children: [
                          bookSeatWidget(context, 'Available', AppColor.kGreen),
                          const Spacer(),
                          bookSeatWidget(
                              context, 'Unavailable', AppColor.kGrey),
                          const Spacer(),
                          bookSeatWidget(context, 'Selected', AppColor.kMain_1),
                        ],
                      ),
                    ),
                    Consumer<PickUpProvider>(
                        builder: (context, provider, child) {
                      return Column(
                        children: [
                          Slider(
                            value: provider.seatCount,
                            min: 9.0,
                            max: 20.0,
                            divisions: 11,
                            label: provider.seatCount.toStringAsFixed(0),
                            onChanged: (val) {
                              provider.setSeatCount(val);
                            },
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            child: InkWell(
                                onTap: () {
                                  provider.addAllInList(int.parse(
                                      provider.seatCount.toStringAsFixed(0)));
                                },
                                child: btnWidget(
                                    context,
                                    provider.seatCount != provider.totalSeat,
                                    'Update',
                                    45,
                                    size.width * 0.2)),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: size.width * 0.4,
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: provider.totalSeat == 10 || provider.totalSeat == 13
                                      ? size.width * 0.039 * provider.totalSeat
                                      : size.width * 0.036 * provider.totalSeat,
                                  bottom: 40),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(
                                  'assets/car.png',
                                ),
                                fit: BoxFit.fill,
                              )),
                              child: GridView.builder(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: size.width * 0.08),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: provider.seatList.length,
                                itemBuilder: (context, index) {
                                  CarSeatModel model = provider.seatList[index];
                                  return Container(
                                    padding: EdgeInsets.only(
                                        top: index == 0
                                            ? 0
                                            : index == 1
                                                ? 10
                                                : 3),
                                    child: InkWell(
                                      onTap: () {
                                        if (index != 0 && index != 1) {
                                          provider.updateSeat(index);
                                        }
                                      },
                                      child: Image.asset(
                                        'assets/${model.selectedImage}',
                                        width: index == 1 ? 2 : null,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: size.height * 0.06,
                child: InkWell(
                  onTap: (){
                    navPush(context, const CustomerRideHistoryScreen());
                  },
                  child: btnWidget(
                      context, true, 'Select Seat', 45, size.width * 0.9),
                )),
          ],
        ),
      ),
    );
  }
}
