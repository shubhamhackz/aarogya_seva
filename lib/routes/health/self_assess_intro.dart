import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:covid/components/action_button.dart';

class SelfAssessIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(
          vertical: height * 0.02, horizontal: width * 0.04),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: height * 0.4,
            width: width * 0.9,
            child: Container(
              child: Lottie.asset(
                'assets/gifs/thermometer.json',
              ),
            ),
          ),
          SizedBox(height: height * 0.01),
          Text(
            'Please give correct answers',
            style: TextStyle(fontSize: 20, fontFamily: 'ProductSans'),
          ),
          SizedBox(height: height * 0.01),
          Text(
            'Acucurate answers help you better. Medical and support staff are valueble and very limited. Be a responsible citizen.',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'ProductSans',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.01),
          ActionButton(
              text: 'Proceed',
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.015, horizontal: width * 0.08)),
        ],
      ),
    );
  }
}
