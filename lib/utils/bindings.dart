import 'package:e_parking_system/viewmodels/auth_viewmodel.dart';
import 'package:e_parking_system/viewmodels/checkout_viewmodel.dart';
import 'package:e_parking_system/viewmodels/slot_viewmodel.dart';
import 'package:e_parking_system/viewmodels/vehicle_viewmodel.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthViewModel());
    Get.put(SlotViewmodel());
    Get.put(VehicleViewmodel());
    Get.put(CheckoutViewModel());
    
    // Get.put(LoginViewModel());
    // Get.put(ParkingDetailViewModel());
  }
}
