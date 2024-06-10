import 'package:e_parking_system/res/components/custom_text_field.dart';
import 'package:e_parking_system/res/components/large_button.dart';
import 'package:e_parking_system/res/widgets/my_app_bar.dart';
import 'package:e_parking_system/utils/const_size/const_size.dart';
import 'package:e_parking_system/utils/text_styles/text_styles.dart';
import 'package:e_parking_system/viewmodels/vehicle_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddVehicleView extends StatefulWidget {
  const AddVehicleView({super.key});

  @override
  State<AddVehicleView> createState() => _AddVehicleViewState();
}

class _AddVehicleViewState extends State<AddVehicleView> {
  final vvm=  Get.find<VehicleViewmodel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Add Vehicle"),
      body: Padding(
        padding: ConstSize.hVP2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add new vehicle",
              style: TextStyles.darkLargeHeading,
            ),
            const SizedBox(height: ConstSize.size2),
             CustomTextField(
              controller: vvm.noController.value,
              hint: "Vehicle no (e.g LEA-123)"),
            const SizedBox(height: ConstSize.size1),
             CustomTextField(
              controller: vvm.modelController.value,
              
              hint: "Vehicle Model (e.g 2024)"),
            const SizedBox(height: ConstSize.size4),
            Obx(
              ()=>
               LargeButton(
                isLoading: vvm.isLoading.value,
                title: "Add", onPressed:()=>vvm.addVehicle()))
          ],
        ),
      ),
    );
  }
}
