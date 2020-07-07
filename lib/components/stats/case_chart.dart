import 'package:covid/helper/current_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:covid/model/cases/case_chart_type.dart';

class CaseChart extends StatelessWidget {
  final CaseChartType caseChartType;

  CaseChart({@required this.caseChartType});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      lineChartData(),
      swapAnimationDuration: const Duration(milliseconds: 500),
    );
  }

  LineChartData lineChartData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 30,
      maxY:
          double.parse(CurrentData.cases.getMinMaxValues(caseChartType)['max']),
      minY:
          double.parse(CurrentData.cases.getMinMaxValues(caseChartType)['min']),
      lineBarsData: linesBarData(),
      titlesData: FlTitlesData(
        show: false,
      ),
    );
  }

  List<FlSpot> populateChartData() {
    List<FlSpot> chartData = [];
    if (caseChartType == CaseChartType.dailyconfirmed) {
      double xAxis = 0;
      CurrentData.cases.dateWiseConfirmedCases.forEach(
        (key, value) {
          xAxis++;
          print('Confirmed Value: $value');
          print(
              'Confirm Value Length: ${CurrentData.cases.dateWiseConfirmedCases.length}');
          chartData.add(FlSpot(xAxis, double.parse(value)));
        },
      );
    } else if (caseChartType == CaseChartType.dailyrecovered) {
      double xAxis = 0;
      CurrentData.cases.dateWiseRecoveredCases.forEach(
        (key, value) {
          xAxis++;
          print('Recovered Value: $value');
          chartData.add(FlSpot(xAxis, double.parse(value)));
        },
      );
    } else if (caseChartType == CaseChartType.dailydeceased) {
      double xAxis = 0;
      CurrentData.cases.dateWiseDeceasedCases.forEach(
        (key, value) {
          xAxis++;
          print('Deceased Value: $value');
          chartData.add(FlSpot(xAxis, double.parse(value)));
        },
      );
    }
    print(chartData.length);
    return chartData;
  }

  List<LineChartBarData> linesBarData() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      curveSmoothness: 0.5,
      isStrokeCapRound: true,
      shadow: Shadow(blurRadius: 15, color: const Color(0xBBFF8BB5)),
      spots: populateChartData(),
      isCurved: true,
      colors: [
        const Color(0xFFFF8BB5),
      ],
      barWidth: 3.5,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: true,
        colors: [
          const Color(0x22FF8BAF),
          const Color(0x22FF8BAF),
          const Color(0x11FF8BAF)
        ],
        gradientFrom: Offset(0.4, 0.4),
        gradientTo: Offset(0.4, 0.8),
        gradientColorStops: [0.1, 0.4, 0.9],
        // gradientFrom: Offset(0.4, 0.4),
        // gradientTo: Offset(0.6, 0.8),
        // gradientColorStops: [0.1, 0.4, 0.9],
      ),
    );
    return [
      lineChartBarData1,
    ];
  }
}
