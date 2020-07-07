import 'package:flutter/material.dart';
import 'package:covid/components/shimmer_container.dart';
import 'package:intl/intl.dart';

class TitleStats extends StatelessWidget {
  TitleStats({this.totalCount, this.updateTime, this.showShimmer});

  final String totalCount;
  final String updateTime;
  final bool showShimmer;
  final NumberFormat numberFormat = NumberFormat.decimalPattern('hi');

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return showShimmer
        ? _showShimmer(height, width)
        : _showStats(height, width);
  }

  Positioned _showStats(double height, double width) {
    return Positioned(
      top: height * 0.13,
      right: height * 0.04,
      child: Column(
        children: <Widget>[
          Text(
            'Active Cases',
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.07,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '$updateTime IST',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Text(
            numberFormat.format(int.parse(totalCount)),
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.09,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Positioned _showShimmer(double height, double width) {
    return Positioned(
      top: height * 0.13,
      right: height * 0.045,
      child: Column(
        children: <Widget>[
          ShimmerContainer(
            height: height * 0.034,
            width: width * 0.4,
            firstColor: const Color(
              0x55FFFFFF,
            ),
            secondColor: const Color(0x88FFFFFF),
          ),
          SizedBox(
            height: height * 0.008,
          ),
          ShimmerContainer(
            height: height * 0.01,
            width: width * 0.4,
            firstColor: const Color(
              0x55FFFFFF,
            ),
            secondColor: const Color(0x88FFFFFF),
          ),
          SizedBox(
            height: height * 0.008,
          ),
          ShimmerContainer(
            height: height * 0.04,
            width: width * 0.5,
            firstColor: const Color(
              0x55FFFFFF,
            ),
            secondColor: const Color(0x88FFFFFF),
          ),
        ],
      ),
    );
  }
}
