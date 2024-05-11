import 'package:appwrite/models.dart' as models;
import 'package:bankee/data/provider/appwrite_provider.dart';
import 'package:bankee/models/user_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_constants.dart';

class UserRepo extends GetxService{
  final SharedPreferences sharedPreferences;

  final AppWriteProvider appWriteProvider;

  UserRepo({required this.sharedPreferences, required this.appWriteProvider});

  Future<models.Document> updateUserDoc(String documentId, UserModel userModel) => appWriteProvider.updateUserDoc(documentId,userModel);

  Future<models.Document> getUserDoc(String documentId) => appWriteProvider.getUserDoc(documentId);
  Future<models.Document> updateUserPasscode(String documentId, String passCode) => appWriteProvider.updateUserPasscode(documentId, passCode);
  Future<models.Document> updateUserFingerPrint(String documentId, bool hasFingerPrint) => appWriteProvider.updateUserFingerPrint(documentId, hasFingerPrint);

  Future<models.Document> updateUserDetails(String documentId, String profilePicture, String name, String email,) => appWriteProvider.updateUserDetails(documentId, profilePicture, name, email);

  Future<models.DocumentList> getUserList() => appWriteProvider.getUserList();


  Future<void> hasCode(String passCode) async {
    try {
      await sharedPreferences.setString(
        AppConstants.hasCode,
        passCode,
      );
    } catch (e) {
      print(e);
    }
  }


  // Future<models.User> updatePassword(String password) => appWriteProvider.updatePassword(password);
}