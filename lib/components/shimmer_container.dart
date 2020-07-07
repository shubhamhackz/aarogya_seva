import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    @required this.height,
    @required this.width,
    this.firstColor,
    this.secondColor,
    this.radius = 10.0, 
  });

  final height;
  final width;
  final firstColor;
  final secondColor;
  final radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: firstColor ?? Colors.grey[100],
      highlightColor: secondColor ?? Colors.grey[200],
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          color: Colors.white,
        ),
        height: height,
        width: width,
      ),
    );
  }
}