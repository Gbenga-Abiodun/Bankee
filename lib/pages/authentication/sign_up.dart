import 'package:bankee/controllers/user_controller.dart';
import 'package:bankee/controllers/validation_controller.dart';
import 'package:bankee/utils/colors.dart';
import 'package:bankee/utils/dimensions.dart';
import 'package:bankee/widgets/app_text_field.dart';
import 'package:bankee/widgets/big_text.dart';
import 'package:bankee/widgets/custom_button.dart';
import 'package:bankee/widgets/small_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  var validationController = Get.find<ValidationController>();


  var userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    // innvasity
    //nvasity
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast,
        ),
        child: Container(
          child: Form(
            key: validationController.signUpFormStateKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          text: " Welcome!",
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackText,
                          size: Dimensions.font12 * 2.917,
                        ),
                        SizedBox(
                          height: Dimensions.height10 * 2,
                        ),
                        SmallText(
                          text:
                          "    Please provide the following\n    details for your new account",
                          size: Dimensions.font15,
                          color: AppColors.blackText.withOpacity(
                            0.5,
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height12 * 3,
                        ),
                        AppTextField(
                          hintText: "Full Name",
                          autoFocus: false,
                          obscureText: false,
                          controller: validationController.nameController,
                          onSaved: (value) =>
                          validationController.name = value!,
                          validator: (value) =>
                              validationController.validateName(value!),
                        ),
                        SizedBox(
                          height: Dimensions.font15 / 3,
                        ),
                        AppTextField(
                          hintText: "Email Address",
                          autoFocus: false,
                          obscureText: false,
                          controller: validationController.emailController,
                          onSaved: (value) =>
                          validationController.email = value!,
                          validator: (value) =>
                              validationController.validateEmail(value!),
                        ),
                        SizedBox(
                          height: Dimensions.font15 / 3,
                        ),
                        Obx(() {
                          return AppTextField(
                            hintText: "Password",
                            autoFocus: false,
                            obscureText:
                            validationController.isPasswordHidden.value,
                            suffix: IconButton(
                              onPressed: () {
                                validationController.isPasswordHidden.value =
                                !validationController.isPasswordHidden.value;
                              },
                              icon: Icon(
                                !validationController.isPasswordHidden.value
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFFCECECE),
                                size: Dimensions.font18,
                              ),
                            ),
                            controller: validationController.passwordController,
                            onSaved: (value) =>
                            validationController.password = value!,
                            validator: (value) =>
                                validationController.validatePassword(value!),
                          );
                        }),
                        SizedBox(
                          height: Dimensions.font12 * 2.3,
                        ),
                        GestureDetector(
                          onTap: () => validationController.toggleCheck(),
                          child: GetBuilder<ValidationController>(builder: (_) {
                            return Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: Dimensions.height37,
                                ),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: Dimensions.height13 * 2,
                                      height: Dimensions.height13 * 2,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color:
                                          AppColors.purple.withOpacity(0.3),
                                          borderRadius:
                                          BorderRadius.circular(4),
                                          border: Border.all(
                                              color: AppColors.purple)),
                                      child: validationController
                                          .isChecked.value
                                          ? Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: Dimensions.height12 * 2,
                                        ),
                                      )
                                          : SizedBox(),
                                    ),
                                    SizedBox(
                                      width: Dimensions.height12,
                                    ),
                                    Container(
                                      child: SmallText(
                                        text:
                                        "By creating your account you have to agree \nwith our Terms and Conditions.",
                                        size: Dimensions.font13,
                                      ),
                                    ),
                                  ],
                                ));
                          }),
                        ),
                        SizedBox(
                          height: Dimensions.height10 * 5,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.height37,
                          ),
                          child: Column(
                            children: [
                              CustomButton(
                                text: "Sign up my Account",
                                color: AppColors.purple,
                                // onTap: () => userController.getUserList(),
                                onTap: () => validationController.checkSignUp(),
                              ),
                              SizedBox(
                                height: Dimensions.height14 / 2,
                              ),
                              CustomButton(
                                text: "Sign In with Phone Number",
                                color: AppColors.black,
                                onTap: () =>
                                    Get.toNamed(
                                      RouteHelpers.getMobileAuth(),
                                    ),
                              ),
                              SizedBox(
                                height: Dimensions.height10 * 2,
                              ),
                              RichText(
                                text: TextSpan(
                                  // recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    fontSize: Dimensions.font15,
                                    color: AppColors.blackText,
                                    fontFamily: "DMSans",
                                  ),
                                  children: [
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.toNamed(
                                            RouteHelpers.getSignIn(),
                                          );
                                        },
                                      text: '- Sign In',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimensions.font15,
                                        color: AppColors.blackText,
                                        fontFamily: "NunitoSans",
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
        ),
      ),
    );
  }
}
