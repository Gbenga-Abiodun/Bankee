import 'package:bankee/utils/colors.dart';
import 'package:bankee/utils/dimensions.dart';
import 'package:bankee/widgets/small_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color? color;

  final String text;
  final double? width;

  final void Function()? onTap;

  const CustomButton({Key? key, this.color, required this.text, this.onTap, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: Dimensions.height10 * 6,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Dimensions.radius10),
        ),
        child: Center(
          child: SmallText(
            text: text,
            size: Dimensions.font17,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
