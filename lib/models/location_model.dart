class LocationModel {
  String? title;
  String? address;
  String? price;

  LocationModel({
    this.title,
    this.address,
    this.price,
  });

  LocationModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    address = json['address'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['address'] = address;
    data['price'] = price;
    return data;
  }
}