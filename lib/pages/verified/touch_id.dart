import 'package:bankee/controllers/auth_controller.dart';
import 'package:bankee/controllers/user_controller.dart';
import 'package:bankee/controllers/utils_controller.dart';
import 'package:bankee/routes/route_helper.dart';
import 'package:bankee/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/local_auth_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/scroll_view.dart';
import '../../widgets/small_text.dart';

class TouchId extends StatelessWidget {
   TouchId({Key? key}) : super(key: key);

  var authController =Get.find<AuthController>();

  var utilsController = Get.find<UtilsController>();

  var userController = Get.find<UserController>();

  var localAuthController  = Get.find<LocalAuthController>();


  // _showModalBottomSheet(BuildContext context){
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //
  //     elevation: 0,
  //     showDragHandle: true,
  //     backgroundColor: AppColors.white,
  //     context: context,
  //
  //     builder: (context) {
  //       return AppScrollView(
  //         child: Container(
  //           margin: EdgeInsets.symmetric(horizontal: Dimensions.height37,),
  //           width: MediaQuery.of(context).size.width,
  //           child: Column(
  //             children: [
  //               SizedBox(height: Dimensions.height10,),
  //               Icon(Icons.fingerprint_rounded, color: AppColors.purple, size: Dimensions.height10 * 9,),
  //               SizedBox(height: Dimensions.height16,),
  //               SmallText(text: "Enable Touch ID", color: AppColors.blackText, fontWeight: FontWeight.bold, size: Dimensions.height10 * 2,),
  //
  //               SizedBox(height: Dimensions.height16,),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                  CustomButton(text: "Cancel", color: AppColors.greyButton, width: Dimensions.height10 * 12, onTap: () => Get.back(),) ,
  //                  CustomButton(text: "Enable", color: AppColors.purple,width: Dimensions.height10 * 12, onTap: () => ,) ,
  //
  //                 ],
  //               ),
  //               SizedBox(height: Dimensions.height10 * 3,),
  //             ],
  //           ),
  //         ),
  //       );
  //
  //   },);
  // }

  @override
  Widget build(BuildContext context) {

    // _showBottomSheet(){
    //   return
    //
    // }
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(),
      body: AppScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Dimensions.height10 * 3,
            ),
            Center(
              child: Container(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/svgs/Finger ID Access.svg",
                      width: Dimensions.height12 * 22.25,
                      height: Dimensions.height12 * 22.25,
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
                      height: Dimensions.height12 * 3.916666666666667,
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
                      text: "    Use Touch ID to \nauthorise payments",
                      size: Dimensions.font13 * 2,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackText,
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    SmallText(
                      text:
                      "Activate touch ID so you Don’t need \nto confirm your PIN every time you \n            want to send money",
                      size: Dimensions.font15,
                      color: AppColors.blackText.withOpacity(
                        0.5,
                      ),
                    ),
        
                    SizedBox(
                      height: Dimensions.height12 * 6.25,
                    ),
        
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.height37,
                      ),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Spacer(),
                          CustomButton(
                            text: "Activate Now",
                            color: AppColors.purple,
                            onTap: () {
                              userController.updateFingerPrint();

                              // utilsController.showToast("local enabled "+ use,);
                            },
                          ),
                          SizedBox(height: Dimensions.height16,),
                          CustomButton(
                            text: "Skip This",
                            color: AppColors.greyButton,
                            onTap: () => Get.toNamed(RouteHelpers.getPassCode(),),
                          ),
        
                          // SizedBox(
                          //   height: Dimensions.height10 * 2,
                          // ),
                          //
                          // RichText(
                          //   text: TextSpan(
                          //     // recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                          //     text: "by clicking start, you agree to our ",
                          //     style: TextStyle(
                          //       fontSize: Dimensions.font13,
                          //       color: AppColors.blackText,
                          //       fontFamily: "DMSans",
                          //     ),
                          //     children: [
                          //       TextSpan(
                          //         // recognizer: TapGestureRecognizer()
                          //         //   ..onTap = () {
                          //         //     Get.back();
                          //         //   },
                          //         text: 'Privacy Policy ',
                          //         style: TextStyle(
                          //           fontSize: Dimensions.font13,
                          //           color: AppColors.purple,
                          //           fontFamily: "DMSans",
                          //           fontWeight: FontWeight.bold,
                          //           decorationColor: AppColors.purple,
                          //           decoration: TextDecoration.underline,
                          //         ),
                          //       ),
                          //       TextSpan(
                          //         // recognizer: TapGestureRecognizer()
                          //         //   ..onTap = () {
                          //         //     Get.back();
                          //         //   },
                          //         text: '\n                & our ',
                          //         style: TextStyle(
                          //           fontSize: Dimensions.font13,
                          //           color: AppColors.blackText,
                          //           fontFamily: "DMSans",
                          //           // decorationColor: AppColors.purple,
                          //           // decoration: TextDecoration.underline,
                          //         ),
                          //       ),
                          //       TextSpan(
                          //         // recognizer: TapGestureRecognizer()
                          //         //   ..onTap = () {
                          //         //     Get.back();
                          //         //   },
                          //         text: 'Terms and Conditions ',
                          //         style: TextStyle(
                          //           fontSize: Dimensions.font13,
                          //           color: AppColors.purple,
                          //           fontWeight: FontWeight.bold,
                          //           fontFamily: "DMSans",
                          //           decorationColor: AppColors.purple,
                          //           decoration: TextDecoration.underline,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
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
    );
  }
}
