import 'package:covid/components/stats/case_chart.dart';
import 'package:flutter/material.dart';
import 'package:covid/constants/constants.dart';
import 'package:covid/components/shimmer_container.dart';
import 'package:covid/model/cases/case_chart_type.dart';
import 'package:intl/intl.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final String totalCount;
  final String todayCount;
  final String yesterdayCount;
  final bool showShimmer;
  final CaseChartType showChartType;

  StatsCard({
    this.title,
    this.todayCount,
    this.totalCount,
    this.showShimmer = true,
    this.showChartType,
    this.yesterdayCount,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: ShapeDecoration(
        shadows: <BoxShadow>[
          kCardBoxshadow,
        ],
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: EdgeInsets.all(20.0),
      child: showShimmer
          ? showShimmerEffect(height, width)
          : showStats(height, width),
    );
  }

  Widget showStats(height, width) {
    NumberFormat formatter = NumberFormat('#,##,000');
    return Container(
      height: height * 0.135,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: const Color(0xFF7777FF),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'ProductSans'),
              ),
              Text(
                formatter.format(int.parse(totalCount)),
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontSize: 32.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: height * 0.06,
                  width: width * 0.45,
                  child: CaseChart(caseChartType: showChartType),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildExtraInfoStat(
                icon: statsIconBuilder(todayCount, yesterdayCount),
                count: todayCount,
                text: 'TODAY',
              ),
              buildExtraInfoStat(
                icon: statsIconBuilder(yesterdayCount, todayCount),
                count: yesterdayCount,
                text: 'YESTERDAY',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Icon statsIconBuilder(value, compareToValue) {
    Icon icon;
    if (int.parse(value) > int.parse(compareToValue)) {
      icon = Icon(
        Icons.arrow_upward,
        color: Colors.redAccent,
      );
    } else if (int.parse(value) < int.parse(compareToValue)) {
      icon = Icon(
        Icons.arrow_downward,
        color: Colors.greenAccent,
      );
    }
    return icon;
  }

  Column buildExtraInfoStat({Icon icon, String count, String text}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: <Widget>[
            icon == null ? Container() : icon,
            Text(
              (int.parse(count) > 0) ? '+$count' : '$count',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: const Color(0xFFAFB8BE),
          ),
        ),
      ],
    );
  }

  Row showShimmerEffect(height, width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ShimmerContainer(height: height * 0.13, width: width * 0.4),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ShimmerContainer(height: height * 0.04, width: width * 0.28),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: <Widget>[
                ShimmerContainer(height: height * 0.04, width: width * 0.28),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
