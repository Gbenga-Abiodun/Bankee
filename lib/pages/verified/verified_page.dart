import 'package:bankee/controllers/user_controller.dart';
import 'package:bankee/widgets/scroll_view.dart';
import 'package:bankee/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/custom_button.dart';

class VerifiedPage extends StatelessWidget {
   VerifiedPage({Key? key}) : super(key: key);

  var userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: AppScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Dimensions.height10 * 10,
              ),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/svgs/Thumbs Up.svg",
                        width: Dimensions.height12 * 20.66666666666667,
                        height: Dimensions.height12 * 19.41666666666667,
                        fit: BoxFit.scaleDown,
                      ),

                      // BigText(
                      //   text: "Verify Account!",
                      //   fontWeight: FontWeight.bold,
                      //   color: AppColors.blackText,
                      //   size: Dimensions.font12 * 2.917,
                      // ),
                      // SizedBox(
                      //   height: Dimensions.height10 * 2,
                      // ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     SmallText(
                      //       text:
                      //       "Enter 4-digit Code code we have sent to ",
                      //       size: Dimensions.font15,
                      //       color: AppColors.blackText.withOpacity(
                      //         0.5,
                      //       ),
                      //     ),
                      //     SmallText(
                      //       text:
                      //       "+0 000 000 0000.",
                      //       size: Dimensions.font15,
                      //       color: AppColors.purple,
                      //
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: Dimensions.height12 * 7.75,
                      ),
                      // PinCodeTextField(
                      //   maxLength: 6,
                      //
                      //   keyboardType: TextInputType.phone,
                      // ),

                      // AppTextField(hintText: "Email", autoFocus: false, obscureText: false),
                      // SizedBox(height: Dimensions.font15/3,),
                      // AppTextField(hintText: "Password", autoFocus: false, obscureText: false),
                      // SizedBox(height: Dimensions.height10 * 2,),
                      // GestureDetector(
                      //   onTap: () {
                      //
                      //   },
                      //   child: Container(
                      //     padding:  EdgeInsets.symmetric(horizontal: Dimensions.height37,),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.end,
                      //       children: [
                      //         SmallText(text: "Forgot Password?", color: AppColors.blackText,),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      BigText(
                        text: "Account Created!",
                        size: Dimensions.font12 * 2.917,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackText,
                      ),
                      SizedBox(
                        height: Dimensions.height10 * 2,
                      ),
                      SmallText(
                        text:
                            "Dear user your account has been created \nsuccessfully. Continue to start using app",
                        size: Dimensions.font15,
                        color: AppColors.blackText.withOpacity(
                          0.5,
                        ),
                      ),

                      SizedBox(
                        height: Dimensions.height10 * 12,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.height37,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Spacer(),
                            CustomButton(
                              text: "Continue",
                              color: AppColors.purple,
                              onTap: () {
                                if(userController.userModel!.hasDetails == false ){
                                  Get.toNamed(RouteHelpers.getDetailsPage(),);
                                }else{
                                  Get.toNamed(RouteHelpers.getTouchId(),);
                                }
                                }
                            ),

                            SizedBox(
                              height: Dimensions.height10 * 2,
                            ),

                            RichText(
                              text: TextSpan(
                                // recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                                text: "by clicking start, you agree to our ",
                                style: TextStyle(
                                  fontSize: Dimensions.font13,
                                  color: AppColors.blackText,
                                  fontFamily: "DMSans",
                                ),
                                children: [
                                  TextSpan(
                                    // recognizer: TapGestureRecognizer()
                                    //   ..onTap = () {
                                    //     Get.back();
                                    //   },
                                    text: 'Privacy Policy ',
                                    style: TextStyle(
                                      fontSize: Dimensions.font13,
                                      color: AppColors.purple,
                                      fontFamily: "DMSans",
                                      fontWeight: FontWeight.bold,
                                      decorationColor: AppColors.purple,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextSpan(
                                    // recognizer: TapGestureRecognizer()
                                    //   ..onTap = () {
                                    //     Get.back();
                                    //   },
                                    text: '\n                & our ',
                                    style: TextStyle(
                                      fontSize: Dimensions.font13,
                                      color: AppColors.blackText,
                                      fontFamily: "DMSans",
                                      // decorationColor: AppColors.purple,
                                      // decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextSpan(
                                    // recognizer: TapGestureRecognizer()
                                    //   ..onTap = () {
                                    //     Get.back();
                                    //   },
                                    text: 'Terms and Conditions ',
                                    style: TextStyle(
                                      fontSize: Dimensions.font13,
                                      color: AppColors.purple,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "DMSans",
                                      decorationColor: AppColors.purple,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height16,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
