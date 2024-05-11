class SignInModel {
  final String password;

  final String email;
  // final String mobileNumber;

  SignInModel({
    required this.password,
    // required this.mobileNumber,
    required this.email,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      password: json["password"], email: json['email'],
      // mobileNumber: json["mobileNumber"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
