import 'dart:async';

import 'package:e_parking_system/models/slot_model.dart';
import 'package:e_parking_system/models/vehicle_model.dart';
import 'package:e_parking_system/res/routes/route_name.dart';
import 'package:e_parking_system/services/firebase/firebase_slot_service.dart';
import 'package:e_parking_system/utils/utils.dart';
import 'package:e_parking_system/viewmodels/slot_viewmodel.dart';
import 'package:e_parking_system/viewmodels/vehicle_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../services/notification_services.dart';

class CheckoutViewModel extends GetxController {
  final svm = Get.find<SlotViewmodel>();
  final vvm = Get.find<VehicleViewmodel>();
  final noti = NotificationService();

  final RxBool isLoading = false.obs;
  var hours = 1.obs;
  var totalAmount = 50.obs; // Initial amount for 1 hour

  var selectedVehicle = VehicleModel().obs;

  void incrementHours() {
    hours.value++;
    calculateTotalAmount();
  }

  void decrementHours() {
    if (hours.value > 1) {
      hours.value--;
      calculateTotalAmount();
    }
  }

  void calculateTotalAmount() {
    totalAmount.value = hours.value * 50; // 50 rupees per hour
  }

  String getVehicleDetails() {
    if (selectedVehicle.value.vehicleId == null ||
        selectedVehicle.value.vehicleId == '') {
      return 'No vehicle selected';
    }
    return selectedVehicle.value.vehicleId ?? "";
  }

  void checkout(SlotModel slot) async {
    try {
      if (selectedVehicle.value.vehicleId == null ||
          selectedVehicle.value.vehicleId == '') {
        Utils.showSnackBar('Please select a vehicle');
        return;
      }
      isLoading(true);
      slot.timeInHours = hours.value.toDouble();
      slot.userId = FirebaseAuth.instance.currentUser!.uid;
      slot.totalPrice = totalAmount.value.toDouble();
      slot.vehicle = selectedVehicle.value;
      slot.isBooked = true;
      await FirebaseSlotService.updateslot(slot);
      noti.showNotification(
        body:
            "Slot booked for ${hours.value} hours with ${selectedVehicle.value.vehicleNo}.",
        title: "Success",
      );
      Utils.showSnackBar(
          'Slot booked for ${hours.value} hours with ${selectedVehicle.value.vehicleNo}.');
      isLoading(false);

      // Start the cancellation timer
      slot.cancellationTimer = Timer(Duration(hours: hours.value), () {
        svm.cancelBooking(slot);
      });

      svm.getslots();
      svm.isCarView.value = slot.isCarSlot!;
      print(slot.slotId);
      svm.filterList();
      Get.toNamed(RouteName.reciptView);
    } catch (e) {
      isLoading(false);
    }
  }
}
