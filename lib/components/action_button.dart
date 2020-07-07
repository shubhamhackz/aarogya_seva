import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback buttonCallback;
  final padding;
  final color;

  ActionButton(
      {@required this.text,
      this.buttonCallback,
      this.padding,
      this.color = const Color(0xFF7777FF)});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return FlatButton(
      padding: padding ?? EdgeInsets.symmetric(vertical: height * 0.025),
      onPressed: buttonCallback ?? () {},
      child: Text(text),
      textColor: Colors.white,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    );
  }
}
