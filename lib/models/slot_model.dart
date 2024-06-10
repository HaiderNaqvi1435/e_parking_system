import 'dart:async';

import 'package:e_parking_system/models/vehicle_model.dart';

class SlotModel {
    Timer? cancellationTimer;
  String? slotId;

  String? slotNo;
  bool? isBooked;
  double? timeInHours;
  bool? isCarSlot;
  String? block;
  double? totalPrice;
  String? userId;
  VehicleModel? vehicle;
  SlotModel({
    this.cancellationTimer,
    this.slotId,
    this.slotNo,
    this.userId,
    this.totalPrice,
    this.isBooked,
    this.timeInHours,
    this.isCarSlot,
    this.block,
    this.vehicle,
  });

  SlotModel.fromJson(Map<String, dynamic> json) {
    slotId = json['slotId'];
    slotNo = json['slotNo'];
    userId = json['userId'];
    totalPrice = json['totalPrice'];
    isBooked = json['isBooked'];
    timeInHours = json['timeInHours'];
    isCarSlot = json['isCarSlot'];
    block = json['block'];
    vehicle =
        json['address'] != null ? VehicleModel.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slotId'] = slotId;
    data['userId'] = userId;
    data['slotNo'] = slotNo;
    data['totalPrice'] = totalPrice;
    data['isBooked'] = isBooked;
    data['timeInHours'] = timeInHours;
    data['isCarSlot'] = isCarSlot;
    data['block'] = block;
    if (vehicle != null) {
      data['address'] = vehicle!.toJson();
    }
    return data;
  }
}
