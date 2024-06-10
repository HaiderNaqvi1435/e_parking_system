import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:e_parking_system/res/widgets/my_app_bar.dart';
import 'package:e_parking_system/utils/const_size/const_size.dart';
import 'package:e_parking_system/viewmodels/checkout_viewmodel.dart';
import 'package:e_parking_system/viewmodels/slot_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/text_styles/text_styles.dart';

class MyBookingView extends StatefulWidget {
  const MyBookingView({super.key});

  @override
  State<MyBookingView> createState() => _MyBookingViewState();
}

class _MyBookingViewState extends State<MyBookingView> {
  final svm = Get.find<SlotViewmodel>();
  final cvm = Get.find<CheckoutViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("My Bookings"),
      body: Padding(
        padding: ConstSize.hvP1,
        child: Obx(
          () => ListView.builder(
            itemCount: svm.mySlots.length,
            itemBuilder: (context, index) => ListTile(
              shape: UnderlineInputBorder(
                  borderSide:
                      BorderSide(width: .5, color: Colors.grey.shade400)),
              title: Text(
                "Booked ${svm.mySlots[index].slotNo} for ${svm.mySlots[index].timeInHours} hour",
                style: TextStyles.darkSmallHeading,
              ),
              subtitle: Text(
                "Vehicle no. ${svm.mySlots[index].vehicle!.vehicleNo}",
                style: TextStyles.darkSmallText,
              ),
              trailing: IconButton(
                  onPressed: () => svm.cancelBooking(svm.mySlots[index]),
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.redColor,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
