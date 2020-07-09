import 'custom_icons_icons.dart';
import 'package:flutter/material.dart';

const List<IconData> kNavBarIcons = [
  CustomIcons.stats_icon_clicked,
  CustomIcons.icon_metro_stethoscope,
  CustomIcons.news_icon,
  CustomIcons.icon_awesome_hands_helping,
];

const Map<NavBarItem, String> kNavbarItems = {
  NavBarItem.stats: 'Stats',
  NavBarItem.nearby: 'Health',
  NavBarItem.news: 'News',
  NavBarItem.info: 'Help',
};

const List<String> svgs = [
  'assets/images/onboard1.svg',
  'assets/images/onboard2.svg',
  'assets/images/onboard3.svg',
  'assets/images/onboard4.svg',
];

enum NavBarItem {
  stats,
  nearby,
  news,
  info,
}

const BoxShadow kCardBoxshadow = BoxShadow(
    color: const Color(0x137777FF),
    blurRadius: 5.0,
    spreadRadius: 8.0,
    offset: Offset(6.0, 5.0));
