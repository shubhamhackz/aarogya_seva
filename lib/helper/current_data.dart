import 'package:covid/services/network_service.dart';
import 'package:covid/model/cases/cases.dart';

class CurrentData {
  static const String baseUrl = 'https://api.covid19india.org/data.json';
  static Cases cases = Cases();

  static Future<Cases> refresh() async {
    var result = await NetworkService.fetchData(baseUrl);
    dailyCasesUpdate(result);
    monthlyCases(result);
    yesterdayCasesUpdate();
    return cases;
  }

  static dailyCasesUpdate(result) {
    var data = result['statewise'][0];
    cases.confirmed = data['confirmed'];
    cases.active = data['active'];
    cases.recovered = data['recovered'];
    cases.deceased = data['deaths'];
    cases.todayTotalCount = data['deltaconfirmed'];
    cases.todayRecoveredCount = data['deltarecovered'];
    cases.todayDeceasedCount = data['deltadeaths'];
    cases.timeStamp = data['lastupdatedtime'];
  }

  static yesterdayCasesUpdate() {
    cases.yesterdatTotalCount = yesterdayCases(cases.dateWiseConfirmedCases);
    cases.yesterdayRecoveredCount =
        yesterdayCases(cases.dateWiseRecoveredCases);
    cases.yesterdayDeceasedCount = yesterdayCases(cases.dateWiseDeceasedCases);
  }

  static yesterdayCases(Map<String, String> data) {
    var values = data.values.toList();
    var lastValue =
        values.length - 1; //last value in the list provides the yesterday cases
    var yesterdayCases;
    for (int value = 0; value <= lastValue; value++) {
      if (value == lastValue) {
        print('Yesterday Value: ${values[lastValue]}');
        yesterdayCases = values[lastValue];
      }
    }
    return yesterdayCases;
  }

  static monthlyCases(data) {
    List<String> dates = MonthDate.generatMonthDates();
    List<String> caseType = [
      'dailyconfirmed',
      'dailyrecovered',
      'dailydeceased',
    ];
    var casesTimeSeries = data['cases_time_series'];
    var monthlyConfirmed;
    var monthlyRecovered;
    var monthlyDeceased;
    for (int caseTypeValue = 0;
        caseTypeValue < caseType.length;
        caseTypeValue++) {
      Map<String, String> dateWiseCase = {};
      for (int value = 0; value < casesTimeSeries.length; value++) {
        for (int date = 0; date < dates.length; date++) {
          if (casesTimeSeries[value]['date'].startsWith(dates[date])) {
            dateWiseCase[casesTimeSeries[value]['date']] =
                casesTimeSeries[value][caseType[caseTypeValue]];
            if (caseType[caseTypeValue] == 'dailyconfirmed') {
              monthlyConfirmed = dateWiseCase;
              cases.confirmedMinMax = calculateMinMax(dateWiseCase);
            } else if (caseType[caseTypeValue] == 'dailyrecovered') {
              monthlyRecovered = dateWiseCase;
              cases.recoveredMinMax = calculateMinMax(dateWiseCase);
            } else if (caseType[caseTypeValue] == 'dailydeceased') {
              monthlyDeceased = dateWiseCase;
              cases.deceasedMinMax = calculateMinMax(dateWiseCase);
            }
          }
        }
      }
    }
    cases.dateWiseConfirmedCases = monthlyConfirmed;
    cases.dateWiseRecoveredCases = monthlyRecovered;
    cases.dateWiseDeceasedCases = monthlyDeceased;
  }

  static Map<String, String> calculateMinMax(Map<String, String> data) {
    List values = data.values.toList();
    Map<String, String> minMax = {};
    var min = double.parse(values.first);
    var max = double.parse(values.first);
    values.forEach((element) {
      var value = double.parse(element);
      if (value < min) {
        min = value;
      }
      if (value > max) {
        max = value;
      }
    });
    print('Min: $min');
    print('Max: $max');
    minMax['min'] = min.toString();
    minMax['max'] = max.toString();
    return minMax;
  }
}

class MonthDate {
  static List<String> generatMonthDates() {
    var dates = <String>[];
    DateTime currentDate = DateTime.now();
    for (int i = 0; i <= 30; i++) {
      var date = currentDate.subtract(Duration(days: i));
      var month = getMonth(date.month);
      dates.add('${date.day.toString().padLeft(2, '0')} $month');
    }
    //print(dates);
    return dates;
  }

  static String getMonth(int monthvalue) {
    String month;
    switch (monthvalue) {
      case 1:
        month = 'January';
        break;
      case 2:
        month = 'February';
        break;
      case 3:
        month = 'March';
        break;
      case 4:
        month = 'April';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'June';
        break;
      case 7:
        month = 'July';
        break;
      case 8:
        month = 'August';
        break;
      case 9:
        month = 'September';
        break;
      case 10:
        month = 'October';
        break;
      case 11:
        month = 'November';
        break;
      case 12:
        month = 'December';
        break;
    }
    return month;
  }
}
