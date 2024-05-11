import 'package:bankee/controllers/validation_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/small_text.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key}) : super(key: key);

  var validationController = Get.find<ValidationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("User Details",),
      ),
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
                    key: validationController.detailsFormStateKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        // BigText(
                        //   text: "User Details",
                        //   fontWeight: FontWeight.bold,
                        //   color: AppColors.blackText,
                        //   size: Dimensions.font12 * 2.917,
                        // ),
                        // SizedBox(
                        //   height: Dimensions.height10 * 2,
                        // ),
                        // SmallText(
                        //   text: "Enter your user details and create a new password",
                        //   size: Dimensions.font15,
                        //   color: AppColors.blackText.withOpacity(
                        //     0.5,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: Dimensions.height12 * 5.17,
                        // ),
                        Container(
                          width: Dimensions.height12 * 8.5,
                          height: Dimensions.height10 * 10,
                          decoration: BoxDecoration(
                            color: AppColors.purple,
                            borderRadius: BorderRadius.circular(
                              Dimensions.height10,),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.camera_alt_rounded, color: AppColors.white,
                              size: Dimensions.height10 * 5,),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height12 * 3,
                        ),
                        AppTextField(
                          hintText: "Full Name",
                          autoFocus: false,
                          obscureText: false,
                          controller: validationController
                              .detailsNameController,
                          onSaved: (value) =>
                          validationController.detailsName = value!,
                          validator: (value) =>
                              validationController.validateName(value!),
                        ),
                        SizedBox(
                          height: Dimensions.font15 / 3,
                        ),
                        AppTextField(
                          hintText: "Email",
                          autoFocus: false,
                          obscureText: false,
                          controller: validationController
                              .detailsEmailContoller,
                          onSaved: (value) =>
                          validationController.detailsEmail = value!,
                          validator: (value) =>
                              validationController.validateEmail(value!),
                        ),
                        // SizedBox(
                        //   height: Dimensions.font15 / 3,
                        // ),
                        // Obx(() {
                        //   return AppTextField(
                        //     hintText: "Password",
                        //     autoFocus: false,
                        //     // obscureText: false,
                        //     obscureText:
                        //     validationController.isPasswordHidden.value,
                        //     suffix: IconButton(
                        //       onPressed: () {
                        //         validationController.isPasswordHidden.value =
                        //         !validationController.isPasswordHidden.value;
                        //       },
                        //       icon: Icon(
                        //         !validationController.isPasswordHidden.value
                        //             ? Icons.visibility_outlined
                        //             : Icons.visibility_off_outlined,
                        //         color: Color(0xFFCECECE),
                        //         size: Dimensions.font18,
                        //       ),
                        //     ),
                        //     controller: validationController
                        //         .detailsPasswordController,
                        //     onSaved: (value) =>
                        //     validationController.detailsPassword = value!,
                        //     validator: (value) =>
                        //         validationController.validatePassword(value!),
                        //   );
                        // }),

                        SizedBox(
                          height: Dimensions.height10 * 4,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.height37,
                          ),
                          child: Column(
                            children: [
                              CustomButton(
                                text: "Save details",
                                color: AppColors.purple,
                                // onTap: () =>,
                                onTap: () => validationController.checkDetails(),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
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
