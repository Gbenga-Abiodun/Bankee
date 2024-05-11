import 'dart:ui';

import 'package:bankee/controllers/user_controller.dart';
import 'package:bankee/helpers/dependencies.dart' as dep;
import 'package:bankee/pages/splash/splash.dart';
import 'package:bankee/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'base/custom_loader.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
        (value) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.find<UserController>().getUserList();
    return GlobalLoaderOverlay(
      overlayColor: Colors.transparent,

      useDefaultLoading: false,
      overlayWidgetBuilder: (_) { //ignored progress for the moment
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4.0,
            sigmaY: 4.0,
          ),
          child: Center(
            child: CustomLoader(),
          ),
        );
      },
      child: GetMaterialApp(
      
        builder: (context, child) {
          return Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (context) => child!,
              ),
            ],
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Bankee',
        getPages: RouteHelpers.routes,
        initialRoute: RouteHelpers.getInitial(),
        theme: ThemeData(
          fontFamily: "DMSans",
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: const Splash(),
      ),
    );
  }
}
