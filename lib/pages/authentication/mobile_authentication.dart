import 'package:bankee/controllers/utils_controller.dart';
import 'package:bankee/controllers/validation_controller.dart';
import 'package:bankee/routes/route_helper.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/small_text.dart';

class MobileAuthentication extends StatelessWidget {
   MobileAuthentication({super.key});
  var utilsController = Get.find<UtilsController>();

  var validationController = Get.find<ValidationController>();

  String newCountry = "";
  @override
  Widget build(BuildContext context) {

    void _showPicker(BuildContext context) {
      showCountryPicker(
        // favorite: ,
        onSelect: (value) {
          print(value);
          newCountry= value.phoneCode;
          utilsController.updatePhoneCode(value.phoneCode);
          utilsController.updateFlag(value.flagEmoji);
        } ,

        context: context,
        countryListTheme: CountryListThemeData(
          bottomSheetWidth: MediaQuery.of(context).size.width,
          bottomSheetHeight: Dimensions.height10 * 50,
          backgroundColor: AppColors.white,
          textStyle: TextStyle(
            color: AppColors.hintTextBlack,
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.font15,
          ),
          borderRadius: BorderRadius.only( topLeft: Radius.circular(
            Dimensions.radius10,
          ),
            topRight: Radius.circular(
              Dimensions.radius10,
            ),),
          inputDecoration: InputDecoration(
            fillColor: Color(0xFFF7F7F7),
            filled: true,
            hintText: "Type your Country",

            // prefix: IconButton(
            //
            //   onPressed: () {
            //
            //   },
            //     icon: Icon(Icons.search_outlined, color: AppColors.purple,)),
              hintStyle: TextStyle(
                color: AppColors.hintTextBlack,
                fontSize: Dimensions.font15,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    Dimensions.radius10,
                  ),
                ),
                borderSide:  BorderSide(
                  width: 1.0,
                  color: AppColors.purple,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    Dimensions.radius10,
                  ),
                ),
                borderSide: BorderSide.none,
                // borderSide: BorderSide(
                //   width: 1.0,
                //   // color: AppColors.purple,
                // ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    Dimensions.radius10,
                  ),
                ),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    Dimensions.radius10,
                  ),
                ),
                borderSide: BorderSide(
                  width: 1.0,
                  color: AppColors.red,
                ),
              )

          )

        ),
        // onSelect: (value) {
        //   utilsController.updateSelectedCountry(value);
        // },
      );
    }

    return Scaffold(

      appBar: CustomAppBar(),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast,
        ),
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
                    BigText(
                      text: "Mobile Number",
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackText,
                      size: Dimensions.font12 * 2.917,
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    SmallText(
                      text:
                      "Please enter your valid phone number. We will \n     send you 6-digit code to verify account.",
                      size: Dimensions.font15,
                      color: AppColors.blackText.withOpacity(
                        0.5,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height12 * 5.17,
                    ),

                    GetBuilder<UtilsController>(builder: (_) {
                      return Form(
                        key: validationController.mobileFormStateKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: AppTextField(
                          hintText: "",
                          autoFocus: false,
                          controller: validationController.mobileController,
                          onSaved:(value) =>  validationController.mobile = value!,
                          validator: (value) => validationController.validateMobile(value!),
                          inputFormatters:  [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10,),
                            ],
                          prefix: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => _showPicker(context),
                            child: Container(
                              margin: EdgeInsets.all(
                                14,
                              ),
                              // width: 10,
                              // alignment: Alignment.center,
                              child: SmallText(
                                text:
                                "${utilsController.flag} +${utilsController.phoneCode}  ",
                                color: AppColors.hintTextBlack,
                                size: Dimensions.font15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          obscureText: false,
                          onFieldSubmitted: (phoneNumber) {
                            print("${utilsController.phoneCode}${phoneNumber}");
                          },
                          keyboardType: TextInputType.phone,
                          fillColor: AppColors.white,
                          borderSide: BorderSide.none,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(149, 157, 165, 0.2),
                                blurRadius: 24,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),

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
                      height: Dimensions.height10 * 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.height37,
                      ),
                      child: Column(
                        children: [
                          CustomButton(
                            text: "Send Code",
                            color: AppColors.purple,
                            onTap: () => validationController.checkMobile(phoneCode: newCountry)
                          ),
                          SizedBox(
                            height: Dimensions.height10 * 2,
                          ),

                          // RichText(
                          //   text: TextSpan(
                          //     // recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                          //     text: "Already have an account? ",
                          //     style: TextStyle(
                          //       fontSize: Dimensions.font15,
                          //       color: AppColors.blackText,
                          //       fontFamily: "DMSans",
                          //
                          //     ),
                          //     children: [
                          //       TextSpan(
                          //         recognizer: TapGestureRecognizer()
                          //           ..onTap = () {
                          //             Get.back();
                          //           },
                          //         text: '- Sign Up',
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: Dimensions.font15,
                          //           color: AppColors.blackText,
                          //           fontFamily: "DMSans",
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

