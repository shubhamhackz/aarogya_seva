import 'package:covid/model/cases/case_chart_type.dart';
import 'package:covid/model/cases/cases.dart';
import 'package:covid/helper/current_data.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid/components/stats/requirement_card.dart';
import 'package:covid/components/stats/stats_card.dart';
import 'package:covid/components/stats/oval_bottom_clipper.dart';
import 'package:covid/components/stats/title_stats.dart';

class Stats extends StatefulWidget {
  const Stats({
    Key key,
  }) : super(key: key);

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> with SingleTickerProviderStateMixin {
  Cases cases;
  bool isLoading = true;
  ScrollController _scrollController;

  @override
  void initState() {
    getData();
    // pullToRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return buildStatsScreen(height, width);
  }

  getData() async {
    cases = await CurrentData.refresh();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> refreshPage() async {
    isLoading = true;
    setState(() {});
    cases = await CurrentData.refresh();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget buildStatsScreen(double height, double width) {
    return RefreshIndicator(
      onRefresh: refreshPage,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: height * 0.1),
        controller: _scrollController,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height + height * 0.1,
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                height: height * 0.32,
                width: width,
                child: ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF5785f3),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          const Color(0xFF0771f6),
                          const Color(0xFF0762d5)
                        ],
                      ),
                    ),
                    padding: EdgeInsets.only(left: width * 0.05),
                    alignment: Alignment.bottomLeft,
                    child: SvgPicture.asset(
                      'assets/images/covid_man.svg',
                      height: height * 0.23,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.16,
                left: height * 0.01,
                width: width * 0.08,
                child: Visibility(
                  visible: !isLoading,
                  child: DelayedDisplay(
                    slidingCurve: Curves.easeInCubic,
                    fadingDuration: const Duration(milliseconds: 1000),
                    child: SvgPicture.asset(
                      'assets/images/corona.svg',
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.06,
                left: height * 0.16,
                child: Visibility(
                  visible: !isLoading,
                  child: DelayedDisplay(
                    slidingCurve: Curves.easeInOutCirc,
                    fadingDuration: const Duration(milliseconds: 1000),
                    slidingBeginOffset: Offset.fromDirection(100),
                    child: SvgPicture.asset(
                      'assets/images/corona.svg',
                    ),
                  ),
                ),
              ),
              TitleStats(
                showShimmer: isLoading,
                totalCount: isLoading ? '0' : cases.active,
                updateTime: isLoading ? '0' : cases.timeStamp,
              ),
              Positioned(
                top: height * 0.25,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    StatsCard(
                      showShimmer: isLoading,
                      title: 'CONFIRMED',
                      totalCount: isLoading ? '0' : cases.confirmed,
                      todayCount: isLoading ? '0' : cases.todayTotalCount,
                      yesterdayCount:
                          isLoading ? '0' : cases.yesterdatTotalCount,
                      showChartType: CaseChartType.dailyconfirmed,
                    ),
                    StatsCard(
                      showShimmer: isLoading,
                      title: 'RECOVERED',
                      totalCount: isLoading ? '0' : cases.recovered,
                      todayCount: isLoading ? '0' : cases.todayRecoveredCount,
                      yesterdayCount:
                          isLoading ? '0' : cases.yesterdayRecoveredCount,
                      showChartType: CaseChartType.dailyrecovered,
                    ),
                    StatsCard(
                      showShimmer: isLoading,
                      title: 'DECEASED',
                      totalCount: isLoading ? '0' : cases.deceased,
                      todayCount: isLoading ? '0' : cases.todayDeceasedCount,
                      yesterdayCount:
                          isLoading ? '0' : cases.yesterdayDeceasedCount,
                      showChartType: CaseChartType.dailydeceased,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      child: Text(
                        'Requirements',
                        style: TextStyle(
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.13,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          RequirementCard(
                            pictureAsset: 'assets/images/gloves.svg',
                            title: 'Gloves',
                          ),
                          RequirementCard(
                            pictureAsset: 'assets/images/mask.svg',
                            title: 'Mask',
                          ),
                          RequirementCard(
                            pictureAsset: 'assets/images/alcohol.svg',
                            title: 'Alcohol',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
