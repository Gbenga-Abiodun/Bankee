import 'package:bankee/controllers/user_controller.dart';
import 'package:bankee/controllers/utils_controller.dart';
import 'package:bankee/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getAllBiometrics();
  }

  // var usesLocalAuth = false.obs;

  var utilsController = Get.find<UtilsController>();
  var userController = Get.find<UserController>();
  var _localAuth = LocalAuthentication();
  var hasFingerPrintLock = false.obs;

  var hasLocalAuthentication = true.obs;
  var isUserAuthenticated = true.obs;

  void _getAllBiometrics() async {
    // check whether there is local authentication available on this device or not
    bool hasLocalAuthentication = await _localAuth.canCheckBiometrics;
    if (hasLocalAuthentication) {
      List<BiometricType> availableBiometric =
          await _localAuth.getAvailableBiometrics();
      hasFingerPrintLock.value = availableBiometric.contains(
        BiometricType.fingerprint,
      );
    } else {
      utilsController.showToast("Biometric is not available for this device");
    }
  }

  void authenticateBiometric() async {
    try {
      Get.context!.loaderOverlay.show();
      print(userController.userModel!.hasFingerPrint.toString(),);
     if(userController.userModel!.hasFingerPrint != false){
       Get.context!.loaderOverlay.hide();

       isUserAuthenticated.value = await _localAuth.authenticate(
         localizedReason: "login with your biometric",
         options: AuthenticationOptions(biometricOnly: true, stickyAuth: true,),
       );
       if (isUserAuthenticated.value) {
         // Get.context!.loaderOverlay.hide();
         Get.offAllNamed(
           RouteHelpers.getSummaryPage(),
         );
         utilsController.showToast("Biometric login successful",);
       } else {
         // Get.context!.loaderOverlay.hide();
         utilsController.showToast("Biometric Error");
       }

     }else{
       Get.context!.loaderOverlay.hide();
       utilsController.showToast("biometric is not enabled ");

     }
      

    } catch (e) {
      Get.context!.loaderOverlay.hide();
      utilsController.showToast(e.toString(),);
    }
  }
}
