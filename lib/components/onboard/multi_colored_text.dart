import 'package:flutter/material.dart';
import 'package:covid/model/onboard/colored_text.dart';

class MultiColoredText extends StatelessWidget {
  const MultiColoredText({this.textItems});

  final List<ColoredText> textItems;
  // final TextStyle defaultStyle =
  //     const TextStyle(fontSize: 26, color: Colors.black);
  // final TextStyle coloredStyle = const TextStyle(
  //     fontSize: 26, color: Color(0xFF7777FF), fontWeight: FontWeight.w700);

  TextStyle coloredStyle(bool isViewportLarge) {
    return TextStyle(
        fontSize: isViewportLarge ? 34 : 26,
        color: Color(0xFF7777FF),
        fontWeight: FontWeight.w700);
  }

  TextStyle defaultStyle(bool isViewportLarge) {
    return TextStyle(fontSize: isViewportLarge ? 34 : 26, color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    double viewportHeight = MediaQuery.of(context).size.height;
    bool viewportLarge = viewportHeight > 800;
    return Wrap(
      alignment: WrapAlignment.center,
      children: List.generate(textItems.length, (itemCount) {
        return Text(
          textItems[itemCount].text,
          style: textItems[itemCount].colored
              ? coloredStyle(viewportLarge)
              : defaultStyle(viewportLarge),
        );
      }),
    );
  }
}
