import 'package:flutter/material.dart';

class PreventionCard extends StatelessWidget {
  const PreventionCard({this.imageSource, this.text});

  final String imageSource;
  final String text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(
          height: width * 0.04,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.03,
          ),
          width: width * 0.24,
          height: width * 0.24,
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: const Color(0xFFFFFFFF),
            shadows: [
              BoxShadow(
                color: const Color(0x22000000),
                blurRadius: 15,
                spreadRadius: 5,
                // offset: Offset(5, 5),
              ),
            ],
          ),
          child: FittedBox(
            child: Image.asset(imageSource),
          ),
        ),
        Flexible(
          child: Container(
            width: width * 0.3,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              text,
              style:
                  TextStyle(fontSize: width * 0.042, fontFamily: 'ProductSans'),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
