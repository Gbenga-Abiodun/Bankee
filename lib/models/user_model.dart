class UserModel {
  final String name;

  final String pin;
  final int balance;
  final String profilePicture;
  final String? phoneNumber;

  final bool hasDetails;

  final bool hasFingerPrint;
  final String email;

  UserModel(
      {required this.name,
      required this.hasDetails,
      required this.hasFingerPrint,
      required this.pin,
      this.phoneNumber,
      required this.balance,
      // required this.phoneNumber,
      required this.profilePicture,
      required this.email});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"],
      phoneNumber: map["phoneNumber"],
      // phoneNumber: map["phoneNumber"],
      profilePicture: map["profilePicture"],
      email: map["email"], pin: map["pin"], balance: map["balance"],
      hasDetails: map["hasDetails"], hasFingerPrint: map["hasFingerPrint"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "hasFingerPrint": hasFingerPrint,
      "pin": pin,
      "phoneNumber": phoneNumber,
      "balance": balance,
      "hasDetails": hasDetails,
      // "phoneNumber": phoneNumber,
      "profilePicture": profilePicture,
      "name": name
    };
  }
}
