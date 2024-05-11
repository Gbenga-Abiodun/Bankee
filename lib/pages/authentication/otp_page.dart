import 'package:bankee/controllers/auth_controller.dart';
import 'package:bankee/controllers/utils_controller.dart';
import 'package:bankee/controllers/validation_controller.dart';
import 'package:bankee/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/small_text.dart';

class OtpPage extends StatelessWidget {
  OtpPage({Key? key}) : super(key: key);

  var validationController = Get.find<ValidationController>();

  var authController = Get.find<AuthController>();

  var utilsController = Get.find<UtilsController>();

  final defaultPinTheme = PinTheme(
    width: Dimensions.height10 * 6,
    height: Dimensions.height10 * 6,
    textStyle: TextStyle(
        fontSize: Dimensions.height12 * 2.916666666666667,
        color: AppColors.blackText,
        fontWeight: FontWeight.bold),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.black,
          width: 2.0,
        ),
      ),
      borderRadius: BorderRadius.zero,
    ),
  );
  final focusedPinTheme = PinTheme(
    width: Dimensions.height10 * 6,
    height: Dimensions.height10 * 6,
    textStyle: TextStyle(
        fontSize: Dimensions.height12 * 2.916666666666667,
        color: AppColors.blackText,
        fontWeight: FontWeight.bold),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.purple,
          width: 2.0,
        ),
      ),
      borderRadius: BorderRadius.zero,
    ),
  );
  final submittedPinTheme = PinTheme(
    width: Dimensions.height10 * 6,
    height: Dimensions.height10 * 6,
    textStyle: TextStyle(
        fontSize: Dimensions.height12 * 2.916666666666667,
        color: AppColors.purple,
        fontWeight: FontWeight.bold),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.purple,
          width: 1.0,
        ),
      ),
      borderRadius: BorderRadius.zero,
    ),
  );
  final errorPinTheme = PinTheme(
    width: Dimensions.height10 * 6,
    height: Dimensions.height10 * 6,
    textStyle: TextStyle(
        fontSize: Dimensions.height12 * 2.916666666666667,
        color: Colors.red,
        fontWeight: FontWeight.bold),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
      borderRadius: BorderRadius.zero,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Dimensions.height10 * 8,
            ),
            Center(
              child: Container(
                child: Column(
                  children: [
                    BigText(
                      text: "Verify Account!",
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
                          text: "Enter 4-digit Code code we have sent to ",
                          size: Dimensions.font15,
                          color: AppColors.blackText.withOpacity(
                            0.5,
                          ),
                        ),
                        SmallText(
                          text:
                              "+${utilsController.phoneCode}${validationController.mobile}",
                          size: Dimensions.font15,
                          color: AppColors.purple,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height12 * 5.17,
                    ),
                    // PinCodeTextField(
                    //   maxLength: 6,
                    //
                    //   keyboardType: TextInputType.phone,
                    // ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.height37,
                      ),
                      child: Form(
                        key: validationController.pinStateKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Pinput(
                          showCursor: false,
                          // errorText: "Incorrect Pin",
                          validator: (value) =>
                              validationController.validateName(value!),
                          controller: validationController.pinController,
                          errorPinTheme: errorPinTheme,

                          onCompleted: (value) {
                            validationController.pinNumber = value;
                            validationController.checkPin();
                          },
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          length: 6,

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          // submittedPinTheme: submittedPinTheme,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height43,
                    ),
                    SmallText(
                      text: "Didn’t not received the code?",
                      color: AppColors.blackText,
                      size: Dimensions.font15,
                    ),
                    SizedBox(
                      height: Dimensions.height16,
                    ),
                    GestureDetector(
                      onTap: () => authController.resendCode(validationController.phoneNumber.toString()),
                        child: SmallText(
                      text: "Resend Code",
                      color: AppColors.purple,
                      size: Dimensions.font18,
                      fontWeight: FontWeight.bold,
                      decorationColor: AppColors.purple,
                      decoration: TextDecoration.underline,
                    )),

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

                    SizedBox(
                      height: Dimensions.height10 * 22,
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
                            text: "Proceed",
                            color: AppColors.purple,
                            onTap: () => validationController.checkPin(),
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
