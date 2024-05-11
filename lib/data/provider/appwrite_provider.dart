import 'package:appwrite/appwrite.dart';
import 'package:bankee/models/signin_model.dart';
import 'package:bankee/models/signup_model.dart';
import 'package:get/state_manager.dart';

import '../../models/user_model.dart';
import '../../utils/app_constants.dart';
import 'package:appwrite/models.dart' as models;

class AppWriteProvider extends GetxService {
  Client client = Client();

  Account? account;

  Databases? databases;

  Storage? storage;

  AppWriteProvider() {
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId)
        .setSelfSigned(status: true);

    account = Account(client);
    databases = Databases(client);
    storage = Storage(client);
  }
  // save UserDoc

  // userDoc
  Future<models.Document> createUserDoc(
      UserModel userModel, String documentId) {
    final response = databases!.createDocument(
      databaseId: AppConstants.dbId,
      collectionId: AppConstants.userCollectionId,
      documentId: documentId,
      data: userModel.toMap(),
    );

    return response;
  }

  // get user List
  Future<models.DocumentList> getUserList() async {
    //! getting a list of documents in the database
    final response = databases!.listDocuments(
      databaseId: AppConstants.dbId,
      collectionId: AppConstants.userCollectionId,
    );
    return response;
  }
  // get user doc

  Future<models.Document> getUserDoc(String documentId) {
    final response = databases!.getDocument(
      databaseId: AppConstants.dbId,
      collectionId: AppConstants.userCollectionId,
      documentId: documentId,
    );

    return response;
  }

  // update user doc

  Future<models.Document> updateUserDoc(String documentId, UserModel userModel) {
    final response = databases!.updateDocument(
      databaseId: AppConstants.dbId,
      collectionId: AppConstants.userCollectionId,
      documentId: documentId,
      data: userModel.toMap(),
    );


    return response;
  }

  // update details
  Future<models.Document> updateUserDetails(String documentId, String profilePicture, String name, String email,) {
    final response = databases!.updateDocument(
      databaseId: AppConstants.dbId,
      collectionId: AppConstants.userCollectionId,
      documentId: documentId,
      data: {
        "profilePicture": profilePicture,
        "name": name,
        "email": email,
      },
    );

    return response;
  }
  // update user passcode

  Future<models.Document> updateUserPasscode(String documentId, String passCode) {
    final response = databases!.updateDocument(
      databaseId: AppConstants.dbId,
      collectionId: AppConstants.userCollectionId,
      documentId: documentId,
      data: {
        "pin" : passCode
      },
    );

    return response;
  }
  // update user fingerPrint value

  Future<models.Document> updateUserFingerPrint(String documentId, bool hasFingerPrint) {
    final response = databases!.updateDocument(
      databaseId: AppConstants.dbId,
      collectionId: AppConstants.userCollectionId,
      documentId: documentId,
      data: {
        "hasFingerPrint" : hasFingerPrint
      },
    );

    return response;
  }



  // email and password Auth
  Future<models.User> signUp(SignUpModel signUpModel) {
    final response = account!.create(
      userId: signUpModel.userId,
      email: signUpModel.email,
      password: signUpModel.password,
    );
    return response;
  }
  
  
  // email and password Auth
  // Future<models.User> updatePassword(String password) {
  //   final response = account!.updatePassword(password: password,);
  //   return response;
  // }

  // email Auth
  Future<models.Session> signIn(SignInModel signInModel) {
    final response = account!.createEmailSession(
      email: signInModel.email,
      password: signInModel.password,
    );
    return response;
  }

  // phone auth
  Future<models.Token> phoneAuth(String phone) {
    // print("+${phone}",);
    final response =
        account!.createPhoneSession(userId: ID.unique(), phone: phone);
    return response;
  }

  // verify OTP
  Future<models.Session> verifyPhoneAuth(String userId, String secret) {
    // print("+${phone}",);
    final response =
        account!.updatePhoneSession(userId: userId, secret: secret);
    return response;
  }
}
