import 'package:bankee/data/provider/appwrite_provider.dart';
import 'package:get/get.dart';
import 'package:appwrite/models.dart' as models;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/signin_model.dart';
import '../../models/signup_model.dart';
import '../../models/user_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';

class AuthRepository extends GetxService {
  final AppWriteProvider appWriteProvider;

  final SharedPreferences sharedPreferences;

  AuthRepository(
      {required this.appWriteProvider, required this.sharedPreferences});

  Future<models.Token> phoneAuth(String phone) =>
      appWriteProvider.phoneAuth(phone);
  Future<models.Document> createUserDoc(
          UserModel userModel, String documentId) =>
      appWriteProvider.createUserDoc(userModel, documentId);

  Future<models.Session> verifyPhoneAuth(String userId, String secret) =>
      appWriteProvider.verifyPhoneAuth(userId, secret);

  Future<models.User> signUp(SignUpModel signUpModel) =>
      appWriteProvider.signUp(signUpModel);
  Future<models.Session> signIn(SignInModel signInModel) =>
      appWriteProvider.signIn(signInModel);
  Future<void> saveUser(String userId) async {
    try {
      await sharedPreferences.setString(
        AppConstants.userId,
        userId,
      );
    } catch (e) {
      print(e);
    }
  }



  Future<void> getUserId() async {
    try {
      sharedPreferences.getString(AppConstants.userId);
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkUserStatus() async {
    String? userId = sharedPreferences.getString(
      AppConstants.userId,
    );
    String? hasCode = sharedPreferences.getString(
      AppConstants.hasCode,
    );

    if (userId != null) {
      if (hasCode != null) {
        Get.offNamed(
          RouteHelpers.getConfirmPassCode(),
        );
      } else {
        Get.offNamed(
          RouteHelpers.getVerifiedPage(),
        );
      }
    } else {
      Get.offNamed(
        RouteHelpers.getSignUp(),
      );

      // If userId doesn't exist, handle the scenario accordingly
      // For example, you can navigate to the login page or show an error message
    }
  }
}
