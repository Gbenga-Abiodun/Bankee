import 'package:flutter/material.dart';

class AppScrollView extends StatelessWidget {
  final Widget child;

  final ScrollPhysics? physics;

  final double? height;
  const AppScrollView({Key? key, required this.child, this.physics, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: height,
        child: child,
      ),
      physics: physics,
    );
  }
}
