import 'package:covid/components/rounded_navigation_bar.dart';
import 'package:covid/routes/help.dart';
import 'package:covid/routes/health/health.dart';
import 'package:covid/routes/news/news.dart';
import 'package:covid/routes/stats.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> routes = [
    Stats(),
    Health(),
    News(),
    Help(),
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FF),
      bottomNavigationBar: RoundedNavigationBar(
        tapCallback: (index) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
      body: routes[activeIndex],
    );
  }
}
