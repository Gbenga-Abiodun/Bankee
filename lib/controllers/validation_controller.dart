import 'package:bankee/controllers/auth_controller.dart';
import 'package:bankee/controllers/user_controller.dart';
import 'package:bankee/controllers/utils_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../routes/route_helper.dart';

class ValidationController extends GetxController {
  var isChecked = false.obs;

  var inputText = "".obs;

  var phoneNumber = "";

  var confirmPasscode = "".obs;

  // var phoneAuth = "";

  var isPasswordHidden = true.obs;

  var isPinVisible = true.obs;



  var utilsController = Get.find<UtilsController>();

  var authController = Get.find<AuthController>();

  var userController = Get.find<UserController>();

  final GlobalKey<FormState> signInFormStateKey = GlobalKey<FormState>();
  final GlobalKey<FormState> detailsFormStateKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpFormStateKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgottenFormStateKey = GlobalKey<FormState>();
  final GlobalKey<FormState> mobileFormStateKey = GlobalKey<FormState>();

  final GlobalKey<FormState> pinStateKey = GlobalKey<FormState>();

  late TextEditingController emailController,
      passwordController,
      nameController,
      signInEmailController,
      signInPasswordController,
      forgottenPasswordController,
      pinController,
      passCodeController,
      detailsNameController,
  detailsPasswordController,
  detailsEmailContoller,
      mobileController;

  var email = "".trim();



  var password = "".trim();
  var detailsPassword = "".trim();
  var detailsName = "".trim();
  var detailsEmail = "".trim();




  var signInEmail = "".trim();
  var signInPassword = "".trim();
  var name = "".trim();

  var phone = "".trim();

  var mobile = "".trim();

