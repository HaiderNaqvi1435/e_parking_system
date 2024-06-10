import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:e_parking_system/res/routes/route_name.dart';
import 'package:e_parking_system/res/widgets/my_app_bar.dart';
import 'package:e_parking_system/utils/const_size/const_size.dart';
import 'package:e_parking_system/utils/text_styles/text_styles.dart';
import 'package:e_parking_system/viewmodels/slot_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectSlotView extends StatefulWidget {
  const SelectSlotView({super.key});

  @override
  State<SelectSlotView> createState() => _SelectSlotViewState();
}

class _SelectSlotViewState extends State<SelectSlotView> {
  final svm = Get.find<SlotViewmodel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Slot"),
      body: Padding(
        padding: ConstSize.hvP1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Choose slot", style: TextStyles.darkLargeHeading),
            const SizedBox(height: ConstSize.size1),
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: svm.filteredSlots.length,
              itemBuilder: (context, index) => Obx(
                () => Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.5), // Shadow color with opacity
                        spreadRadius: 2, // Spread radius of the shadow
                        blurRadius: 4, // Blur radius of the shadow
                        offset: const Offset(0, 3), // Position of the shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            svm.filteredSlots[index].slotNo ?? "",
                            style: TextStyles.darkSmallHeading,
                          ),
                          Divider(
                            height: 20,
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                          Expanded(
                              child: svm.filteredSlots[index].isBooked == true
                                  ? Image.asset(svm.isCarView.value == true
                                      ? 'assets/icons/sedan.png'
                                      : 'assets/icons/motorbike.png')
                                  : SmallButton(
                                      onTap: () {
                                        // svm.filteredSlots[index].isBooked =
                                        //   true;
                                        // svm.filteredSlots.refresh();

                                        svm.slot.value =
                                            svm.filteredSlots[index];
                                        Get.toNamed(RouteName.checkoutView);
                                      },
                                      title: "Book"))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  const SmallButton({
    super.key,
    this.onTap,
    required this.title,
    this.color,
  });
  final VoidCallback? onTap;
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
            color: color ?? AppColors.darkColor,
            borderRadius: BorderRadius.circular(2)),
        child: Center(
            child: Text(
          title,
          style: TextStyles.whiteSmallHeading,
        )),
      ),
    );
  }
}
