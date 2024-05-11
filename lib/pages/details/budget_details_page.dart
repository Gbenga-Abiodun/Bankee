import 'package:bankee/generated/assets.dart';
import 'package:bankee/utils/colors.dart';
import 'package:bankee/utils/dimensions.dart';
import 'package:bankee/widgets/custom_carousel_slider.dart';
import 'package:bankee/widgets/custom_details_card.dart';
import 'package:bankee/widgets/scroll_view.dart';
import 'package:bankee/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BudgetDetailsPage extends StatelessWidget {
  const BudgetDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: AppScrollView(
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: Stack(
            children: [
              Container(
                height: Dimensions.height12 * 27,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        Dimensions.radius10 * 3,
                      ),
                      bottomRight: Radius.circular(
                        Dimensions.radius10 * 3,
                      ),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimensions.height12 * 5.166666666666667,
                    ),
                    SmallText(
                      text: "Budget",
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      size: Dimensions.height10 * 2,
                    ),
                    SizedBox(
                      height: Dimensions.height16,
                    ),
                  CustomCarouselSlider(),
                    SizedBox(
                      height: Dimensions.height12 * 3.416666666666667,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: Dimensions.height10 * 21,),
                child: Center(
                  child: Container(
                    // alignment: Alignment.center,

                    // margin: EdgeInsets.only(
                    //   bottom: Dimensions.height10 * ,
                    // ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Container(
                         width: Dimensions.height12 *30.25,
                         // height: Dimensions.height10 * 21,
                         child: Column(
                           children: [
                             CustomDetailsCard(svgPath: Assets.svgsBurgers, detailsTitle: 'Lunch & Dinner', detail: 'food', pricePerDay: '52/', trailPrice: '450', endPrice: '900',),
                             SizedBox(height: Dimensions.height12,),

                             CustomDetailsCard(svgPath: Assets.svgsHouse, detailsTitle: 'Car fuel', detail: 'fuel', pricePerDay: '20/', trailPrice: '600', endPrice: '900', trailColor: Color(0xFF9EA6BE,), percent: 0.5,),
                             SizedBox(height: Dimensions.height12,),
                             CustomDetailsCard(svgPath: Assets.svgsMedical, detailsTitle: 'Health', detail: 'health', pricePerDay: '30/', trailPrice: '230', endPrice: '900',),

                           ],
                         ),
                       )
                     ],
                   ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
