import 'package:bankee/utils/colors.dart';
import 'package:bankee/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  final bool autoFocus;

  final Widget? prefix;

  final bool obscureText;

  final Widget? suffix;

  final Decoration? decoration;

  final void Function(String?)? onSaved;
  final Color? fillColor;
  final void Function(String)? onFieldSubmitted;

  final BorderSide borderSide;

  final TextInputType? keyboardType;

  final List<TextInputFormatter>? inputFormatters;

  final String? Function(String?)? validator;
  const AppTextField({
    Key? key,
    required this.hintText,
    this.controller,
    required this.autoFocus,
    required this.obscureText,
    this.suffix,
    this.onSaved,
    this.validator,
    this.fillColor = const Color(0xFFF7F7F7),
    this.keyboardType = TextInputType.text,
    this.borderSide = const BorderSide(
      width: 1.0,
      color: AppColors.purple,
    ),
    this.decoration, this.prefix, this.onFieldSubmitted, this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,

      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.height37,
      ),
      child: TextFormField(
        style: TextStyle(
          color: AppColors.blackText,
          fontSize: Dimensions.font15,
        ),
        autofocus: autoFocus,
        obscureText: obscureText,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onSaved: onSaved,
        validator: validator,
        cursorColor: AppColors.purple,
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
            fillColor: fillColor,
            filled: true,
            prefixIcon: prefix,
            hintText: hintText,
            suffixIcon: suffix,
            suffixStyle: TextStyle(color: Colors.black),
            // disabledBorder: ,

            // contentPadding: EdgeInsets.symmetric(
            //   vertical: MobileDimensions.mobile48 / 4,
            //   horizontal: MobileDimensions.mobile48 / 4,
            // ),
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
              borderSide: borderSide,
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
              // borderSide: BorderSide.none,
              borderSide: BorderSide(
                width: 0.5,
                color: AppColors.red,
              ),
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
            )),
      ),
    );
  }
}
