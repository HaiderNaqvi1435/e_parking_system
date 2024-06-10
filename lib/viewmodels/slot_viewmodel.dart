import 'package:e_parking_system/data/slots.dart';
import 'package:e_parking_system/services/firebase/firebase_slot_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/location_model.dart';
import '../models/slot_model.dart';
import '../utils/utils.dart';

class SlotViewmodel extends GetxController {
  final RxBool isCarView = true.obs;
  final RxList<SlotModel> slots = <SlotModel>[].obs;
  final RxList<SlotModel> filteredSlots = <SlotModel>[].obs;
  final RxList<SlotModel> mySlots = <SlotModel>[].obs;

  final Rx<LocationModel> location = LocationModel().obs;
  final Rx<SlotModel> slot = SlotModel().obs;
  @override
  void onInit() async {
    getslots();
    super.onInit();
  }

  getslots() async {
    slots.value = await FirebaseSlotService.getslots();
    getMySlots();
  }

  Future<void> addSlots() async {
    print("Tapped");
    int count = 100;
    final List<SlotModel> list = SlotsManager.generateRandomSlots(count);
    print(list[0].slotNo);
    for (SlotModel slot in list) {
      await FirebaseSlotService.addslot(slot);
      print(slot);
      print("Slot Added");
    }
  }

  filterList() {
    filteredSlots.value =
        slots.where((slot) => slot.isCarSlot == isCarView.value).toList();
  }

  getMySlots() {
    mySlots.value = slots
        .where((slot) => slot.userId == FirebaseAuth.instance.currentUser!.uid)
        .toList();
  }

  void cancelBooking(SlotModel slot) async {
  try {
    // Cancel the cancellation timer
    slot.cancellationTimer?.cancel();

    slot.timeInHours = 0;
    slot.userId = '';
    slot.totalPrice = 0;
    slot.vehicle = null;
    slot.isBooked = false;

    await FirebaseSlotService.updateslot(slot);
    getslots();
    getMySlots();
    Utils.showSnackBar("Booking Cancelled.");
  } catch (e) {
    print("Error cancelling booking: $e");
  }
}
}
