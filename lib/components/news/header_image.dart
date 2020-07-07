import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {

  const HeaderImage({
    @required this.imageURL,
    @required this.text,
  });

  final String imageURL;
  final String text;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.05,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            imageURL,
          ),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            const Color(0x33000000),
            BlendMode.multiply,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: width * 0.054,
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontFamily: 'ProductSans',
        ),
      ),
      alignment: Alignment.bottomCenter,
    );
  }
}