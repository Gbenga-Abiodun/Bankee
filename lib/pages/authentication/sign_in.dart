import 'package:bankee/routes/route_helper.dart';
import 'package:bankee/widgets/custom_app_bar.dart';
import 'package:bankee/widgets/scroll_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/validation_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/small_text.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  var validationController = Get.find<ValidationController>();

  @override
  Widget build(BuildContext context) {
    void _showBottomSheet(BuildContext context) {
      showModalBottomSheet(
        isScrollControlled: true,
        constraints: BoxConstraints.tight(Size(MediaQuery
            .of(context)
            .size
            .width,
            MediaQuery
                .of(context)
                .size
                .height * .7)),
        // barrierColor: ,
        elevation: 0,

        backgroundColor: AppColors.white,
        showDragHandle: true,
        context: context,
        builder: (context) {
          return AppScrollView(
            child: Container(
              child: Column(
                children: [

                  BigText(
                    text: "Password Reset",
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackText,
                    size: Dimensions.font18,
                  ),
                  SizedBox(height: Dimensions.height10,),

                  SmallText(
                    text: "A password reset link will \n   be sent to your email.",
                    size: Dimensions.font15,
                    color: AppColors.blackText.withOpacity(
                      0.5,
                    ),
                  ),
                  SizedBox(height: Dimensions.height10,),
                  Form(
                    key: validationController.forgottenFormStateKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    child: AppTextField(
                      hintText: "Email",
                      autoFocus: true,
                      obscureText: false,
                      controller: validationController
                          .forgottenPasswordController,
                      onSaved: (value) =>
                      validationController.forgottenPassword = value!,
                      validator: (value) =>
                          validationController.validateEmail(value!),
                    ),
                  ),
                  SizedBox(height: Dimensions.height14,),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.height37,),
                    child: CustomButton(text: "Send Link",
                      color: AppColors.purple,
                      onTap: () =>
                          validationController.checkForgottenPassword(),),
                  ),
                  SizedBox(height: Dimensions.height10,),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast,
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              Center(
                child: Container(
                  child: Form(
                    key: validationController.signInFormStateKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        SmallText(
                          text: "Sign in to continue ",
                          size: Dimensions.font15,
                          color: AppColors.blackText.withOpacity(
                            0.5,
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height12 * 5.17,
                        ),
                        AppTextField(
                          hintText: "Email",
                          autoFocus: false,
                          obscureText: false,
                          controller: validationController
                              .signInEmailController,
                          onSaved: (value) =>
                          validationController.signInEmail = value!,
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
                            // obscureText: false,
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
                            controller: validationController
                                .signInPasswordController,
                            onSaved: (value) =>
                            validationController.signInPassword = value!,
                            validator: (value) =>
                                validationController.validatePassword(value!),
                          );
                        }),
                        SizedBox(
                          height: Dimensions.height10 * 2,
                        ),
                        GestureDetector(
                          onTap: () => _showBottomSheet(context),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.height37,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SmallText(
                                  text: "Forgot Password?",
                                  color: AppColors.blackText,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
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
                                text: "Sign in My Account",
                                color: AppColors.purple,
                                // onTap: () =>,
                                onTap: () => validationController.checkSignIn(),
                              ),
                              SizedBox(
                                height: Dimensions.height10 * 2,
                              ),
                              RichText(
                                text: TextSpan(
                                  // recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    fontSize: Dimensions.font15,
                                    color: AppColors.blackText,
                                    fontFamily: "DMSans",
                                  ),
                                  children: [
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.back();
                                        },
                                      text: '- Sign Up',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimensions.font15,
                                        color: AppColors.blackText,
                                        fontFamily: "DMSans",
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
