import 'package:e_parking_system/data/locations.dart';
import 'package:e_parking_system/res/routes/route_name.dart';
import 'package:e_parking_system/res/widgets/my_app_bar.dart';
import 'package:e_parking_system/utils/const_size/const_size.dart';
import 'package:e_parking_system/utils/text_styles/text_styles.dart';
import 'package:e_parking_system/viewmodels/slot_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/components/parking_list_tile.dart';

class SelectLocationView extends StatefulWidget {
  const SelectLocationView({super.key});

  @override
  State<SelectLocationView> createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  final svm = Get.find<SlotViewmodel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Location"),
      body: Padding(
          padding: ConstSize.hvP1,
          child: ListView(
            children: [
              const Text("Choose Location", style: TextStyles.darkLargeHeading),
              ParkingListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          const ListTile(
                            title: Text(
                              "Select block",
                              style: TextStyles.darkLargeHeading,
                            ),
                          ),
                          ListTile(
                            shape: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300)),
                            onTap: () {
                              Navigator.pop(context);
                              svm.location.value = Locations.location;
                              Get.toNamed(RouteName.selectSlotView);
                            },
                            leading: const Text(
                              "1",
                              style: TextStyles.darkSmallHeading,
                            ),
                            title: const Text(
                              "Block 1",
                              style: TextStyles.darkSmallHeading,
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pop(context);

                              Get.toNamed(RouteName.selectSlotView);
                            },
                            leading: const Text(
                              "2",
                              style: TextStyles.darkSmallHeading,
                            ),
                            title: const Text(
                              "Block 2",
                              style: TextStyles.darkSmallHeading,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                title: Locations.location.title!,
                address: Locations.location.address!,
                price: Locations.location.price!,
              ),
              const ParkingListTile(
                title: "District Courts Sahiwal",
                address: "M38W+3QX, Sahiwal, Sahiwal District, Punjab 57000",
                price: "Rs.50 / per hr.",
              ),
              const ParkingListTile(
                title: "DHQ Sahiwal",
                address:
                    "M4G3+JP9, Saeed Ullah Mokal Colony Fateh Sher Colony, Sahiwal, Sahiwal District, Punjab",
                price: "Rs.50 / per hr.",
              ),
            ],
          )),
    );
  }
}
