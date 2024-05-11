import 'package:bankee/controllers/local_auth_controller.dart';
import 'package:bankee/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/validation_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/small_text.dart';

class ConfirmPassCode extends StatelessWidget {
  ConfirmPassCode({Key? key}) : super(key: key);
  var validationController = Get.find<ValidationController>();

  var userController = Get.find<UserController>();
  var localAuthController = Get.find<LocalAuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Dimensions.height10 * 9,
            ),
            Center(
              child: Container(
                child: Column(
                  children: [
                    BigText(
                      text: "Welcome Back!",
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackText,
                      size: Dimensions.font12 * 2.917,
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmallText(
                          text: "Enter your 4-digit passcode to continue",
                          size: Dimensions.font15,
                          color: AppColors.blackText.withOpacity(
                            0.5,
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height10 * 2,
                        ),
                        // SmallText(
                        //   text:
                        //   "+${utilsController.selectedCountry.value.phoneCode}${validationController.mobile}",
                        //   size: Dimensions.font15,
                        //   color: AppColors.purple,
                        //
                        // ),
                      ],
                    ),
                    // pin code Area
                    Obx(() {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.height10 * 7),
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(149, 157, 165, 0.2),
                                  blurRadius: 24,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(4, (index) {
                                final inputLength = validationController
                                    .confirmPasscode.value.length;
                                final isIndexInRange = index < inputLength;
                                return Container(
                                  width:
                                      Dimensions.height12 * 4.333333333333333,
                                  height:
                                      Dimensions.height12 * 4.333333333333333,
                                  child: Center(
                                    child: isIndexInRange &&
                                            validationController
                                                .isPinVisible.value
                                        ? SvgPicture.asset(
                                            "assets/svgs/asterix.svg",
                                            width: Dimensions.height15,
                                            height: Dimensions.height13,
                                            fit: BoxFit.scaleDown,
                                          )
                                        : SmallText(
                                            text: isIndexInRange
                                                ? validationController
                                                    .confirmPasscode
                                                    .value[index]
                                                : "",
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.white,
                                            size: Dimensions.font12 * 2,
                                          ),
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        validationController.isPinVisible.value
                                            ? AppColors.white
                                            : AppColors.purple,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.height16),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      );
                    }),

                    SizedBox(
                      height: Dimensions.height16,
                    ),
                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          validationController.isPinVisible.value =
                              !validationController.isPinVisible.value;
                        },
                        child: Icon(
                          validationController.isPinVisible.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: Dimensions.height37,
                          color: AppColors.purple,
                        ),
                      );
                    }),
                    // SizedBox(
                    //   height: Dimensions.height12 * 5.17,
                    // ),
                    // PinCodeTextField(
                    //   maxLength: 6,
                    //
                    //   keyboardType: TextInputType.phone,
                    // ),

                    // GestureDetector()
                    SizedBox(
                      height: Dimensions.height16,
                    ),

                    for (var i = 0; i < 3; i++)
                      Container(
                        // height: Dimensions.height10 * 3,
                        margin: EdgeInsets.symmetric(
                            horizontal: Dimensions.height10 * 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                                  3, (index) => numWidget(1 + 3 * i + index))
                              .toList(),
                        ),
                      ),
                    // SmallText(text: "Didn’t not received the code?",color: AppColors.blackText, size: Dimensions.font15,),
                    // SizedBox(height: Dimensions.height16,),
                    // SmallText(text: "Resend Code",color: AppColors.purple, size: Dimensions.font18, fontWeight: FontWeight.bold, decorationColor: AppColors.purple, decoration: TextDecoration.underline,),

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

                    // SizedBox(
                    //   height: Dimensions.height10 * 22,
                    // ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.height10 * 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            onPressed: () => null,
                            child: SmallText(
                              text: "Sign Out",
                              size: Dimensions.font15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.purple,
                            ),
                          ),
                          numWidget(0),
      Obx(() {
        return validationController.confirmPasscode.value.isEmpty &&
            // userController.userModel!.hasFingerPrint== true &&
            localAuthController.hasLocalAuthentication.value
            ? MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.height10 * 8,
            ),
          ),
          elevation: 0,
          onPressed: () {
            localAuthController.authenticateBiometric();
            // validationController.clearConfirmPassCodePin();
          },
          child: Container(
            height: Dimensions.height10 * 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.fingerprint_outlined,
              color: AppColors.purple,
              size: Dimensions.height12 * 2,
            ),
          ),
        )
            : validationController.confirmPasscode.value.isNotEmpty
            ? MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.height10 * 8,
            ),
          ),
          elevation: 0,
          onPressed: () {
            validationController.clearConfirmPassCodePin();
          },
          child: Container(
            height: Dimensions.height10 * 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.backspace_rounded,
              color: AppColors.purple,
              size: Dimensions.height12 * 2,
            ),
          ),
        )
            : MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.height10 * 8,
            ),
          ),
          elevation: 0,
          onPressed: () {
            localAuthController.authenticateBiometric();
            // validationController.clearConfirmPassCodePin();
          },
          child: Container(
            height: Dimensions.height10 * 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.fingerprint_outlined,
              color: AppColors.purple,
              size: Dimensions.height12 * 2,
            ),
          ),
        );
      })

      ],
                      ),
                    ),

                    SizedBox(
                      height: Dimensions.height37,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.height37,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                            text: "Sign In",
                            color: AppColors.purple,
                            onTap: () =>
                                validationController.checkConfirmPassCode(),
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          // Spacer(),
                          // CustomButton(
                          //   text: "Proceed",
                          //   color: AppColors.purple,
                          //   // onTap: () => validationController.checkPin(),
                          // ),

                          // SizedBox(
                          //   height: Dimensions.height10 * 2,
                          // ),

                          // RichText(
                          //   text: TextSpan(
                          //     // recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                          //     text: "by clicking start, you agree to our ",
                          //     style: TextStyle(
                          //       fontSize: Dimensions.font13,
                          //       color: AppColors.blackText,
                          //       fontFamily: "DMSans",
                          //
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
                          //
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
                          //
                          //         ),
                          //       ),
                          //
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
                          //
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

  Widget numWidget(int index) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimensions.height10 * 8,
        ),
      ),
      elevation: 0,
      onPressed: () {
        validationController.confirmPasscodePin(index);

        // if (index == 11) {
        //   validationController.passcodePin(11); // Pass a special value for backspace
        // } else {
        //   validationController.passcodePin(index == 9 ? 9 : index); // Pass other indices as usual
        // }
      },
      child: Container(
        // width: Dimensions.height10 * 5,
        height: Dimensions.height10 * 6,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        margin: EdgeInsets.all(
          Dimensions.height16,
        ),
        // color: AppColors.purple,

        child: Center(
          child: SmallText(
            text: index.toString(),
            size: Dimensions.font12 * 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