  var forgottenPassword = "".trim();
  var pinNumber = "".trim();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _initializeFormControllers();
    // phoneAuth = "91";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _disposeFormControllers();
  }

  void _initializeFormControllers() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    mobileController = TextEditingController();
    passCodeController = TextEditingController();
    detailsEmailContoller = TextEditingController();
    detailsNameController = TextEditingController();
    detailsPasswordController = TextEditingController();

    nameController = TextEditingController();
    signInPasswordController = TextEditingController();
    signInEmailController = TextEditingController();
    forgottenPasswordController = TextEditingController();
    pinController = TextEditingController();
  }

  void _disposeFormControllers() {
    emailController.dispose();
    passwordController.dispose();
    passCodeController.dispose();
    mobileController.dispose();
    signInEmailController.dispose();
    signInPasswordController.dispose();
    detailsEmailContoller.dispose();
    detailsPasswordController.dispose();
    detailsNameController.dispose();

    nameController.dispose();
    forgottenPasswordController.dispose();
    pinController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Name cannot be empty";
    }
    return null;
  }

  
  void clearPassCodePin(){
    if (inputText.value.isNotEmpty) {
      inputText.value = inputText.value.substring(0 ,inputText.value.length - 1);
      
    } else {
      
    }
  }

  void clearConfirmPassCodePin(){
    if (confirmPasscode.value.isNotEmpty) {
      confirmPasscode.value = confirmPasscode.value.substring(0 ,confirmPasscode.value.length - 1);

    } else {

    }
  }

  void passcodePin(int index){
    if (inputText.value.length < 4) {
      inputText.value += index.toString();
    } else {
      
    }
  }
  void confirmPasscodePin(int index){
    if (confirmPasscode.value.length < 4) {
      confirmPasscode.value += index.toString();
    } else {

    }
  }

  // String? validatePhone(String value){
  //   if(value.length<11){
  //     return "Phone must be 11 characters";
  //   }
  //   return null;
  //
  // }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Password must be 8 characters";
    }
    return null;
  }

  String? validateMobile(String value) {
    if (value.isEmpty) {
      return "Number Cannot be Empty";
    } else if (value.length < 10) {
      return "Number must be 10 characters";
    } else {
      return null;
    }
  }
  String? validatePin(String value) {
    if (value.isEmpty) {
      return "Invalid code";
    }
    return null;
  }

  void checkMobile({required String phoneCode}) async {
    final isValid = mobileFormStateKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    mobileFormStateKey.currentState!.save();
    if (phoneCode.isEmpty) {
      // phoneAuth = phoneCode;

      // utilsController.updateSelectedCountry(utilsController.selectedCountry.value);
      print("validation controller"+"+234${mobile}");
      phoneNumber = "+234${mobile}";

      authController.phoneAuth(
          "+234${mobile}");
    } else {
      // phoneAuth = phoneCode;

      // utilsController.updateSelectedCountry(utilsController.selectedCountry.value);
      print("validation controller"+"+${phoneCode}${mobile}");

      phoneNumber = "+${phoneCode}${mobile}";

      authController.phoneAuth(
          "+${phoneCode}${mobile}");
    }
    // Get.toNamed(RouteHelpers.getOtpPage(),);

    /* await Get.find<AuthController>().signIn(email: loginEmail, password: loginPassword,);*/
  }


  void resendOtp({required String phoneCode}){
    authController.phoneAuth(
        "+${phoneCode}${mobile}");
  }


  void checkPassCode(){
    if (inputText.value.isEmpty) {
      return utilsController.showToast("passcode cannot be empty");

    } else if(inputText.value.length < 4) {
      return utilsController.showToast("passcode must be of 4 digits");

    } else{
      userController.savePin(pin: inputText.value.toString());
    }
  }

  void checkConfirmPassCode(){
    Get.context!.loaderOverlay.show();
    if (confirmPasscode.value.isEmpty) {
      Get.context!.loaderOverlay.hide();
      return utilsController.showToast("passcode cannot be empty");

    } else if(confirmPasscode.value.length < 4) {
      Get.context!.loaderOverlay.hide();
      return utilsController.showToast("passcode must be of 4 digits");

    } else if(confirmPasscode.value != userController.userModel!.pin){
      Get.context!.loaderOverlay.hide();

       utilsController.showToast("Incorrect passcode");
      // userController.savePin(pin: inputText.value.toString());
    }else{


      Get.context!.loaderOverlay.hide();
      Get.offAllNamed(
        RouteHelpers.getSummaryPage(),
      );

    }
  }

  void checkPin() async {
    final isValid = pinStateKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    pinStateKey.currentState!.save();
    // print(pinNumber);
    authController.checkPin(pinNumber);
    // Get.toNamed(RouteHelpers.getOtpPage(),);

    /* await Get.find<AuthController>().signIn(email: loginEmail, password: loginPassword,);*/
  }

  void checkSignIn() async {
    final isValid = signInFormStateKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signInFormStateKey.currentState!.save();
    authController.signIn(password: signInPassword, email: signInEmail,);
    /* await Get.find<AuthController>().signIn(email: loginEmail, password: loginPassword,);*/
  }
  void checkDetails() async {
    final isValid = detailsFormStateKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    detailsFormStateKey.currentState!.save();
    userController.saveDetails(hasDetails: true, name: detailsName, email: detailsEmail,);
    /* await Get.find<AuthController>().signIn(email: loginEmail, password: loginPassword,);*/
  }

  void checkSignUp() async {
    final isValid = signUpFormStateKey.currentState!.validate();
    if (!isValid) {
      return;
    } else if (isChecked.value == false) {
      utilsController.showToast("Please accept our terms and conditions ");
    } else {
      signUpFormStateKey.currentState!.save();
      authController.signUp(name: name, password: password, email: email);
      // Get.toNamed(
      //   RouteHelpers.getMobileAuth(),
      // );
      // await Get.find<AuthController>().joinUs(name: name, email: email, phone: phone, password: password);
    }
  }

  void checkForgottenPassword() async {
    final isValid = forgottenFormStateKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    forgottenFormStateKey.currentState!.save();
    // await Get.find<AuthController>().forgottenPassword(email: forgottenPassword);
    // Get.toNamed(RouteHelper.getAllowNotificationPage());
  }

  void toggleCheck() {
    isChecked.value = !isChecked.value;
    update();
  }
}
