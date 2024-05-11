import 'package:bankee/utils/colors.dart';
import 'package:bankee/widgets/big_text.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/dimensions.dart';

class UtilsController extends GetxController  {
 final toast = FToast();

 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    toast.init(Get.context!);
    // phoneCode.value = "91";
  }
  //
  // var indian = ;



  var phoneCode = "${CountryParser.parseCountryCode('NG').phoneCode}".obs;

 var flag = "${CountryParser.parseCountryCode('NG').flagEmoji}".obs;

  // var selectedCountry = CountryParser.parseCountryCode("IN").obs;



  void updateSelectedCountry(Country newCountry) {
    print("utils controller" + phoneCode.value.toString());
    // phoneCode.value = newCountry.phoneCode.toString();
    flag.value = newCountry.flagEmoji.toString();
    update();

  }
  void updatePhoneCode(String newCountry) {
    print("utils controller" + newCountry.toString());
    phoneCode.value = newCountry;
    // flag.value = newCountry.flagEmoji.toString();
    update();

  }

  void updateFlag(String newCountry) {
    print("utils controller" + newCountry.toString());
    flag.value = newCountry;
    // flag.value = newCountry.flagEmoji.toString();
    update();

  }
  // void updateSelectedCountry(Country newCountry) {
  //   print("utils controller" + phoneCode.value.toString());
  //   phoneCode.value = newCountry.phoneCode.toString();
  //   flag.value = newCountry.flagEmoji.toString();
  //   update();
  //
  // }

 void showToast(String text) {
   return toast.showToast(

     child: BuildToast(Get.context!, text),
   );
 }



 Widget BuildToast(BuildContext context, String text) {
   return Container(
     padding: EdgeInsets.symmetric(
       vertical: Dimensions.height12,
       horizontal: Dimensions.height10 * 2,
     ),
     decoration: BoxDecoration(
       color: Colors.black54,
       borderRadius: BorderRadius.circular(Dimensions.height12),
     ),
     child: Row(
       mainAxisSize: MainAxisSize.min,
       children: [
         Container(
           width: Dimensions.height10 * 2,
           height: Dimensions.height10 * 2,
           decoration: BoxDecoration(
             shape: BoxShape.circle,
             color: AppColors.purple,

           ),
           child: Center(
             child: BigText(
               text: "B",
               fontWeight: FontWeight.w700,
               size: Dimensions.font15,
               color: AppColors.white,
             ),
           ),
         ),
         SizedBox(
           width: 5,
         ),
         Text(
           text,
           style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: Dimensions.height12,
             color: AppColors.white,
             fontFamily: "NunitoSans",
           ),
         ),
       ],
     ),
   );
 }
}
