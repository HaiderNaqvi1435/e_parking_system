import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:e_parking_system/res/widgets/my_app_bar.dart';
import 'package:e_parking_system/utils/const_size/const_size.dart';
import 'package:e_parking_system/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodels/vehicle_viewmodel.dart';

class MyVehicleView extends StatefulWidget {
  const MyVehicleView({super.key});

  @override
  State<MyVehicleView> createState() => _MyVehicleState();
}

class _MyVehicleState extends State<MyVehicleView> {
  final vvm = Get.find<VehicleViewmodel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("My Vehicles"),
      body: Padding(
        padding: ConstSize.hvP1,
        child: Obx(
          () => vvm.vehicles.isEmpty
              ? const Center(
                  child: Text("No vehicles added"),
                )
              : ListView.builder(
                  itemCount: vvm.vehicles.length,
                  itemBuilder: (context, index) => ListTile(
                    shape: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: .5, color: Colors.grey.shade400)),
                    title: Text(
                      vvm.vehicles[index].vehicleNo ?? "",
                      style: TextStyles.darkSmallHeading,
                    ),
                    subtitle: Text(
                      vvm.vehicles[index].vehicleModel ?? "",
                      style: TextStyles.darkSmallText,
                    ),
                    trailing: IconButton(
                        onPressed: () => vvm.deleteVehicle(vvm.vehicles[index]),
                        icon: const Icon(
                          Icons.delete,
                          color: AppColors.redColor,
                        )),
                  ),
                ),
        ),
      ),
    );
  }
}
