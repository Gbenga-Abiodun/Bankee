import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bankee/controllers/auth_controller.dart';
import 'package:bankee/controllers/user_controller.dart';
import 'package:bankee/utils/colors.dart';
import 'package:bankee/utils/dimensions.dart';
import 'package:bankee/widgets/big_text.dart';
import 'package:bankee/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Future<void> _loadData()async{
    await Get.find<UserController>().getUserData();

  }
  Future<void> _checkUser() async {
    await Get.find<AuthController>().checkUser();
  }

  @override
  void initState() {
    super.initState();
    // Add code after super

    Timer(const Duration(seconds: 2), () => _checkUser());
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Column(
                children: [
                  DefaultTextStyle(
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: Dimensions.height10 * 7,
                      fontFamily: "DMSans",
                      color: AppColors.white,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          "Bankee",
                          speed: Duration(
                            milliseconds: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height10 / 2,
                  ),
                  SmallText(
                    text: "Bank, Finance Kit",
                    size: Dimensions.height10 * 2,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
