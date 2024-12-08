class UserModel {
  String? uid;
  String? name;
  String? email;
  String? phoneNumber;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
    );
  }
}
