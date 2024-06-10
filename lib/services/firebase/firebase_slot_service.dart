import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../models/slot_model.dart';

class FirebaseSlotService {


  // Add a new slot
 static Future<void> addslot(SlotModel slot) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('slots').doc();

      slot.slotId = docRef.id;

      await docRef.set(slot.toJson());

      if (kDebugMode) {
        print('slot added successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error adding slot: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<List<SlotModel>> getslots() async {
    List<SlotModel> slotsList = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('slots').get();

      slotsList = querySnapshot.docs
          .map(
              (doc) => SlotModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      print('slots fetched successfully');
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error fetching slot: ${e.code}');
        print(e.message);
      }
    }
    return slotsList;
  }

  static Future<void> deleteslot(String slotId) async {
    try {
      await FirebaseFirestore.instance
          .collection('slots')
          .doc(slotId)
          .delete();
      print('slot deleted successfully');
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error deleting slot: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<void> updateslot(SlotModel slot) async {
    try {
      await FirebaseFirestore.instance
          .collection('slots')
          .doc(slot.slotId)
          .update(slot.toJson());
      print('slot updated successfully');
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error updating slot: ${e.code}');
        print(e.message);
      }
    }
  }
}
