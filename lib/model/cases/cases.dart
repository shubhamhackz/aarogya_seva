import 'package:covid/model/cases/case_chart_type.dart';

class Cases {
  String confirmed;
  String active;
  String recovered;
  String deceased;
  String todayTotalCount;
  String todayRecoveredCount;
  String todayDeceasedCount;
  String yesterdatTotalCount;
  String yesterdayRecoveredCount;
  String yesterdayDeceasedCount;
  String timeStamp;
  Map<String, String> dateWiseConfirmedCases;
  Map<String, String> dateWiseRecoveredCases;
  Map<String, String> dateWiseDeceasedCases;
  Map<String, String> confirmedMinMax;
  Map<String, String> recoveredMinMax;
  Map<String, String> deceasedMinMax;

  Cases({
    this.confirmed,
    this.active,
    this.recovered,
    this.deceased,
    this.todayTotalCount,
    this.todayRecoveredCount,
    this.todayDeceasedCount,
    this.yesterdatTotalCount,
    this.yesterdayRecoveredCount,
    this.yesterdayDeceasedCount,
    this.timeStamp,
    this.dateWiseConfirmedCases,
    this.dateWiseRecoveredCases,
    this.dateWiseDeceasedCases,
    this.confirmedMinMax,
    this.recoveredMinMax,
    this.deceasedMinMax,
  });

  Map<String, String> getMinMaxValues(CaseChartType caseChartType) {
    var minMax;
    switch (caseChartType) {
      case CaseChartType.dailyconfirmed:
        minMax = confirmedMinMax;
        break;
      case CaseChartType.dailyrecovered:
        minMax = recoveredMinMax;
        break;
      case CaseChartType.dailydeceased:
        minMax = deceasedMinMax;
        break;
    }
    return minMax;
  }
}
