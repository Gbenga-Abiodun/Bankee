import 'package:bankee/widgets/small_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class CustomCarouselSlider extends StatefulWidget {
  CustomCarouselSlider({Key? key}) : super(key: key);

  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmallText(
            text: "\$182",
            color: _currentIndex == 0 ? AppColors.white : AppColors.white.withOpacity(0.6),
            size: Dimensions.height12 * 2.916666666666667,
          ),
          SizedBox(
            height: 3,
          ),
          SmallText(
            text: "February",
            color: _currentIndex == 0 ? AppColors.white :AppColors.white.withOpacity(0.6),
            size: Dimensions.height14,
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmallText(
            text: "\$172",
            color: _currentIndex == 1 ? AppColors.white : AppColors.white.withOpacity(0.6),
            size: Dimensions.height12 * 2.916666666666667,
          ),
          SizedBox(
            height: 3,
          ),
          SmallText(
            text: "spent this month",
            color: _currentIndex == 1 ? AppColors.white : AppColors.white.withOpacity(0.6),
            size: Dimensions.height14,
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmallText(
            text: "\$152",
            color: _currentIndex == 2 ? AppColors.white : AppColors.white.withOpacity(0.6),
            size: Dimensions.height12 * 2.916666666666667,
          ),
          SizedBox(
            height: 3,
          ),
          SmallText(
            text: "March",
            color: _currentIndex == 2 ? AppColors.white :AppColors.white.withOpacity(0.6),
            size: Dimensions.height14,
          ),
        ],
      ),
    ];

    return Container(
      child: CarouselSlider(
        items: items,
        options: CarouselOptions(
          viewportFraction: 0.5,
          animateToClosest: false,
          height: Dimensions.height10 * 10,
          initialPage: 1,
          autoPlay: false,
          enlargeCenterPage: true,
          aspectRatio: 2.0,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
