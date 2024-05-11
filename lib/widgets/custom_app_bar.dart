import 'package:bankee/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final Widget? title;
  const CustomAppBar({Key? key, this.title = const Text("")}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      titleTextStyle: TextStyle(
        fontSize: Dimensions.height10 * 2,
        fontWeight: FontWeight.bold,
        color: AppColors.blackText,
        fontFamily: "DMSans",

      ),
      centerTitle: true,
      backgroundColor: AppColors.white,
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
            margin: EdgeInsets.only(left: Dimensions.height37),
            child: Icon(
              Icons.arrow_back_ios,
              size: Dimensions.height10 * 2,
              color: Colors.black,
            )),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(Dimensions.height12* 4.666666666666667 ,);
}
