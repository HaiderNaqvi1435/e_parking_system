class UserModel {
  String? uid;
  String? name;
  String? phone;
  String? email;
  String? address;

  UserModel({
     this.uid,
     this.name,
     this.phone,
     this.email,
     this.address,
  });

  // Convert a UserModel into a Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
    };
  }

  // Create a UserModel from a Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      address: map['address'],
    );
  }
}
