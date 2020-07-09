import 'package:flutter/material.dart';

class CoronaTestRequestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(width * 0.05),
      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
      width: width * 0.9,
      height: width * 0.35,
      color: const Color(0xFFFFFFFF),
      child: Row(
        children: <Widget>[
          Container(
            height: width * 0.18,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: const Color(0xFF7777FF),
            ),
            child: Image.asset(
              'assets/images/corona_small.png',
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Coronavirus Test Request',
                      style: TextStyle(
                        fontFamily: 'ProductSans',
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: const Color(0xFF7777FF),
                      size: width * 0.08,
                    )
                  ],
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color(0xFFC5C5C5),
                      fontFamily: 'ProductSans'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
