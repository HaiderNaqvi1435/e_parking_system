import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../../models/vehicle_model.dart';

class FirebaseVehicleService {
  static Future<void> addVehicle(VehicleModel vehicle) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('vehicles').doc();

      vehicle.vehicleId = docRef.id;
      vehicle.userId = FirebaseAuth.instance.currentUser!.uid;

      await docRef.set(vehicle.toJson());

      if (kDebugMode) {
        print('Vehicle added successfully');
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error adding vehicle: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<List<VehicleModel>> getVehicles() async {
  List<VehicleModel> vehiclesList = [];
  final userId = FirebaseAuth.instance.currentUser!.uid;
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('vehicles')
        .where('userId', isEqualTo: userId)
        .get();

    vehiclesList = querySnapshot.docs
        .map((doc) => VehicleModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    print('Vehicles fetched successfully');
  } on FirebaseException catch (e) {
    if (kDebugMode) {
      print('Error fetching vehicles: ${e.code}');
      print(e.message);
    }
  }
  return vehiclesList;
}

  static Future<void> deleteVehicle(String vehicleId) async {
    try {
      await FirebaseFirestore.instance
          .collection('vehicles')
          .doc(vehicleId)
          .delete();
      print('Vehicle deleted successfully');
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error deleting vehicle: ${e.code}');
        print(e.message);
      }
    }
  }

  static Future<void> updateVehicle(VehicleModel vehicle) async {
    try {
      await FirebaseFirestore.instance
          .collection('vehicles')
          .doc(vehicle.vehicleId)
          .update(vehicle.toJson());
      print('Vehicle updated successfully');
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error updating vehicle: ${e.code}');
        print(e.message);
      }
    }
  }
}
