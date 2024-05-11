import 'package:bankee/controllers/user_controller.dart';
import 'package:bankee/routes/route_helper.dart';
import 'package:bankee/utils/colors.dart';
import 'package:bankee/utils/dimensions.dart';
import 'package:bankee/widgets/custom_app_bar.dart';
import 'package:bankee/widgets/custom_button.dart';
import 'package:bankee/widgets/custome_semi_circle.dart';
import 'package:bankee/widgets/scroll_view.dart';
import 'package:bankee/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../generated/assets.dart';

class MoneySummaryPage extends StatelessWidget {
   MoneySummaryPage({Key? key}) : super(key: key);

  var userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: Text("Summary"),
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height12 * 27.91666666666667,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.height12 * 2,),
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF9F9FB),
        child: Column(
          children: [
            SizedBox(height: Dimensions.height13* 2 ,),
            Align(
              alignment: Alignment.bottomLeft,
                child: SmallText(text: "Top Category", fontWeight: FontWeight.bold, size:  Dimensions.font18,)),

            SizedBox(height: Dimensions.height12 * 2.333333333333333 ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Dimensions.height12 * 14.5,
                  height: Dimensions.height12 * 19,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.all(Radius.circular(Dimensions.radius10),),
                    color: AppColors.white,
                  ),
                  
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: Dimensions.height12* 2.083333333333333 ,),
                      CustomeSemiCircle(ProgressValue: 0.7, svgAsset: Assets.svgsBurgers,),
                      SizedBox(height: Dimensions.height10,),
                      SmallText(text: "Lunch & Dinner", size: Dimensions.font16, fontWeight: FontWeight.bold, color: AppColors.blackText,),
                      SizedBox(height: Dimensions.height10/2,),
                      SmallText(text: "\$450", size: Dimensions.font15,  color: AppColors.blackText,),
                      SizedBox(height: Dimensions.font17,),
                      Container(
                        width: Dimensions.height10*9,
                        height: Dimensions.height10*3,
                        decoration: BoxDecoration(
                          color: AppColors.greyTextField,
                          borderRadius: BorderRadius.circular(Dimensions.height15),
                        ),
                        child: Center(
                          child: SmallText(text: "on track", color: AppColors.greyButton,),
                        ),
                      )
                      // SmallText(text: "450", size: Dimensions.font15,  color: AppColors.blackText,),

                    ],
                  ),
                ),
                Container(
                  width: Dimensions.height12 * 14.5,
                  height: Dimensions.height12 * 19,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: Dimensions.height12* 2.083333333333333 ,),
                      CustomeSemiCircle(ProgressValue: 0.7, svgAsset: Assets.svgsMedical,),

                      SizedBox(height: Dimensions.height10,),
                      SmallText(text: "Health", size: Dimensions.font16, fontWeight: FontWeight.bold, color: AppColors.blackText,),
                      SizedBox(height: Dimensions.height10/2,),
                      SmallText(text: "\$330", size: Dimensions.font15,  color: AppColors.blackText,),
                      SizedBox(height: Dimensions.font17,),
                      Container(
                        width: Dimensions.height10*9,
                        height: Dimensions.height10*3,
                        decoration: BoxDecoration(
                          color: AppColors.greyTextField,
                          borderRadius: BorderRadius.circular(Dimensions.height15),
                        ),
                        child: Center(
                          child: SmallText(text: "on track", color: AppColors.greyButton,),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.all(Radius.circular(Dimensions.radius10),),
                    color: AppColors.white,
                  ),
                ),
              ],
            )
          ],
        ),

      ),
      body: AppScrollView(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: Dimensions.height37,),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 20,),
                SvgPicture.asset(Assets.svgsSummary, width: Dimensions.height10 * 23, height: Dimensions.height12  * 15.08333333333333, fit: BoxFit.scaleDown,),
                SizedBox(height: Dimensions.height10 ,),
                SmallText(text: "This month spending", fontWeight: FontWeight.bold, size: Dimensions.height10 * 2,),
                SizedBox(height: Dimensions.height10/2,),
                SmallText(text: NumberFormat.simpleCurrency(locale: "en_NG", decimalDigits: 2,).format(userController.userModel!.balance), fontWeight: FontWeight.bold, size: Dimensions.height10 * 4,),
                SizedBox(height: Dimensions.height10/2,),
                SmallText(text: "Well done you have maintained your \n           spending under control",  size: Dimensions.font15, color: AppColors.blackText.withOpacity(
                  0.5,
                ),),
                SizedBox(height: Dimensions.font15,),
                CustomButton(text: "Great", color: AppColors.purple, onTap: () => Get.toNamed(RouteHelpers.getBudgetDetailsPage(),),),
        
        
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
