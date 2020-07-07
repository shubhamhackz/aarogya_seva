import 'package:flutter/material.dart';
import 'package:covid/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequirementCard extends StatelessWidget {
  const RequirementCard({
    this.pictureAsset,
    this.title,
  });

  final String pictureAsset;
  final String title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(
          height: width * 0.03,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 20.0),
            padding: EdgeInsets.all(width * 0.025),
            decoration: ShapeDecoration(
              shadows: <BoxShadow>[
                kCardBoxshadow,
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
              ),
              color: Colors.white,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  pictureAsset,
                  width: width * 0.085,
                ),
                Text(
                  ' $title',
                  style: TextStyle(
                      color: const Color(0xFF473F97), fontSize: width * 0.05),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: width * 0.05,
        )
      ],
    );
  }
}
