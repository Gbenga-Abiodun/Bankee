import 'package:bankee/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../generated/assets.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class CustomDetailsCard extends StatelessWidget {
  final String svgPath;
  final String detailsTitle;
  final String detail;

  final String pricePerDay;

  final String trailPrice;
  final String endPrice;

  final Color? trailColor;

  final double percent;

  const CustomDetailsCard({Key? key, required this.svgPath, required this.detailsTitle, required this.detail, required this.pricePerDay, required this.trailPrice, required this.endPrice, this.trailColor = const Color(0xFF7165E3),  this.percent = 0.6}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.radius10,
        ),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(149, 157, 165, 0.2),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      width: Dimensions.height12 * 30.25,
      height: Dimensions.height12 * 16.25,
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.height10 * 3,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height10 * 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Spacer(),
                    SvgPicture.asset(
                      svgPath,
                      width: Dimensions.height10 * 3,
                      height: Dimensions.height12 * 2.25,
                      fit: BoxFit.scaleDown,
                    ),
                    // Spacer(),
                    SizedBox(
                      width: Dimensions.height10,
                    ),
                    SmallText(
                      text: detailsTitle,
                      size: Dimensions.font16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackText,
                    ),
                    // Spacer(),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    // recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                    text: "\$${pricePerDay}",
                    style: TextStyle(
                      fontSize: Dimensions.height14,
                      color: AppColors.blackText,
                      fontWeight: FontWeight.bold,
                      fontFamily: "DMSans",
                    ),
                    children: [
                      TextSpan(
                        text: 'day',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,

                          fontSize: Dimensions.height14,
                          color: AppColors.blackText,
                          // fontFamily: "DMSans",
                        ),
                      ),
                    ],
                  ),
                ),
                // SmallText(text: "text")
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height14,
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: Dimensions.height10 *5,
                      child: LinearPercentIndicator(
                        // width: 328,
                        // trailing: Text("Full"),
                        lineHeight: Dimensions.height12 *3.166666666666667,
                        animation: true,
                        percent: percent,
                        progressColor: trailColor,
                        barRadius: Radius.circular(
                          Dimensions.font18,
                        ),
                        backgroundColor: Color(0xFFF9F9FB),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    right: Dimensions.height12* 6.25,
                    child: Container(
                      width: Dimensions.height10/5,
                      height: Dimensions.height10 * 7,
                      color: AppColors.purple,
                    )),
                Positioned(
                    top: Dimensions.height15,
                    left: Dimensions.font18,
                    child: SmallText(
                      text: "\$${trailPrice}",
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      size: Dimensions.height14,
                    ),),
                Positioned(
                    top: Dimensions.height15,
                    right: Dimensions.font18,
                    child: SmallText(
                      text: "\$${endPrice}",
                      color: Color(0xFF7D8CBA),
                      fontWeight: FontWeight.bold,
                      size: Dimensions.height14,
                    ),),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          Padding( padding: EdgeInsets.symmetric(
            horizontal: Dimensions.height10 * 2,
          ),
            child: Column(
              children: [
                Divider(
                  color: Color(
                    0xFFD8D8D8,
                  ),
                ),
                SizedBox(height: Dimensions.height10,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Dimensions.font18,
                      height: Dimensions.font18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.purple,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_outlined,
                          size: Dimensions.font18/2,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: Dimensions.height10,),
                    SmallText(text: "Your ${detail} spending is still on track", color: Color(0xFF9EA6BE), size: Dimensions.font13, fontWeight: FontWeight.bold,)
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
