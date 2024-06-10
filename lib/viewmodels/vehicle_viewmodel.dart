import 'package:e_parking_system/services/firebase/firebase_vehicle_services.dart';
import 'package:e_parking_system/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/vehicle_model.dart';

class VehicleViewmodel extends GetxController {
  final RxList<VehicleModel> vehicles = <VehicleModel>[].obs;
  final noController = TextEditingController().obs;
  final modelController = TextEditingController().obs;
  final RxBool isLoading = false.obs;
  @override
  void onInit() async {
    getVehicles();
    super.onInit();
  }

  getVehicles() async {
    vehicles.value = await FirebaseVehicleService.getVehicles();
  }

  addVehicle() async {
    try {
      if (noController.value.text.isEmpty ||
          modelController.value.text.isEmpty) {
        Utils.showSnackBar("Please fill all fields");
        return;
      }
      isLoading(true);
      VehicleModel vehicle = VehicleModel(
          vehicleNo: noController.value.text.toUpperCase(),
          vehicleModel: modelController.value.text);
      await FirebaseVehicleService.addVehicle(vehicle);
      noController.value.clear();
      modelController.value.clear();
      Utils.showSnackBar("Vehicle added successfully");
      getVehicles();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }

  deleteVehicle(VehicleModel vehicle) async {
    try {
      await FirebaseVehicleService.deleteVehicle(vehicle.vehicleId!);
      getVehicles();
      Utils.showSnackBar("Vehicle deleted successfully");
    } catch (e) {}
  }
}
