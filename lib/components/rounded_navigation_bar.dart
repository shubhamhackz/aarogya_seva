import 'package:flutter/material.dart';
import 'package:covid/constants/constants.dart';

class RoundedNavigationBar extends StatefulWidget {
  final Function tapCallback;

  RoundedNavigationBar({this.tapCallback});

  @override
  _RoundedNavigationBarState createState() => _RoundedNavigationBarState();
}

class _RoundedNavigationBarState extends State<RoundedNavigationBar> {
  double width;
  double height;
  NavBarItem selectedNavBarItem = NavBarItem.stats;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      width = constraint.maxWidth; //Getting the maxwidth from constraint given
      height =
          constraint.maxHeight; //Getting the maxwidth from constraint given
      return _buildNavBar();
    });
  }

  Container _buildNavBar() {
    return Container(
      margin:
          EdgeInsetsDirectional.only(start: width * 0.03, end: width * 0.03),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      padding: EdgeInsets.only(bottom: height * 0.012, top: height * 0.005),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) {
          return Flexible(
            child: GestureDetector(
              onTap: () {
                selectedNavBarItem = getNavItem(index);
                widget.tapCallback(index);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Visibility(
                    visible: selectedNavBarItem == getNavItem(index),
                    child: Container(
                      width: width * 0.008,
                      height: height * 0.008,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: const Color(0xFF7777FF),
                      ),
                    ),
                  ),
                  Icon(
                    kNavBarIcons[index],
                    size: width * 0.112,
                    color: setColor(index),
                  ),
                  Text(
                    kNavbarItems[getNavItem(index)].toString(),
                    style: TextStyle(color: setColor(index)),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  setColor(index) {
    Color color = (selectedNavBarItem == getNavItem(index))
        ? const Color(0xFF7777FF)
        : Colors.black;
    return color;
  }

  getNavItem(int index) {
    if (index == 0) {
      return NavBarItem.stats;
    } else if (index == 1) {
      return NavBarItem.nearby;
    } else if (index == 2) {
      return NavBarItem.news;
    } else if (index == 3) {
      return NavBarItem.info;
    }
  }
}
