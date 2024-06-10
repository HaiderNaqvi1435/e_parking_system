import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:e_parking_system/res/components/large_button.dart';
import 'package:e_parking_system/res/widgets/my_app_bar.dart';
import 'package:e_parking_system/utils/const_size/const_size.dart';
import 'package:e_parking_system/utils/text_styles/text_styles.dart';
import 'package:e_parking_system/viewmodels/slot_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodels/checkout_viewmodel.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final CheckoutViewModel checkoutViewModel = Get.find<CheckoutViewModel>();
  final svm = Get.find<SlotViewmodel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Checkout"),
      body: Padding(
        padding: ConstSize.hvP1,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Card(
                    color: AppColors.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            svm.location.value.title ?? "",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            svm.location.value.address ?? "",
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(svm.slot.value.slotNo ?? ""),
                              Text(
                                svm.location.value.price ?? "",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const Text(
                          'Select Time (in hours):',
                          style: TextStyle(fontSize: 16),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(
                            Icons.remove,
                            color: AppColors.darkColor,
                          ),
                          onPressed: checkoutViewModel.decrementHours,
                        ),
                        Obx(() => Text(
                              '${checkoutViewModel.hours.value}',
                              style: const TextStyle(fontSize: 18),
                            )),
                        IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: AppColors.darkColor,
                          ),
                          onPressed: checkoutViewModel.incrementHours,
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => ListTile(
                      title: const Text('Vehicle'),
                      subtitle: Text(checkoutViewModel
                                  .selectedVehicle.value.vehicleId ==
                              ''
                          ? 'Select Vehicle'
                          : checkoutViewModel.selectedVehicle.value.vehicleNo ??
                              ""),
                      trailing: const Icon(Icons.keyboard_arrow_down),
                      onTap: () {
                        // Implement vehicle selection
                        _showVehicleSelectionDialog(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Obx(
              () => _buildFeeRow(
                  'Total', '${checkoutViewModel.totalAmount.value} rupees',
                  isTotal: true),
            ),
            Obx(
              () => LargeButton(
                isLoading: checkoutViewModel.isLoading.value,
                title: "Checkout",
                onPressed: () {
                  // Handle checkout logic here
                  checkoutViewModel.checkout(svm.slot.value);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFeeRow(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? AppColors.redColor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void _showVehicleSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Select Vehicle',
            style: TextStyles.darkLargeHeading,
          ),
          content: Obx(
            () => ListView(
              shrinkWrap: true,
              children: checkoutViewModel.vvm.vehicles.map((vehicle) {
                return ListTile(
                  title: Text(vehicle.vehicleNo!),
                  onTap: () {
                    checkoutViewModel.selectedVehicle.value = vehicle;
                    Get.back();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
