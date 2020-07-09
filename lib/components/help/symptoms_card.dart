import 'package:flutter/material.dart';

class SymptomsCard extends StatelessWidget {
  const SymptomsCard({
    this.image,
    this.text,
  });

  final Image image;
  final String text;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Positioned(
          left: width * 0.05,
          top: height * 0.05,
          child: Container(
            height: height * 0.16,
            width: width * 0.35,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: const Color(0xFF7777FF),
              shadows: [
                BoxShadow(
                  color: const Color(0x33000000),
                  offset: Offset(5, 10),
                  blurRadius: 20,
                  spreadRadius: 7,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: width * 0.1,
          child: Column(
            children: <Widget>[
              SizedBox(
                child: image,
                height: height * 0.16,
              ),
              Text(
                text,
                style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontFamily: 'ProductSans',
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
