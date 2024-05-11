import 'package:bankee/utils/colors.dart';
import 'package:bankee/utils/dimensions.dart';
import 'package:bankee/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Container(
              child: Center(child: SpinKitDualRing(color: AppColors.black, size: Dimensions.height10 * 7, lineWidth: 5.0, duration: Duration(milliseconds: 800,),)),
            ),
          ),
          Center(
            child: Container(
              width: Dimensions.height10 * 6,
              height: Dimensions.height10 * 6,
              decoration: BoxDecoration(
                color: AppColors.purple,
                shape: BoxShape.circle,
              ),
              child: Center(child: BigText(text: "B", fontWeight: FontWeight.bold, color: AppColors.white, size: 20,)),

            ),
          )
        ],
      ),
    );
  }
}
