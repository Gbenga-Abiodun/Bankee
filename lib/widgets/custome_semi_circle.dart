import 'package:bankee/utils/colors.dart';
import 'package:bankee/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/svg.dart';

import '../generated/assets.dart';

class CustomeSemiCircle extends StatefulWidget {

  final String svgAsset;
  final double ProgressValue;
  const CustomeSemiCircle({Key? key, required this.ProgressValue, required this.svgAsset}) : super(key: key);

  @override
  _CustomeSemiCircleState createState() => _CustomeSemiCircleState();
}

class _CustomeSemiCircleState extends State<CustomeSemiCircle> with SingleTickerProviderStateMixin{


  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 2),);
    final curvvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = Tween<double>(begin: 0.0, end: widget.ProgressValue * math.pi).animate(curvvedAnimation)..addListener(() {
   setState(() {

   });
    });
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.height10* 8,
      height: Dimensions.height10* 8,
      child: Stack(
        children: [
          // Ensure the blue semicircle is drawn first, so it's behind the red one
          CustomPaint(
            size: Size(Dimensions.height10* 8, Dimensions.height10* 8),
            painter: ProgressArc(null, Color(0xFFE6EAEE), true),
          ),
          CustomPaint(
            size: Size(Dimensions.height10* 8, Dimensions.height10* 8),
            painter: ProgressArc(animation.value, Colors.redAccent, false),
          ),
          
          Center(
            child: SvgPicture.asset(widget.svgAsset, width: Dimensions.height10* 3, height: Dimensions.height12* 2.25, fit: BoxFit.scaleDown,),
          )
        ],
      ),
    );
  }
}




class ProgressArc extends CustomPainter {
  bool isBackground;
  double? arc;
  Color progressColor;

  ProgressArc(this.arc, this.progressColor, this.isBackground);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: Dimensions.height10* 4);
    final startAngle = -math.pi;
    final sweepAngle = arc != null ? arc : math.pi;
    final userCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    if (!isBackground) {
      // // If it's a background arc, you might want to draw another arc with a different color or style.
      // final backgroundPaint = Paint()
      //   ..strokeCap = StrokeCap.round
      //   ..color = Colors.grey // Example background color
      //   ..style = PaintingStyle.stroke
      //   ..strokeWidth = 20;
      //
      // canvas.drawArc(rect, startAngle, math.pi * 2, userCenter, backgroundPaint);
      paint.shader = AppColors.purpleLinearGradient.createShader(rect);
    }

    canvas.drawArc(rect, startAngle, sweepAngle!, userCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

