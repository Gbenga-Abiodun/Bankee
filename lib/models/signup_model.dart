class SignUpModel {
  final String name;
  final String password;

  final String email;
  // final String mobileNumber;
  final String userId;

  SignUpModel(
      {required this.name,
        required this.password,
        // required this.mobileNumber,
        required this.email,
        required this.userId});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json["name"],
      password: json["password"],
      // mobileNumber: json["mobileNumber"],
      userId: json["userId"], email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      // "mobileNumber" : mobileNumber,
      "userId": userId
    };
  }
}
