import 'dart:math';

import '../models/slot_model.dart';

class SlotsManager {
  
  static List<SlotModel> generateRandomSlots(int count) {
    List<SlotModel> slots = [];
    int baseCharCode = 'A'.codeUnitAt(0); // Base char code for 'A'

    for (int i = 0; i < count; i++) {
      // Calculate the character based on the current index
      int charCode = baseCharCode + (i ~/ 100);
      String char = String.fromCharCode(charCode);

      // Generate the slot No with the current count
      String slotNo = '$char${i + 1}';

      // Randomly determine if the slot is booked and if it's a car slot
      bool isBooked = Random().nextBool();
      double timeInHours = Random().nextDouble() * 24;
      bool isCarSlot = Random().nextBool();

      // Randomly assign block to either "Block 1" or "Block 2"
      String block = Random().nextBool() ? 'Block 1' : 'Block 2';

      slots.add(SlotModel(
        slotNo: slotNo,
        isBooked: isBooked,
        timeInHours: timeInHours,
        isCarSlot: isCarSlot,
        block: block,
      ));
    }

    return slots;
  }
}
