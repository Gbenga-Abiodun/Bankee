import 'package:appwrite/appwrite.dart';
import 'package:bankee/controllers/user_controller.dart';
import 'package:bankee/controllers/utils_controller.dart';
import 'package:bankee/data/repository/auth_repository.dart';
import 'package:bankee/models/signin_model.dart';
import 'package:bankee/models/signup_model.dart';
import 'package:bankee/models/user_model.dart';
import 'package:bankee/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  var utilsController = Get.find<UtilsController>();

  var userController = Get.find<UserController>();

  String userId = "";
  var phoneNumber = "";

  void checkPin(String secret) async {
    try {
      Get.context!.loaderOverlay.show();
      await authRepository.verifyPhoneAuth(userId, secret).then((value) async {
        await authRepository
            .createUserDoc(
                UserModel(
                    name: "",
                    pin: "",
                    balance: 000,
                    profilePicture: "",
                    email: "null@email.com",
                    hasDetails: false,

                    phoneNumber: phoneNumber, hasFingerPrint: false,),
                userId)
            .then((value) async {
          Get.context!.loaderOverlay.hide();
          await authRepository.saveUser(userId);
          await userController.getUserData();
          Get.offAllNamed(RouteHelpers.getVerifiedPage());
        }).catchError((e) async{
          await authRepository.saveUser(userId);
           userController.hasCode(value.$id);
          Get.context!.loaderOverlay.hide();
          _handleDocument(e,);
        });
      }).catchError((e) {
        Get.context!.loaderOverlay.hide();
        _handleError(e);
      });
    } catch (e) {
      Get.context!.loaderOverlay.hide();
      print(e);
      utilsController.showToast(e.toString());
    }
  }


  checkUser() {
    authRepository.checkUserStatus();
  }

  void signUp({
    required String name,
    required String password,
    required String email,
  }) async {
    try {
      Get.context!.loaderOverlay.show();
      authRepository
          .signUp(
        SignUpModel(
          name: name,
          password: password,
          email: email,
          userId: ID.unique(),
        ),
      )
          .then((signUp) async {

        // await userController.getUserData();

        await authRepository
            .createUserDoc(
                UserModel(
                    name: name,
                    pin: "",
                    balance: 0000,
                    profilePicture: "",
                    email: email,
                    phoneNumber: "",
                    hasDetails: true, hasFingerPrint: false,),
                signUp.$id)
            .then((value) async {
          Get.context!.loaderOverlay.hide();
          await authRepository.saveUser(signUp.$id);

          await userController.getUserData();
          utilsController.showToast("Account Created Successfully ");
          Get.offAllNamed(
            RouteHelpers.getVerifiedPage(),
          );
        }).catchError((e) {
          Get.context!.loaderOverlay.hide();

          _handleError(e);
        });
      }).catchError((e) {
        Get.context!.loaderOverlay.hide();
        _handleError(e);
      });
    } catch (e) {
      Get.context!.loaderOverlay.hide();
      print(e);
      utilsController.showToast(e.toString());
    }
  }

  void signIn({required String password, required String email}) {
    try {
      Get.context!.loaderOverlay.show();
      authRepository
          .signIn(SignInModel(password: password, email: email))
          .then((signIn) async {
            userController.hasCode(signIn.$id,);
        await authRepository.saveUser(signIn.userId);
        await userController.getUserData();
        Get.context!.loaderOverlay.hide();
        utilsController.showToast("Login Successful");
        Get.offAllNamed(
          RouteHelpers.getSummaryPage(),
        );
        // await authRepository.createUserDoc(UserModel(name: name, pin: 0000, balance: 0000, profilePicture: "", email: email), signUp.$id).then((value) {
        //
        //
        // }).catchError((e) {
        //   if (e is AppwriteException) {
        //     print(e.response["message"].toString());
        //   } else {
        //     print(e);
        //   }
        // });
      }).catchError((e) {
        Get.context!.loaderOverlay.hide();
        _handleError(e);
      });
    } catch (e) {
      print(e);
      Get.context!.loaderOverlay.hide();
      utilsController.showToast(e.toString());
    }
  }

  void phoneAuth(String phone) async {
    try {
      Get.context!.loaderOverlay.show();
      await authRepository.phoneAuth(phone).then((number) async {
        Get.context!.loaderOverlay.hide();
        // print(number.);

        utilsController.showToast("OTP sent to ${phone}");
        phoneNumber = phone;

        print(phone);
        userId = number.userId;
        print(userId);
        print(number.secret);
        Get.toNamed(
          RouteHelpers.getOtpPage(),
        );
      }).catchError((e) {
        Get.context!.loaderOverlay.hide();
        _handleError(e);
      });
    } catch (e) {
      Get.context!.loaderOverlay.hide();
      utilsController.showToast(e.toString());
    }
  }
  void resendCode(String phone) async {
    try {
      Get.context!.loaderOverlay.show();
      await authRepository.phoneAuth(phone).then((number) async {
        Get.context!.loaderOverlay.hide();
        // print(number.);

        utilsController.showToast("OTP resent to ${phone}");
        phoneNumber = phone;

        print(phone);
        userId = number.userId;
        print(userId);
        print(number.secret);
        // Get.toNamed(
        //   RouteHelpers.getOtpPage(),
        // );
      }).catchError((e) {
        Get.context!.loaderOverlay.hide();
        _handleError(e);
      });
    } catch (e) {
      Get.context!.loaderOverlay.hide();
      utilsController.showToast(e.toString());
    }
  }

  void _handleError(Exception e) {
    String errorMessage = "An error occurred";
    if (e is AppwriteException) {
      switch (e.code) {
        case 401:
          errorMessage = "Invalid credentials";
          break;
        // case 400:
        //   errorMessage = "Incorrect password";
        //   break;
        case 409:
          errorMessage = "User already exists";
          break;
        case 404:
          errorMessage = "User not found";
          break;
        // Add more error codes and corresponding messages as needed
        default:
          errorMessage = "An error occurred";
      }
    }
    utilsController.showToast(
      errorMessage,
    );
  }


  void _handleDocument(Exception e) async{
    // String errorMessage = "An error occurred";
    if (e is AppwriteException) {
      switch (e.code) {

        case 409:
          await userController.getUserData();
          Get.offAllNamed(
            RouteHelpers.getSummaryPage(),
          );
          break;

      }
    }
    // utilsController.showToast(
    //   errorMessage,
    // );
  }
}
