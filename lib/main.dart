import 'package:covid/routes/homepage.dart';
import 'package:covid/routes/help.dart';
import 'package:covid/routes/health/health.dart';
import 'package:covid/routes/news/news.dart';
import 'package:covid/routes/onboard/onboard.dart';
import 'package:covid/routes/onboard/onboard_images.dart';
import 'package:covid/services/svg_loader.dart';
import 'package:flutter/material.dart';
import 'package:covid/constants/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

String initialScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding().addPostFrameCallback((timeStamp) {});
  SVGLoader.loadSVG(OnboardImage.svgImages);
  initialScreen =
      await isFrstTimeUser() ? Routes.kOnboarding : Routes.kHomepage;
  print('InitialScreen : $initialScreen');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    isFrstTimeUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialScreen,
      routes: <String, WidgetBuilder>{
        Routes.kOnboarding: (context) => Onboard(),
        Routes.kHomepage: (context) => HomePage(),
        Routes.kNearBy: (context) => Health(),
        Routes.kNews: (context) => News(),
        Routes.kInfo: (context) => Help(),
      },
    );
  }
}

Future<bool> isFrstTimeUser() async {
  SharedPreferences _sharedPreferences;
  bool isFirstTimeUser;
  _sharedPreferences = await SharedPreferences.getInstance();
  if (_sharedPreferences.getBool('first_time_user') == null) {
    await _sharedPreferences.setBool('first_time_user', true);
    isFirstTimeUser = true;
    print('First Time User!!');
  } else {
    isFirstTimeUser = false;
    print('Not a First Time User');
  }
  return isFirstTimeUser;
}
