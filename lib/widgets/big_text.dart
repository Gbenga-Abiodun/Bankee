import 'package:flutter/material.dart';

import '../utils/dimensions.dart';


class BigText extends StatelessWidget {
  final String text;
  final Color? color;

  final FontWeight? fontWeight;

  double size;


  BigText({Key? key, required this.text, this.color =const Color(0xFF000000), this.fontWeight = FontWeight.w200, this.size = 0, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // maxLines: 1,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontFamily: "DMSans",
        fontSize: size == 0 ? Dimensions.font18 : size,

      ),
    );
  }
}

