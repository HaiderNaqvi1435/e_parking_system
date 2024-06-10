class VehicleModel {
  String? vehicleId;
  String? userId;
  String? vehicleNo;
  String? vehicleModel;
  String? vehicleType;

  VehicleModel({
    this.vehicleId,
    this.userId,
    this.vehicleNo,
    this.vehicleModel,
    this.vehicleType,
  });

  VehicleModel.fromJson(Map<String, dynamic> json) {
    vehicleId = json['vehicleId'];
    userId = json['userId'];
    vehicleNo = json['vehicleNo'];
    vehicleModel = json['vehicleModel'];
    vehicleType = json['vehicleType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vehicleId'] = vehicleId;
    data['userId'] = userId;
    data['vehicleNo'] = vehicleNo;
    data['vehicleModel'] = vehicleModel;
    data['vehicleType'] = vehicleType;
    return data;
  }
}