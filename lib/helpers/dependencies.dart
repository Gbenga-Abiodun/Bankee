import 'package:bankee/controllers/auth_controller.dart';
import 'package:bankee/controllers/local_auth_controller.dart';
import 'package:bankee/controllers/user_controller.dart';
import 'package:bankee/controllers/utils_controller.dart';
import 'package:bankee/controllers/validation_controller.dart';
import 'package:bankee/data/repository/user_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:get/get.dart';

import '../data/provider/appwrite_provider.dart';
import '../data/repository/auth_repository.dart';

Future<void> init() async{
  final sharedPreferences = await SharedPreferences.getInstance();


  Get.lazyPut(() => sharedPreferences, fenix: true,);

  // provider
  Get.lazyPut(() => AppWriteProvider(),);



  // Repo


  Get.lazyPut(() => AuthRepository(appWriteProvider: Get.find(), sharedPreferences: Get.find()),);
  Get.lazyPut(() => UserRepo(sharedPreferences: Get.find(), appWriteProvider: Get.find()));

  // controllers

  Get.lazyPut(() => AuthController(authRepository: Get.find()));

  Get.lazyPut(() => UserController(userRepo: Get.find(), sharedPreferences: Get.find()));


  // other controllers
  Get.lazyPut(() => UtilsController(),fenix: true, );
  Get.lazyPut(() => LocalAuthController(), fenix: true,);
  Get.lazyPut(() => ValidationController(), fenix: true,);
}