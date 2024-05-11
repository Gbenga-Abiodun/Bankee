import 'package:appwrite/appwrite.dart';
import 'package:bankee/controllers/utils_controller.dart';
import 'package:bankee/data/repository/user_repository.dart';
import 'package:bankee/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../routes/route_helper.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  final SharedPreferences sharedPreferences;

  UserController({required this.userRepo, required this.sharedPreferences});

  var utilsController = Get.find<UtilsController>();

  var userExists = false.obs;

  //
  // late List<UserModel> userModelList = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // _loadData();
  }

  Future<void> _loadData() async {
    // await getUserList();
    await getUserData();
  }

  getUserData() async {
    try {
      await userRepo
          .getUserDoc(
              sharedPreferences.getString(AppConstants.userId).toString())
          .then((value) {
        _userModel = UserModel.fromMap(value.data);
        print(
          _userModel!.name.toString(),
        );

        update();
      }).catchError((e) {
        if (e is AppwriteException) {
          print(e.response["message"].toString());
        } else {
          print(e);
        }
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  // getUserList() async {
  //   try {
  //     await userRepo.getUserList().then((value) {
  //       // print(value.documents[0].data,);
  //
  //       for (var doc in value.documents) {
  //         if (doc.data["\$id"] == sharedPreferences.getString(AppConstants.userId).toString()) {
  //           userExists.value = true;
  //           print(doc.data['\$id']);
  //           break;
  //         }
  //       }
  //
  //     }).catchError((e) {
  //       if (e is AppwriteException) {
  //         print(e.response["message"].toString());
  //       } else {
  //         print(e);
  //       }
  //     });
  //   } on Exception catch (e) {
  //     print(e.toString());
  //   }
  // }

  void savePin({required String pin}) async {
    try {
      Get.context!.loaderOverlay.show();
      await userRepo
          .updateUserPasscode(
              sharedPreferences.getString(AppConstants.userId).toString(),
              pin)
          .then((value) {
        userRepo.hasCode(
          value.$id,
        );
        // Get.of
        Get.context!.loaderOverlay.hide();
        utilsController.showToast("passcode Saved Successfully");
        Get.offAllNamed(RouteHelpers.getSummaryPage(),);
      }).catchError((e) {
        Get.context!.loaderOverlay.hide();
        if (e is AppwriteException) {
          // utilsController.showToast(e.response["message"].toString());
        } else {
          print(e);
        }
      });
    } catch (e) {
      Get.context!.loaderOverlay.hide();
      print(
        e.toString(),
      );
    }
  }

  void updateFingerPrint() async {
    Get.context!.loaderOverlay.show();
    try {
      await userRepo
          .updateUserFingerPrint(
              sharedPreferences.getString(AppConstants.userId).toString(),
              true,)
          .then((value) {
        Get.context!.loaderOverlay.hide();
        // userRepo.hasCode(
        //   value.$id,
        // );
        // Get.of
        utilsController.showToast( "Touch ID enabled");
        Get.offNamed(RouteHelpers.getPassCode());
      }).catchError((e) {
        Get.context!.loaderOverlay.hide();
        if (e is AppwriteException) {
          print(e.response["message"].toString());
        } else {
          print(e);
        }
      });
    } catch (e) {
      Get.context!.loaderOverlay.hide();
      print(
        e.toString(),
      );
    }

  }

  void hasCode(passCode) async{
    await userRepo.hasCode(
      passCode,
    );
  }

  void saveDetails({
    required bool hasDetails,
    required String name,
    required String email,
  }) async {
    try {
      Get.context!.loaderOverlay.show();
      await userRepo
          .updateUserDetails(
              sharedPreferences.getString(AppConstants.userId).toString(),
              "", name, email,)
          .then((value) async {

        Get.context!.loaderOverlay.hide();

        // Get.of
        utilsController.showToast("Details Saved");
        Get.offNamed(
          RouteHelpers.getTouchId(),
        );

        // await userRepo.updatePassword(password).then((value) {
        //
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
        if (e is AppwriteException) {
          print(e.response["message"].toString());
        } else {
          print(e);
        }
      });
    } catch (e) {
      Get.context!.loaderOverlay.hide();
      print(
        e.toString(),
      );
    }
  }
}
